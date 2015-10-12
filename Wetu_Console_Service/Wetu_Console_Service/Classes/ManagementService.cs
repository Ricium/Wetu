using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wetu_Console_Service
{
    class ManagementService
    {
        public int AnimalId { get; set; }
        private string AnimalTag { get; set; }
        private DateTime BirthDate { get; set; }
        private List<BirthHistory> BirthHistories { get; set; }         //...Order by BirthDate ASC
        private List<AIHistory> AIHistories { get; set; }               //...Order by AIDate ASC
        private List<SocialGroupMales> LastSocialGroupMales { get; set; }

        public ManagementService()
        {

        }

        public ManagementService(int _AnimalId)
        {
            this.AnimalId = _AnimalId;

            this.SetAnimalDetails();
            this.SetBirthHistory();
            this.SetAIHistory();
            this.SetLastMaleSocialGroup();
        }

        public string ManageAnimal()
        {
            string retString = "";

            //...Check if animal has birth record
            if (this.BirthHistories.Count > 0)
            {
                //...Has History

                //...Check Last AI
                if (AIHistories.Count > 0)
                {
                    DateTime LastInsemination = AIHistories.Last().AIDate;

                    if (LastInsemination < DateTime.Today.AddDays(-45))
                    {
                        //...Most likely pregnant
                        retString = String.Format(ManagementMessages.Pregnant, this.AnimalTag);
                        return retString;
                    }
                }

                //...Check Last Birth Date
                DateTime LastBirth = BirthHistories.Last().BirthDate;
                if (LastBirth < DateTime.Today.AddDays(-55) && !LastBirth.Equals(DateTime.MinValue))
                {
                    //...Not ready
                    retString = String.Format(ManagementMessages.RecoveringFromBirthing, this.AnimalTag);
                    return retString;
                }

                //...Check Birth Success
                double SuccessRatio = this.GetBirthSuccessRatio();

                //...If Success is LOW
                if (SuccessRatio <= 60)
                {
                    //...Check Family Genetics
                    double FamilySuccess = this.GetFamilySuccessRatio();

                    if (FamilySuccess <= 50)
                    {
                        //...Bad Genetics
                        retString = String.Format(ManagementMessages.UnderPerformance, this.AnimalTag, SuccessRatio, FamilySuccess);
                        return retString;
                    }
                    else
                    {
                        //...Good Genetics
                        retString = String.Format(ManagementMessages.UnderPerformanceFamily, this.AnimalTag, SuccessRatio, FamilySuccess);
                        return retString;
                    }
                }
                else
                {
                    //...Success Ratio is High
                    int NumberOfAI = GetAIUsage();
                    int NumberOfNI = GetNIUsage();

                    if (NumberOfAI > NumberOfNI)
                    {
                        //...Performs better with AI
                        //...Get Best Male
                        string BestAIMale = this.GetBestAIMale();

                        retString = String.Format(ManagementMessages.RecommendAI, this.AnimalTag, BestAIMale);
                    }
                    else
                    {
                        //...Performs better with NI
                        //...Get Best Male
                        string BestNIMale = this.GetBestNIMale();
                        retString = String.Format(ManagementMessages.RecommendNI, this.AnimalTag, BestNIMale);
                    }
                }

            }
            else
            {
                //...No History = Heifer
                //retString = "This Animal is a First Year";

                //...Check Age
                double AgeInMonths = (DateTime.Today - this.BirthDate).TotalDays;
                double Age = AgeInMonths / 30.4368;

                if (Age < 15)
                {
                    retString = String.Format(ManagementMessages.FirstYearTooYoung, this.AnimalTag, Age);
                    return retString;
                }
                else
                {
                    //...Get Last Social Group Males

                    //...Check Number of Males
                    if (this.LastSocialGroupMales.Count > 0)
                    {
                        //...Natural Insemination with Best Male
                        //...Select Best Male
                        string BestMale = this.LastSocialGroupMales[0].Tag;

                        retString = String.Format(ManagementMessages.FirstYearNI, this.AnimalTag, BestMale);

                        return retString;
                    }
                    else
                    {
                        //...AI with Any Tube
                        retString = String.Format(ManagementMessages.FirstYearAI, this.AnimalTag);

                        return retString;
                    }
                }

            }

            return retString;
        }

        #region Data Retreival
        private void SetAnimalDetails()
        {
            SqlConnection sqlConn = DataBaseConnection.SqlConn();

            using (var con = sqlConn)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + StoredProcedures.GetAnimal + " @AnimalId", con))
                {
                    cmd.Parameters.AddWithValue("@AnimalId", this.AnimalId);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            this.AnimalTag = drI["TagNumber"].ToString();
                        }
                    }
                }

                con.Close();
                con.Dispose();
            }
        }

        private void SetBirthHistory()
        {
            this.BirthHistories = new List<BirthHistory>();
            BirthHistory ins;

            SqlConnection sqlConn = DataBaseConnection.SqlConn();

            using (var con = sqlConn)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + StoredProcedures.GetBirthHistory + " @AnimalId", con))
                {
                    cmd.Parameters.AddWithValue("@AnimalId", this.AnimalId);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ins = new BirthHistory();

                            if(drI["BirthDate"].Equals(DBNull.Value))
                            {
                                ins.BirthDate = DateTime.MinValue;
                            }
                            else
                            {
                                ins.BirthDate = Convert.ToDateTime(drI["BirthDate"]);
                            }

                            ins.FatherId = Convert.ToInt32(drI["MaleParentId"]);
                            ins.Success = Convert.ToBoolean(drI["Success"]);
                            ins.TubeUsed = Convert.ToInt32(drI["TubeId"]);
                            ins.WasNatural = Convert.ToBoolean(drI["WasNatural"]);
                            ins.MaleTag = drI["TagNumber"].ToString();

                            this.BirthHistories.Add(ins);
                        }
                    }
                }

                con.Close();
                con.Dispose();
            }
        }

        private void SetAIHistory()
        {
            this.AIHistories = new List<AIHistory>();
            AIHistory ins;

            SqlConnection sqlConn = DataBaseConnection.SqlConn();

            using (var con = sqlConn)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + StoredProcedures.GetAIHistory + " @AnimalId", con))
                {
                    cmd.Parameters.AddWithValue("@AnimalId", this.AnimalId);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ins = new AIHistory();
                            ins.TubeId = Convert.ToInt32(drI["TubeId"]);
                            ins.AIDate = Convert.ToDateTime(drI["ModifiedDate"]);
                            ins.MaleId = Convert.ToInt32(drI["AnimalId"]);
                            ins.MaleTag = drI["TagNumber"].ToString();

                            this.AIHistories.Add(ins);
                        }
                    }
                }

                con.Close();
                con.Dispose();
            }
        }

        private void SetLastMaleSocialGroup()
        {
            this.LastSocialGroupMales = new List<SocialGroupMales>();
            SocialGroupMales ins;

            SqlConnection sqlConn = DataBaseConnection.SqlConn();

            using (var con = sqlConn)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + StoredProcedures.GetAIHistory + " @AnimalId", con))
                {
                    cmd.Parameters.AddWithValue("@AnimalId", this.AnimalId);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ins = new SocialGroupMales();
                            ins.MaleId = Convert.ToInt32(drI["AnimalInProximity"]);
                            ins.Tag = drI["TagNumber"].ToString();

                            this.LastSocialGroupMales.Add(ins);
                        }
                    }
                }

                con.Close();
                con.Dispose();
            }
        }
        #endregion       

        #region Discions Functions
        private double GetBirthSuccessRatio()
        {
            double successCount = 0.0;

            if(this.BirthHistories.Count > 0)
            {
                foreach (BirthHistory history in this.BirthHistories)
                {
                    if (history.Success)
                    {
                        successCount++;
                    }
                }

                return successCount / this.BirthHistories.Count;
            }
            else
            {
                return successCount;
            } 
        }

        private double GetFamilySuccessRatio()
        {
            double ret = 0.0;

            SqlConnection sqlConn = DataBaseConnection.SqlConn();

            using (var con = sqlConn)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec " + StoredProcedures.GetGeneticHistory + " @AnimalId", con))
                {
                    cmd.Parameters.AddWithValue("@AnimalId", this.AnimalId);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ret = Convert.ToDouble(drI["GeneticSuccess"]);
                        }
                    }
                }

                con.Close();
                con.Dispose();
            }

            return ret;
        }

        private int GetAIUsage()
        {
            int AISuccess = 0;

            foreach(BirthHistory history in this.BirthHistories)
            {
                if(history.Success)
                {
                    if(!history.WasNatural)
                    {
                        AISuccess++;
                    }
                }
            }

            return AISuccess;
        }

        private int GetNIUsage()
        {
            int NISuccess = 0;

            foreach (BirthHistory history in this.BirthHistories)
            {
                if (history.Success)
                {
                    if (history.WasNatural)
                    {
                        NISuccess++;
                    }
                }
            }

            return NISuccess;
        }

        private string GetBestAIMale()
        {
            var grouped = this.AIHistories
                                .GroupBy(s => s.MaleId)
                                .Select(g => new { MaleId = g.Key, Count = g.Count() }).ToList();

            var ordered = grouped.OrderByDescending(x => x.Count).ToList();

            int Best = ordered.First().MaleId;

            AIHistory Selected = this.AIHistories.Where(x => x.MaleId == Best).ToList().First();
            return Selected.MaleTag;
        }

        private string GetBestNIMale()
        {
            var grouped = this.BirthHistories
                                .GroupBy(s => s.FatherId)
                                .Select(g => new { MaleId = g.Key, Count = g.Count() }).ToList();

            var ordered = grouped.OrderByDescending(x => x.Count).ToList();

            int Best = ordered.First().MaleId;

            BirthHistory Selected = this.BirthHistories.Where(x => x.FatherId == Best).ToList().First();
            return Selected.MaleTag;
        }
        #endregion
    }
}

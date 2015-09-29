using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wetu_Console_Service
{
    class ManagementService
    {
        public int AnimalId { get; set; }
        private DateTime BirthDate { get; set; }
        private List<BirthHistory> BirthHistories { get; set; }         //...Order by BirthDate ASC
        private List<AIHistory> AIHistories { get; set; }               //...Order by AIDate ASC
        private List<int> LastSocialGroupMales { get; set; }

        public ManagementService()
        {

        }

        public ManagementService(int _AnimalId)
        {
            this.AnimalId = _AnimalId;

            //...Get Animal Details
            //...Get BirthHistories
            //...Get AIHistories
        }

        public string ManageAnimal()
        {
            string retString = "";

            //...Check if animal has birth record
            if(this.BirthHistories.Count > 0)
            {
                //...Has History

                //...Check Last AI
                if(AIHistories.Count > 0)
                {
                    DateTime LastInsemination = AIHistories.Last().AIDate; 
 
                    if(LastInsemination < DateTime.Today.AddDays(-45))
                    {
                        //...Most likely pregnant
                        retString = "This animal is most likely pregnant";
                        return retString;
                    }                    
                }

                //...Check Last Birth Date
                DateTime LastBirth = BirthHistories.Last().BirthDate;
                if(LastBirth < DateTime.Today.AddDays(-55))
                {
                    //...Not ready
                    retString = "This animal is not ready to be inseminated yet";
                    return retString;
                }

                //...Check Birth Success
                double SuccessRatio = GetBirthSuccessRatio();

                //...If Success is LOW
                if(SuccessRatio <= 60)
                {
                    //...Check Family Genetics
                    double FamilySuccess = GetBirthSuccessRatio();

                    if(FamilySuccess <= 50)
                    {
                        //...Bad Genetics
                        retString = "This animal is underperforming in birthing, please take own action";
                        return retString;
                    }
                    else
                    {
                        //...Good Genetics
                        retString = "This animal is underperforming in birthing, but genetics show good bloodline, use either Artificial or Natural Insemination";
                        return retString;
                    }
                }
                else
                {
                    //...Success Ratio is High
                    int NumberOfAI = GetAIUsage();
                    int NumberOfNI = GetNIUsage();

                    if(NumberOfAI > NumberOfNI)
                    {
                        //...Performs better with AI
                        retString = retString + "\nThis Animal should be Artificially Inseminated with any Tube";
                    }
                    else
                    {
                        //...Performs better with NI
                        retString = retString + "\nThis Animal should be Naturally Inseminated with any Male";
                    }
                }
                
            }
            else
            {
                //...No History = Heifer
                retString = "This Animal is a First Year";

                //...Check Age
                double AgeInMonths =  (DateTime.Today - this.BirthDate).TotalDays;
                double Age = AgeInMonths / 30.4368;

                if(Age < 15)
                {
                    retString = retString + "\nThis Animal is too young to birth";
                }
                else
                {
                    //...Get Last Social Group Males

                    //...Check Number of Males
                    if (this.LastSocialGroupMales.Count > 0)
                    {
                        //...Natural Insemination with Best Male
                        //...Select Best Male
                        int BestMale = this.LastSocialGroupMales[0];

                        retString = retString + "\nThis Animal should be held with AnimalId: " + BestMale.ToString();
                    }
                    else
                    {
                        //...AI with Any Tube
                        retString = retString + "\nThis Animal should be Artificially Inseminated with any Tube";
                    }
                }
                
            }

            return retString;
        }

        private double GetBirthSuccessRatio()
        {
            return 0.0;
        }

        private int GetAIUsage()
        {
            return 0;
        }

        private int GetNIUsage()
        {
            return 0;
        }
    }
}

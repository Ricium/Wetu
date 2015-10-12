using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PushbulletSharp;
using PushbulletSharp.Models.Requests;
using PushbulletSharp.Models.Responses;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using System.Net;
using System.Configuration;
using System.IO;
using System.Net.Mail;

namespace Wetu_Console_Service
{
    public class Setup
    {
        #region Private Variables
        private int EventId { get; set; }
        private EventLog EventLog { get; set; }

        private int SocialHistoryDays { get; set; }
        private int SocialSensitivity { get; set; }
        private double InteractionSensitivity { get; set; }
        private double InteractionTimeSensitivity { get; set; }

        public List<int> Animals { get; set; }

        private List<InteractionDB> AllInteractions { get; set; }
        private List<InteractionDB> AllInteractionsLast { get; set; }

        private List<InteractionLog> Interactions { get; set; }
        private List<InteractionLog> InteractionsLast { get; set; }
        
        private List<SocialGroup> SocialGroups { get; set; }
        private List<SocialGroup> SocialGroupsLast { get; set; }
        private List<int> EstrousSocialActivity { get; set; }

        private List<InteractionCount> NumberOfInteractions { get; set; }
        private List<InteractionCount> TimeOfInteractions { get; set; }
        #endregion

        #region Class Functions
        public Setup(int _Sensitivity, int _SocialHistoryDays, int _InteractionSensitivity, int _InteractionTimeSensitivity)
        {
            this.EventId = 0;            
            this.Animals = new List<int>();
            this.Interactions = new List<InteractionLog>();
            this.SocialGroups = new List<SocialGroup>();
            this.InteractionsLast = new List<InteractionLog>();
            this.SocialGroupsLast = new List<SocialGroup>();
            this.EstrousSocialActivity = new List<int>();
            this.NumberOfInteractions = new List<InteractionCount>();
            this.TimeOfInteractions = new List<InteractionCount>();

            this.SocialSensitivity = _Sensitivity;
            this.SocialHistoryDays = _SocialHistoryDays;
            this.InteractionSensitivity = _InteractionSensitivity;
            this.InteractionTimeSensitivity = _InteractionTimeSensitivity;

           // Console.WriteLine("Initializing Log @ " + DateTime.Now.ToString());
            this.InitializeLog();
           // Console.WriteLine("Setting Animals @ " + DateTime.Now.ToString());
            this.SetAnimals();
          //  Console.WriteLine("Setting Lifetime Interactions @ " + DateTime.Now.ToString());
            this.SetAllInteractions();
           // Console.WriteLine("Setting " + this.SocialHistoryDays.ToString() + " Day Interactions @ " + DateTime.Now.ToString());
            this.SetAllInteractionsLast();
           // Console.WriteLine("Setting Estrous Animals based on Social Groups @ " + DateTime.Now.ToString());
            this.SetSocialGroups();
            this.SetSocialGroupsLast();
            this.SetEstorusAnimals(this.SocialSensitivity);
           // Console.WriteLine("Setting Interaction Averages @ " + DateTime.Now.ToString());
            this.SetNumberOfInteractions();
           // Console.WriteLine("Setting Interaction Time Averages @ " + DateTime.Now.ToString());
            this.SetInteractionTimes();
        }

        public List<InteractionLog> GetInteractions()
        {
            return this.Interactions;
        }
        #endregion

        #region Event Log Functions
        private void InitializeLog()
        {
            this.EventLog = new EventLog(EventSources.SOURCE);
            this.EventLog.Source = EventSources.SOURCE;
            this.EventLog.WriteEntry(LogMessages.START_SERVICE, EventTypes.Information, this.GetEventId(), EventCategories.SERVICE_EVENT);
        }

        public int GetEventId()
        {
            return ++this.EventId;
        }        

        public void WriteLog(string Message, EventLogEntryType Type, short Category)
        {
            this.EventLog.WriteEntry(Message, Type, this.GetEventId(), Category);
        }
        #endregion

        #region Notify Functions
        private void SendPushBullet(string Message, string _Title, string API, int UserNotifyId)
        {
            ///TODO: Add Client API Keys in DB
            ///TODO: Retreive Client API Key

            // v1Tftuzx00PyhMzoOdJMMbvnrDwUCvz2ZQujvKinowKOW
            PushbulletClient client = new PushbulletClient(API);

            var currentUserInformation = client.CurrentUsersInformation();

            if (currentUserInformation != null)
            {
                PushNoteRequest reqeust = new PushNoteRequest()
                {
                    Email = currentUserInformation.Email,
                    Title = _Title,
                    Body = Message
                };

                PushResponse response = client.PushNote(reqeust);

                LogNotification(UserNotifyId, Message);
            }
        }

        private void SendSMS(string Message, string Number, int UserNotifyId)
        {
            WebClient client = new WebClient();

            client.Headers.Add("user-agent", "Mozilla/4.0(compatible; MSIE 6.0; Windows NT 5.2; .NET CLR1.0.3705;)");

            try
            {
                var appSettings = ConfigurationManager.AppSettings;

                if (appSettings.Count == 0)
                {
                    Console.WriteLine("AppSettings is empty.");
                }
                else
                {
                    //...SMS Details
                    client.QueryString.Add("user", appSettings["SMSUSER"]);
                    client.QueryString.Add("password", appSettings["SMSPASS"]);
                    client.QueryString.Add("api_id", appSettings["SMSAPI"]);
                    client.QueryString.Add("to", Number);
                    client.QueryString.Add("text", Message);

                    //...Send SMS
                    Stream data = client.OpenRead(NotificationTitles.SMS_BASE);

                    //...Check for Errors
                    StreamReader reader = new StreamReader(data);
                    string ret = reader.ReadToEnd();
                    data.Close();
                    reader.Close();

                    LogNotification(UserNotifyId, Message);
                }
            }
            catch (ConfigurationErrorsException)
            {
                Console.WriteLine("Error reading app settings");
            }

            
        }

        private void SendEmail(string Message, string Address, int UserNotifyId)
        {
            var appSettings = ConfigurationManager.AppSettings;

            MailAddress to = new MailAddress(Address);
            MailAddress from = new MailAddress(appSettings["EMAIL"]);

            MailMessage mail = new MailMessage(from, to);
            mail.Subject = "Project Wetu: Estrous Alert";
            mail.Body = Message;

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;

            smtp.Credentials = new NetworkCredential(appSettings["EMAIL"], appSettings["EMAILPASS"]);
            smtp.EnableSsl = true;
            smtp.Send(mail);

            LogNotification(UserNotifyId, Message);
        }

        public void SendNotifications(int AnimalId, string Message, string _Title)
        {
            //...Get APIs for AnimalId
            List<NotificationAPI> NotifyList = new List<NotificationAPI>();
            NotificationAPI ins;

            SqlConnection sqlConn = DataBaseConnection.SqlConn();

            using (var con = sqlConn)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec notify_GetUserAPIsForAnimal @AnimalId", con))
                {
                    cmd.Parameters.AddWithValue("@AnimalId", AnimalId);

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            ins = new NotificationAPI();
                            ins.UserNotificationId = Convert.ToInt32(drI["UserNotificationId"]);
                            ins.NotificationType = Convert.ToInt32(drI["NotificationType"]);
                            ins.API = drI["API"].ToString();
                            NotifyList.Add(ins);
                        }
                    }
                }
            }

            sqlConn.Close();

            //...Send Notifications
            foreach(NotificationAPI notify in NotifyList)
            {
                switch (notify.NotificationType)
                {
                    case LookUpValues.Email:        SendEmail(Message, notify.API, notify.UserNotificationId); break;
                    case LookUpValues.SMS:          SendSMS(Message, notify.API, notify.UserNotificationId); break;
                    case LookUpValues.PushBullet:   SendPushBullet(Message, _Title, notify.API, notify.UserNotificationId); break;
                    default: break;
                }
            }
        }

        private void LogNotification(int UserNotificationId, string Message)
        {
            SqlConnection con = DataBaseConnection.SqlConn();
            con.Open();

            SqlCommand cmdI = con.CreateCommand();
            SqlTransaction trx = con.BeginTransaction("Add_Notification");

            cmdI.Connection = con;
            cmdI.Transaction = trx;

            try
            {
                cmdI.Parameters.Clear();
                cmdI.CommandText = "usp_t_NotificationsInsert";
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@UserNotificationId", UserNotificationId);
                cmdI.Parameters.AddWithValue("@Message", Message);
                cmdI.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                int ret = (int)cmdI.ExecuteScalar();

                trx.Commit();
                cmdI.Connection.Close();
            }
            catch (SqlException ex)
            {
                if (trx != null) trx.Rollback();
            }
            finally
            {
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }

                con.Dispose();
                cmdI.Dispose();
                trx.Dispose();
            }
        }
        #endregion

        #region Database Functions
        private void SetAnimals()
        {
            this.Animals = new List<int>();

            SqlConnection sqlConn = DataBaseConnection.SqlConn();

            using (var con = sqlConn)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec usp_t_AnimalsSelectIds", con))
                {
                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            this.Animals.Add(Convert.ToInt32(drI["AnimalId"]));
                        }
                    }
                }
            }
            
            sqlConn.Close();
        }       

        private void SetAllInteractions()
        {
            List<InteractionDB> interactionLog = new List<InteractionDB>();
            InteractionDB ins;

            SqlConnection sqlConn = DataBaseConnection.SqlConn();

            using (var con = sqlConn)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec service_GetInteractionsAll", con))
                {
                    using (var drI = cmd.ExecuteReader())
                    {
                        int AnimalConnectedIndex = drI.GetOrdinal("AnimalConnectedTo");
                        int AnimalInProxIndex = drI.GetOrdinal("AnimalInProximity");
                        int NumberIndex = drI.GetOrdinal("Interactions");
                        int TimeIndex = drI.GetOrdinal("TimeConnected");

                        while (drI.Read())
                        {
                            ins = new InteractionDB();
                            ins.AnimalConnected = Convert.ToInt32(drI[AnimalConnectedIndex]);
                            ins.AnimalInProx = Convert.ToInt32(drI[AnimalInProxIndex]);
                            ins.NumberInteractions = Convert.ToInt32(drI[NumberIndex]);
                            ins.TimeInteracted = Convert.ToInt32(drI[TimeIndex]);
                            ins.InterAct = new Interaction(ins.AnimalInProx, ins.NumberInteractions, ins.TimeInteracted);
                            
                            interactionLog.Add(ins);
                        }
                    }
                }

                con.Close();
                con.Dispose();
            }

            //Console.WriteLine("Done Inserting Data in object list @ " + DateTime.Now.ToString());
            this.AllInteractions = interactionLog;
            this.SetInteractions();
            //Console.WriteLine("Done Processing List @ " + DateTime.Now.ToString());
        }

        private void SetInteractions()
        {
            List<InteractionLog> interactionLog = new List<InteractionLog>();
            Interaction ins;
            int[] aniarr = this.Animals.ToArray();

            for (int i = 0; i < aniarr.Length; i++)
            {
                InteractionLog animalLog = new InteractionLog(aniarr[i]);
                animalLog.Interactions = new List<Interaction>();

                InteractionDB[] intarr = this.AllInteractions.Where(x => x.AnimalConnected == aniarr[i]).ToArray();

                for (int j = 0; j < intarr.Length; j++)
                {
                    ins = new Interaction(intarr[j].AnimalInProx, intarr[j].NumberInteractions, intarr[j].TimeInteracted);
                    animalLog.Interactions.Add(intarr[j].InterAct);
                }

                animalLog.Interactions = animalLog.Interactions.OrderByDescending(x => x.AverageConnectionTime).ToList();
                interactionLog.Add(animalLog);
            }

            this.Interactions = interactionLog;
        }

        private void SetAllInteractionsLast()
        {
            List<InteractionDB> interactionLog = new List<InteractionDB>();
            InteractionDB ins;

            SqlConnection sqlConn = DataBaseConnection.SqlConn();

            using (var con = sqlConn)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec service_GetInteractionsAllGiveTime @StartDate, @EndDate", con))
                {
                    DateTime EndDate = DateTime.Today;
                    DateTime StartDate = EndDate.AddDays(-1 * this.SocialHistoryDays);

                    cmd.Parameters.AddWithValue("@StartDate", StartDate);
                    cmd.Parameters.AddWithValue("@EndDate", EndDate);

                    using (var drI = cmd.ExecuteReader())
                    {
                        int AnimalConnectedIndex = drI.GetOrdinal("AnimalConnectedTo");
                        int AnimalInProxIndex = drI.GetOrdinal("AnimalInProximity");
                        int NumberIndex = drI.GetOrdinal("Interactions");
                        int TimeIndex = drI.GetOrdinal("TimeConnected");

                        while (drI.Read())
                        {
                            ins = new InteractionDB();

                            ins.AnimalConnected = Convert.ToInt32(drI[AnimalConnectedIndex]);
                            ins.AnimalInProx = Convert.ToInt32(drI[AnimalInProxIndex]);
                            ins.NumberInteractions = Convert.ToInt32(drI[NumberIndex]);
                            ins.TimeInteracted = Convert.ToInt32(drI[TimeIndex]);
                            ins.InterAct = new Interaction(ins.AnimalInProx, ins.NumberInteractions, ins.TimeInteracted);

                            interactionLog.Add(ins);
                        }
                    }
                }

                con.Close();
                con.Dispose();
            }

            //Console.WriteLine("Done Inserting Data in object list @ " + DateTime.Now.ToString());
            this.AllInteractionsLast = interactionLog;
            this.SetInteractionsLast();
            //Console.WriteLine("Done Processing List @ " + DateTime.Now.ToString());
        }        

        private void SetInteractionsLast()
        {
            List<InteractionLog> interactionLog = new List<InteractionLog>();
            Interaction ins;
            int[] aniarr = this.Animals.ToArray();

            for (int i = 0; i < aniarr.Length; i++)
            {

                InteractionLog animalLog = new InteractionLog(aniarr[i]);
                animalLog.Interactions = new List<Interaction>();

                InteractionDB[] intarr = this.AllInteractionsLast.Where(x => x.AnimalConnected == aniarr[i]).ToArray();

                for (int j = 0; j < intarr.Length; j++)
                {
                    ins = new Interaction(intarr[j].AnimalInProx, intarr[j].NumberInteractions, intarr[j].TimeInteracted);
                    animalLog.Interactions.Add(ins);
                }
                
                animalLog.Interactions = animalLog.Interactions.OrderByDescending(x => x.AverageConnectionTime).ToList();
                interactionLog.Add(animalLog);
            }

            this.InteractionsLast = interactionLog;
        }

        private void SetNumberOfInteractions()
        {
            List<InteractionCount> interactionLog = new List<InteractionCount>();
            InteractionCount ins;

            SqlConnection sqlConn = DataBaseConnection.SqlConn();

            using (var con = sqlConn)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec service_GetEstrousFromInteractions @TestDate, @Sensitivity", con))
                {
                    cmd.Parameters.AddWithValue("@Testdate", DateTime.Today);
                    cmd.Parameters.AddWithValue("@Sensitivity", this.InteractionSensitivity);

                    using (var drI = cmd.ExecuteReader())
                    {
                        int AnimalId = drI.GetOrdinal("AnimalId");
                        int Average = drI.GetOrdinal("AveragePerDay");
                        int Last = drI.GetOrdinal("LastDay");

                        while (drI.Read())
                        {
                            ins = new InteractionCount();
                            ins.AnimalId = Convert.ToInt32(drI[AnimalId]);
                            ins.AveragePerDay = Convert.ToInt32(drI[Average]);
                            ins.LastPeriod = Convert.ToInt32(drI[Last]);

                            interactionLog.Add(ins);
                        }
                    }
                }

                con.Close();
                con.Dispose();
            }

            //Console.WriteLine("Done Inserting Interactions in object list @ " + DateTime.Now.ToString());
            this.NumberOfInteractions = interactionLog;
        }

        private void SetInteractionTimes()
        {
            List<InteractionCount> interactionLog = new List<InteractionCount>();
            InteractionCount ins;

            SqlConnection sqlConn = DataBaseConnection.SqlConn();

            using (var con = sqlConn)
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec service_GetEstrousFromInteractionTime @TestDate, @Sensitivity", con))
                {
                    cmd.Parameters.AddWithValue("@Testdate", DateTime.Today);
                    cmd.Parameters.AddWithValue("@Sensitivity", this.InteractionSensitivity);

                    using (var drI = cmd.ExecuteReader())
                    {
                        int AnimalId = drI.GetOrdinal("AnimalId");
                        int Average = drI.GetOrdinal("AveragePerDay");
                        int Last = drI.GetOrdinal("LastDay");

                        while (drI.Read())
                        {
                            ins = new InteractionCount();
                            ins.AnimalId = Convert.ToInt32(drI[AnimalId]);
                            ins.AveragePerDay = Convert.ToInt32(drI[Average]);
                            ins.LastPeriod = Convert.ToInt32(drI[Last]);

                            interactionLog.Add(ins);
                        }
                    }
                }

                con.Close();
                con.Dispose();
            }

            //Console.WriteLine("Done Inserting Interaction Times in object list @ " + DateTime.Now.ToString());
            this.TimeOfInteractions = interactionLog;
        }
        #endregion

        #region Social Group Functions
        public List<SocialGroup> GetSocialGroups()
        {
            //SetSocialGroups();
            return this.SocialGroups;
        }

        public List<SocialGroup> GetSocialGroupsLast()
        {
            //SetSocialGroupsLast();
            return this.SocialGroupsLast;
        }

        public List<int> GetEstrousAnimals()
        {
            return this.EstrousSocialActivity;
        }

        private void SetSocialGroups()
        {
            SocialGroup ins;
            InteractionLog[] intarr = this.Interactions.ToArray();
            for (int i = 0; i < intarr.Length; i++)
            {
                //...Get Top 5 Highest Average Times
                ins = new SocialGroup();
                ins.AnimalId = intarr[i].AnimalId;
                ins.AnimalsInGroup = intarr[i].Interactions.Select(x => x.AnimalId).ToList();
                this.SocialGroups.Add(ins);
            }
        }

        private void SetSocialGroupsLast()
        {
            SocialGroup ins;
            InteractionLog[] intarr = this.InteractionsLast.ToArray();
            for (int i = 0; i < intarr.Length; i++)
            {
                //...Get Top 5 Highest Average Times
                ins = new SocialGroup();
                ins.AnimalId = intarr[i].AnimalId;
                ins.AnimalsInGroup = intarr[i].Interactions.Select(x => x.AnimalId).ToList();
                this.SocialGroupsLast.Add(ins);
            }
        }

        private void SetEstorusAnimals(int Sensitivity)
        {
            for (int i = 0; i < this.SocialGroupsLast.Count; i++)
            {
                if (ShowsEstrousSocialBehaviour(SocialGroups[i].AnimalsInGroup, SocialGroupsLast[i].AnimalsInGroup, Sensitivity))
                {
                    this.EstrousSocialActivity.Add(SocialGroupsLast[i].AnimalId);
                }
            }
        }

        private bool CompareSocialGroups(SocialGroup SocialGroupA, SocialGroup SocialGroupB)
        {
            SocialGroupA.AnimalsInGroup.Sort();
            SocialGroupB.AnimalsInGroup.Sort();

            return SocialGroupA.AnimalsInGroup.SequenceEqual(SocialGroupB.AnimalsInGroup);
        }

        private bool ShowsEstrousSocialBehaviour(List<int> HistoricSocialGroup, List<int> CurrentSocialGroup, int Sensitivity)
        {
            List<bool> Hits = new List<bool>();
            foreach (int Buddy in CurrentSocialGroup)
            {
                if (HistoricSocialGroup.Contains(Buddy))
                {
                    Hits.Add(true);
                }
                else
                {
                    Hits.Add(false);
                }
            }

            int Missfits = 0, Socialfits = 0;

            foreach (bool hit in Hits)
            {
                if (hit)
                {
                    Socialfits++;
                }
                else
                {
                    Missfits++;
                }
            }

            if (Missfits >= Sensitivity)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion

        #region Interaction Average Functions
        public List<InteractionCount> GetInteractionCounts()
        {
            return this.NumberOfInteractions;
        }

        public List<InteractionCount> GetInteractionTimes()
        {
            return this.TimeOfInteractions;
        }

        public List<int> GetAnimalsShowingEstrousBehaviour()
        {
            int[] interactionCounts = this.NumberOfInteractions.Select(x => x.AnimalId).ToArray();
            int[] interactionTimes = this.TimeOfInteractions.Select(x => x.AnimalId).ToArray();

            int[] both = interactionCounts.Intersect(interactionTimes).ToArray();
            int[] onlyCount = interactionCounts.Except(interactionTimes).ToArray();
            int[] onlyTime = interactionTimes.Except(interactionCounts).ToArray();

            int[] socialEstrousAnimals = this.EstrousSocialActivity.ToArray();

            List<int> MostLikely = new List<int>();

            for (int i = 0; i < onlyCount.Length; i++)
            { 
                if(socialEstrousAnimals.Contains(onlyCount[i]))
                {
                    MostLikely.Add(onlyCount[i]);
                }
            }

            for (int i = 0; i < onlyTime.Length; i++)
            {
                if (socialEstrousAnimals.Contains(onlyTime[i]))
                {
                    MostLikely.Add(onlyTime[i]);
                }
            }

            for (int i = 0; i < both.Length; i++)
            {
                MostLikely.Add(both[i]);
            }
            
             return MostLikely.Distinct().ToList();
        }
        #endregion

        #region Unused
        private void SetInteractionsFromDB()
        {
            List<InteractionLog> interactionLog = new List<InteractionLog>();
            Interaction ins;

            SqlConnection sqlConn;

            foreach (int AnimalId in this.Animals)
            {
                InteractionLog animalLog = new InteractionLog(AnimalId);
                animalLog.Interactions = new List<Interaction>();
                sqlConn = DataBaseConnection.SqlConn();

                using (var con = sqlConn)
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("exec service_GetInteractions @AnimalId", con))
                    {
                        cmd.Parameters.AddWithValue("@AnimalId", AnimalId);

                        using (var drI = cmd.ExecuteReader())
                        {
                            while (drI.Read())
                            {
                                ins = new Interaction(Convert.ToInt32(drI["AnimalInProximity"]),
                                                      Convert.ToInt32(drI["Interactions"]),
                                                      Convert.ToInt32(drI["TimeConnected"]));

                                animalLog.Interactions.Add(ins);
                            }
                        }
                    }

                    con.Close();
                    con.Dispose();
                }
                sqlConn.Close();
                sqlConn.Dispose();
                animalLog.Interactions = animalLog.Interactions.OrderBy(x => x.AnimalId).ToList();
                interactionLog.Add(animalLog);
            }

            this.Interactions = interactionLog;
        }

        private void SetInteractionsLastFromDB()
        {
            List<InteractionLog> interactionLog = new List<InteractionLog>();
            Interaction ins;

            SqlConnection sqlConn;

            foreach (int AnimalId in this.Animals)
            {
                ////Console.WriteLine("Getting Interactions for Animal: " + AnimalId.ToString());
                InteractionLog animalLog = new InteractionLog(AnimalId);
                animalLog.Interactions = new List<Interaction>();
                sqlConn = DataBaseConnection.SqlConn();

                using (var con = sqlConn)
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("exec service_GetInteractionsGivenTime @AnimalId, @StartDate, @EndDate", con))
                    {
                        DateTime EndDate = DateTime.Today;
                        DateTime StartDate = EndDate.AddDays(-3);

                        cmd.Parameters.AddWithValue("@AnimalId", AnimalId);
                        cmd.Parameters.AddWithValue("@StartDate", StartDate);
                        cmd.Parameters.AddWithValue("@EndDate", EndDate);

                        using (var drI = cmd.ExecuteReader())
                        {
                            while (drI.Read())
                            {
                                ins = new Interaction(Convert.ToInt32(drI["AnimalInProximity"]),
                                                      Convert.ToInt32(drI["Interactions"]),
                                                      Convert.ToInt32(drI["TimeConnected"]));

                                animalLog.Interactions.Add(ins);
                            }
                        }
                    }

                    con.Close();
                    con.Dispose();
                }
                sqlConn.Close();
                sqlConn.Dispose();
                animalLog.Interactions = animalLog.Interactions.OrderBy(x => x.AnimalId).ToList();
                interactionLog.Add(animalLog);
            }

            this.InteractionsLast = interactionLog;
        }

        private List<int> GetTopFiveAnimals(List<Interaction> _Interactions)
        {
            List<int> _SocialGroup = new List<int>();

            _Interactions = _Interactions.OrderByDescending(x => x.AverageConnectionTime).ToList();

            for (int i = 0; i < 5; i++)
            {
                _SocialGroup.Add(_Interactions[i].AnimalId);
            }

            return _SocialGroup;
        }

        private void RemoveDuplicateSocialGroups()
        {
            for (int a = 0; a < this.SocialGroups.Count - 1; a++)
            {
                for (int b = 1; b < this.SocialGroups.Count; b++)
                {
                    if (CompareSocialGroups(this.SocialGroups[a], this.SocialGroups[b]))
                    {
                        this.SocialGroups.Remove(this.SocialGroups[b]);
                    }
                }
            }
        }
        #endregion        
    }
   
}

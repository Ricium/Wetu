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

namespace Wetu_Console_Service
{
    #region Service Class
    public class Setup
    {
        #region Private Variables
        private int EventId { get; set; }
        private EventLog EventLog { get; set; }

        private int SocialHistoryDays { get; set; }
        private int SocialSensitivity { get; set; }

        public List<int> Animals { get; set; }

        private List<InteractionDB> AllInteractions { get; set; }
        private List<InteractionDB> AllInteractionsLast { get; set; }

        private List<InteractionLog> Interactions { get; set; }
        private List<InteractionLog> InteractionsLast { get; set; }
        
        private List<SocialGroup> SocialGroups { get; set; }
        private List<SocialGroup> SocialGroupsLast { get; set; }
        private List<int> EstrousSocialActivity { get; set; }        
        #endregion

        #region Class Functions
        public Setup(int _Sensitivity, int _SocialHistoryDays)
        {
            this.EventId = 0;            
            this.Animals = new List<int>();
            this.Interactions = new List<InteractionLog>();
            this.SocialGroups = new List<SocialGroup>();
            this.InteractionsLast = new List<InteractionLog>();
            this.SocialGroupsLast = new List<SocialGroup>();
            this.EstrousSocialActivity = new List<int>();

            this.SocialSensitivity = _Sensitivity;
            this.SocialHistoryDays = _SocialHistoryDays;

            Console.WriteLine("Initializing Log @ " + DateTime.Now.ToString());
            this.InitializeLog();
            Console.WriteLine("Setting Animals @ " + DateTime.Now.ToString());
            this.SetAnimals();
            Console.WriteLine("Setting Lifetime Interactions @ " + DateTime.Now.ToString());
            this.SetAllInteractions();
            Console.WriteLine("Setting 3 Day Interactions @ " + DateTime.Now.ToString());
            this.SetAllInteractionsLast();
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
        public void SendPushBullet(string Message)
        {
            ///TODO: Add Client API Keys in DB
            ///TODO: Retreive Client API Key

            PushbulletClient client = new PushbulletClient("v1Tftuzx00PyhMzoOdJMMbvnrDwUCvz2ZQujvKinowKOW");

            var currentUserInformation = client.CurrentUsersInformation();

            if (currentUserInformation != null)
            {
                PushNoteRequest reqeust = new PushNoteRequest()
                {
                    Email = currentUserInformation.Email,
                    Title = NotificationTitles.WELCOME_MESSAGE,
                    Body = Message
                };

                PushResponse response = client.PushNote(reqeust);
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

            Console.WriteLine("Done Inserting Data in object list @ " + DateTime.Now.ToString());
            this.AllInteractions = interactionLog;
            this.SetInteractions();
            Console.WriteLine("Done Processing List @ " + DateTime.Now.ToString());
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

            Console.WriteLine("Done Inserting Data in object list @ " + DateTime.Now.ToString());
            this.AllInteractionsLast = interactionLog;
            this.SetInteractionsLast();
            Console.WriteLine("Done Processing List @ " + DateTime.Now.ToString());
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
        #endregion

        #region Social Group Functions
        public List<SocialGroup> GetSocialGroups()
        {
            SetSocialGroups();
            return this.SocialGroups;
        }

        public List<SocialGroup> GetSocialGroupsLast()
        {
            SetSocialGroupsLast();
            return this.SocialGroupsLast;
        }

        public List<int> GetEstrousAnimals()
        {
            SetEstorusAnimals(this.SocialSensitivity);
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
    #endregion

    #region Interaction Classes
    public class InteractionLog
    {
        public InteractionLog()
        {
            this.Interactions = new List<Interaction>();
        }

        public InteractionLog(int _AnimalId)
        {
            this.AnimalId = _AnimalId;
            this.Interactions = new List<Interaction>();
        }

        public int AnimalId { get; set; }
        public List<Interaction> Interactions { get; set; }
    }

    public class Interaction
    {
        public Interaction()
        {
        }

        public Interaction(int _AnimalId, int _NumberOfInteractions, int _TotalSecondsConnected)
        {
            this.AnimalId = _AnimalId;
            this.NumberOfInteractions = _NumberOfInteractions;
            this.TotalSecondsConnected = _TotalSecondsConnected;
            this.AverageConnectionTime = (double)this.TotalSecondsConnected / (double)this.NumberOfInteractions;
        }

        public int AnimalId { get; set; }
        public int NumberOfInteractions { get; set; }
        public int TotalSecondsConnected { get; set; }
        public double AverageConnectionTime { get; set; }
    }

    public class InteractionDB
    {
        public int AnimalConnected { get; set; }
        public Interaction InterAct { get; set; }
        public int AnimalInProx { get; set; }
        public int NumberInteractions { get; set; }
        public int TimeInteracted { get; set; }
    }
    #endregion

    #region Social Group
    public class SocialGroup
    {
        public int AnimalId { get; set; }
        public List<int> AnimalsInGroup { get; set; }
    }
    #endregion

    #region Static Strings
    public struct EventCategories
    {
        public static short SERVICE_EVENT = 1;
        public static short DATABASE_EVENT = 2;
        public static short NOTIFICATION_EVENT = 3;
    }

    public struct EventSources
    {
        public static string SOURCE = "WetuLog";
        public static string LOG = "WetuLog";
    }

    public struct LogMessages
    {
        public static string START_SERVICE = "Wetu Service Started";
        public static string STOP_SERVICE = "Wetu Service Stopped";
        public static string NOTIFY = "Wetu Service sent notification via Push Bullet";
    }

    public struct NotificationTitles
    {
        public static string WELCOME_MESSAGE = "Welcome to Wetu's Pushbullet Service";
    }

    public struct EventTypes
    {
        public static EventLogEntryType Information = EventLogEntryType.Information;
        public static EventLogEntryType Error = EventLogEntryType.Error;
        public static EventLogEntryType Warning = EventLogEntryType.Warning;
    }
    #endregion

    
}

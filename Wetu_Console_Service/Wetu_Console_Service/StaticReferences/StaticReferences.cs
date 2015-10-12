using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
        public static string ESTROUS_MESSAGE = "Estrous Alert";
        public static string SMS_BASE = "http://api.clickatell.com/http/sendmsg";
    }

    public struct EventTypes
    {
        public static EventLogEntryType Information = EventLogEntryType.Information;
        public static EventLogEntryType Error = EventLogEntryType.Error;
        public static EventLogEntryType Warning = EventLogEntryType.Warning;
    }

    public struct StoredProcedures
    {
        public static string GetAnimal = "usp_t_AnimalsSelect";
        public static string GetBirthHistory = "service_GetBirthHistoryForAnimal";
        public static string GetAIHistory = "service_GetAIHistoryForAnimal";
        public static string GetGeneticHistory = "service_GetGeneticBirthingSuccessRatio";
    }

    public struct LookUpValues
    {        
        public const int Email = 1;
        public const int SMS = 2;
        public const int PushBullet = 3;
    }

    public struct ManagementMessages
    {
        public static string Pregnant = "Animal: {0} shows Estrous Behaviour but is most likely pregnant.\n"
                                        + "Her last artificial insemination date was less than 45 days ago.";

        public static string RecoveringFromBirthing = "Animal: {0} shows Estrous Behaviour but is not ready to be inseminated yet.\n"
                                        + "She gave birth less than 55 days ago.";

        public static string UnderPerformance = "Animal: {0} shows Estrous Behaviour but is underperforming in birthing.\n"
                                        + "She show a BSR of: {1}% compared to a GBSR of: {2}%.\n"
                                        + "AI is not recommended, please take own course of action.";

        public static string UnderPerformanceFamily = "Animal: {0} shows Estrous Behaviour but is underperforming in birthing, although the bloodline shows good birthing success.\n"
                                        + "She show a BSR of: {1}% compared to a GBSR of: {2}%.\n"
                                        + "Either AI or NI with any available male is recommended.";

        public static string RecommendAI = "Animal: {0} shows Estrous Behaviour.\n"
                                            + "Historically she has had the most success with AI.\n"
                                            + "It is recommended to AI her, and if available using an AI Tube from: {1}.";

        public static string RecommendNI = "Animal: {0} shows Estrous Behaviour.\n"
                                            + "Historically she has had the most success with NI.\n"
                                            + "It is recommended to NI her. She has had the most success with {1}.";

        public static string FirstYearTooYoung = "Animal: {0} shows Estrous Behaviour.\n"
                                            + "She is a first year and has not yet given birth.\n"
                                            + "She is still young ({1} months) and it is recommended that no further actions be taken.";

        public static string FirstYearNI = "Animal: {0} shows Estrous Behaviour.\n"
                                            + "She is a first year and has not yet given birth.\n"
                                            + "A prominent male in her social groups is {1}, and it's recommended she be held with him.";

        public static string FirstYearAI = "Animal: {0} shows Estrous Behaviour.\n"
                                            + "She is a first year and has not yet given birth.\n"
                                            + "There are no prominent males in her social groups. It's recommended that she be Artificially Inseminated.";
    }
    #endregion

    
}

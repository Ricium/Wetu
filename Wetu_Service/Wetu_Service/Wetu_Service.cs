using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;
using System.Timers;
using System.Data.SqlClient;
using System.Configuration;

namespace Wetu_Service
{
    public partial class Wetu_Service : ServiceBase
    {
        private int eventId = 0;
        public string conString = "";//"Data Source=UP880115;Initial Catalog=Wetu;Persist Security Info=True;User ID=service;Password=Lekkereet1";

        public Wetu_Service()
        {
            InitializeComponent();
            InitializeLog();
            //conString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        }

        private void InitializeLog()
        {
            this.AutoLog = false;
            this.eventLog = new System.Diagnostics.EventLog();
            if (!System.Diagnostics.EventLog.SourceExists(EventSources.SOURCE))
            {
                System.Diagnostics.EventLog.CreateEventSource(EventSources.SOURCE, EventSources.LOG);
            }
            this.eventLog.Source = EventSources.SOURCE;
            this.eventLog.Log = EventSources.LOG;
        }

        private void InitializeTimer()
        {
            timer.Elapsed += new ElapsedEventHandler(on_Timer);
            timer.Interval = Setup.TIMER_SECOND*10;
            timer.Enabled = true;
            timer.Start();

            eventLog.WriteEntry(LogMessages.START_TIMER, EventLogEntryType.Information, eventId++, EventCategories.SERVICE_EVENT);
        }

        protected override void OnStart(string[] args)
        {
            eventLog.WriteEntry(LogMessages.START_SERVICE, EventLogEntryType.Information, eventId++, EventCategories.SERVICE_EVENT);

            ServiceStatus serviceStatus = new ServiceStatus();
            serviceStatus.dwCurrentState = ServiceState.SERVICE_START_PENDING;
            serviceStatus.dwWaitHint = 100000;
            SetServiceStatus(this.ServiceHandle, ref serviceStatus);

            //SqlConnection sqlConn = new SqlConnection(conString);
            eventLog.WriteEntry("Before Try", EventLogEntryType.Information, eventId++, EventCategories.DATABASE_EVENT);

            /*try
            {
                eventLog.WriteEntry("In try", EventLogEntryType.Information, eventId++, EventCategories.DATABASE_EVENT);
                con.Open();
                eventLog.WriteEntry("Open Connection", EventLogEntryType.Information, eventId++, EventCategories.DATABASE_EVENT);
            }
            catch (Exception ex)
            {
                eventLog.WriteEntry("Exception", EventLogEntryType.Information, eventId++, EventCategories.DATABASE_EVENT);
                eventLog.WriteEntry(ex.Message, EventLogEntryType.Information, eventId++, EventCategories.DATABASE_EVENT);
            }*/

            InitializeTimer();

            serviceStatus.dwCurrentState = ServiceState.SERVICE_RUNNING;
            SetServiceStatus(this.ServiceHandle, ref serviceStatus);
        }

        protected override void OnStop()
        {
            timer.Enabled = false;
            timer.Stop();
            eventLog.WriteEntry(LogMessages.STOP_TIMER, EventLogEntryType.Information, eventId++, EventCategories.SERVICE_EVENT);
            eventLog.WriteEntry(LogMessages.STOP_SERVICE, EventLogEntryType.Information, eventId++, EventCategories.SERVICE_EVENT);
        }

        [DllImport("advapi32.dll", SetLastError = true)]
        private static extern bool SetServiceStatus(IntPtr handle, ref ServiceStatus serviceStatus);

        private void on_Timer(object sender, EventArgs e)
        {
            eventLog.WriteEntry(LogMessages.TIMER_EVENT, EventLogEntryType.Information, eventId++, EventCategories.TIMER_EVENT);
            CallStoredProcMethod();
        }

        public void CallStoredProcMethod()
        {
            var task1 = System.Threading.Tasks.Task.Factory.StartNew(() => RunStoredPro());
            eventLog.WriteEntry("Waiting for thread", EventLogEntryType.Information, eventId++, EventCategories.TIMER_EVENT);
            // thread will wait there till the operation finish
            task1.Wait();
            eventLog.WriteEntry("Done with Thread", EventLogEntryType.Information, eventId++, EventCategories.TIMER_EVENT);
        }

        public void RunStoredPro()
        {
            DataBaseConnection dbConn = new DataBaseConnection();
            int DeviceId = -1;
            eventLog.WriteEntry("In Thread", EventLogEntryType.Information, eventId++, EventCategories.DATABASE_EVENT);

            var con = dbConn.SqlConn();

            try
            {
                eventLog.WriteEntry("In try", EventLogEntryType.Information, eventId++, EventCategories.DATABASE_EVENT);
                con.Open();
                eventLog.WriteEntry("Open Connection", EventLogEntryType.Information, eventId++, EventCategories.DATABASE_EVENT);
            }
            catch(Exception ex)
            {
                eventLog.WriteEntry("Exception", EventLogEntryType.Information, eventId++, EventCategories.DATABASE_EVENT);
                eventLog.WriteEntry(ex.Message, EventLogEntryType.Information, eventId++, EventCategories.DATABASE_EVENT);
            }

            /*using (var con = dbConn.SqlConn())
            {
                con.Open();
                eventLog.WriteEntry("Open Connection", EventLogEntryType.Information, eventId++, EventCategories.TIMER_EVENT);

                using (SqlCommand cmd = new SqlCommand("exec usp_t_DeviceSelectFromAddress @Address", con))
                {

                    cmd.Parameters.AddWithValue("@Address", "40BF8A9E");

                    using (var drI = cmd.ExecuteReader())
                    {
                        while (drI.Read())
                        {
                            DeviceId = Convert.ToInt32(drI["DeviceId"]);
                        }
                    }
                }
            }*/

            eventLog.WriteEntry(DeviceId.ToString(), EventLogEntryType.Information, eventId++, EventCategories.DATABASE_EVENT);

        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Wetu_Service
{
    public struct EventCategories
    {
        public static short SERVICE_EVENT = 1;
        public static short TIMER_EVENT = 2;
        public static short DATABASE_EVENT = 3;
    }

    public struct EventSources
    {
        public static string SOURCE = "WetuSource";
        public static string LOG = "WetuLog";
    }

    public struct LogMessages
    {
        public static string START_SERVICE = "Wetu Service Started";
        public static string STOP_SERVICE = "Wetu Service Stopped";
        public static string START_TIMER = "Timer Started";
        public static string STOP_TIMER = "Timer Stopped";
        public static string TIMER_EVENT = "Timer Event Started";
    }

    public struct Setup
    {
        public static int TIMER_SECOND = 1000;
        public static int TIMER_MINUTE = 60000;
        public static int TIMER_HOUR = 600000;
    }

    public enum ServiceState
    {
        SERVICE_STOPPED = 0x00000001,
        SERVICE_START_PENDING = 0x00000002,
        SERVICE_STOP_PENDING = 0x00000003,
        SERVICE_RUNNING = 0x00000004,
        SERVICE_CONTINUE_PENDING = 0x00000005,
        SERVICE_PAUSE_PENDING = 0x00000006,
        SERVICE_PAUSED = 0x00000007,
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct ServiceStatus
    {
        public long dwServiceType;
        public ServiceState dwCurrentState;
        public long dwControlsAccepted;
        public long dwWin32ExitCode;
        public long dwServiceSpecificExitCode;
        public long dwCheckPoint;
        public long dwWaitHint;
    };
}

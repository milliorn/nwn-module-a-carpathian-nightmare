#include "nwnx_redis_short"
#include "nwnx_time"
#include "nwnx_util"


void main()
{
    object oModule = GetModule();

    int timekeeper = GetLocalInt(oModule, "loadtimer");
    int iUpTime = NWNX_Time_GetTimeStamp() - GetLocalInt(oModule, "RAW_BOOT_TIME");

    if (timekeeper == 0 && iUpTime > 60)
    {
        SpeakString("Server restart in<cσσσ> 24 </c>hours.", TALKVOLUME_SHOUT);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
        return;
    }

    else if (timekeeper == 1 && iUpTime > 82800)
    {
        SpeakString("Server restart in<cσσσ> 1 </c>hour.", TALKVOLUME_SHOUT);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
        return;
    }

    else if (timekeeper == 2 && iUpTime > 84600)
    {
        SpeakString("Server restart in<cσσσ> 30 </c>minutes.", TALKVOLUME_SHOUT);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
        return;
    }

    else if (timekeeper == 3 && iUpTime > 85500)
    {
        SpeakString("Server restart in<cσσσ> 15 </c>minutes.", TALKVOLUME_SHOUT);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
        return;
    }

    else if (timekeeper == 4 && iUpTime > 86100)
    {
        SpeakString("Server restart in<cσσσ> 5 </c>minutes.", TALKVOLUME_SHOUT);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
        return;
    }

    else if (timekeeper == 5 && iUpTime > 86400)
    {
        ExecuteScript("mod_shutdown", OBJECT_SELF);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
    }
}

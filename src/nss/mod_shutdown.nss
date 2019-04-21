#include "nwnx_admin"
#include "nwnx_webhook"
#include "nwnx_time"
#include "nwnx_redis"
#include "nwnx_redis_save"

//  Boot all clients
void ChatBootAllPC(object oPC);
void ChatBootAllPC(object oPC)
{
   object oPC = GetFirstPC();
   while (GetIsObjectValid(oPC) == TRUE)
   {
      BootPC(oPC, "SERVER RESET.  You may log back in now.");
      oPC = GetNextPC();
   }
}

void main()
{
        object oPC = GetFirstPC();
        while(GetIsObjectValid(oPC))
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM), oPC);
            AssignCommand(oPC, PlaySound("as_sw_x2gong1"));
            DelayCommand(1.0, AssignCommand(oPC, PlaySound("as_sw_x2gong2")));
            DelayCommand(2.0, AssignCommand(oPC, PlaySound("vs_nx2mephm_107")));
            ExecuteScript("ws_saveall_sub", OBJECT_SELF);
            oPC = GetNextPC();
        }

        ExportAllCharacters();
        SpeakString( "All characters have been saved by auto-reboot script.", TALKVOLUME_SHOUT);

//      Send a message to ACN Discord Channel of the client logging out
        string sWebhookUrl = "/api/webhooks/472605187761242152/wqmbKttRf4VdSwhbg6C9fhy2GlQdtX8zCqohWwJesbyq3ImNx_s2AUpr0-E_p8m8VQo6/slack";
        string CurrentTime = NWNX_Time_GetSystemTime();
        string CurrentDate = NWNX_Time_GetSystemDate();
        string sMessage = GetModuleName()+ " server reset started: " + CurrentTime + " on: " + CurrentDate + " (GMT)";
        NWNX_WebHook_SendWebHookHTTPS("discordapp.com", sWebhookUrl , sMessage , "Server");

        SpeakString("<cσ  >Server restart has begun.",TALKVOLUME_SHOUT);
        DelayCommand(1.0,  SpeakString(" SERVER RESET IN <cσσσ>60</c> SECONDS!!!",TALKVOLUME_SHOUT));
        DelayCommand(30.0, SpeakString(" SERVER RESET IN <cσσσ>30</c> SECONDS!!!",TALKVOLUME_SHOUT));
        DelayCommand(45.0, SpeakString(" SERVER RESET IN <cσσσ>15</c> SECONDS!!!",TALKVOLUME_SHOUT));
        DelayCommand(50.0, SpeakString(" SERVER RESET IN <cσσσ>10</c> SECONDS!!!",TALKVOLUME_SHOUT));
        DelayCommand(55.0, SpeakString(" SERVER RESET IN <cσσσ>5</c>",TALKVOLUME_SHOUT));
        DelayCommand(56.0, SpeakString(" SERVER RESET IN <cσσσ>4</c>",TALKVOLUME_SHOUT));
        DelayCommand(57.0, SpeakString(" SERVER RESET IN <cσσσ>3</c>",TALKVOLUME_SHOUT));
        DelayCommand(58.0, SpeakString(" SERVER RESET IN <cσσσ>2</c>",TALKVOLUME_SHOUT));
        DelayCommand(59.0, SpeakString(" SERVER RESET IN <cσσσ>1</c>",TALKVOLUME_SHOUT));
        DelayCommand(60.0, SpeakString("<cσ  >SERVER RESET",TALKVOLUME_SHOUT));
        DelayCommand(61.0, ChatBootAllPC(oPC));
        DelayCommand(62.0, SaveRedis());
        DelayCommand(63.9, WriteTimestampedLogEntry("*****SERVER RESTART*****"));
        DelayCommand(64.0, NWNX_Administration_ShutdownServer());
}

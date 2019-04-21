#include "nwnx_webhook"
#include "inc_mod_events"
void main()
{
    object  oPC     = GetExitingObject(),
            oModule = GetModule();
    int     nHP     = GetCurrentHitPoints(oPC),
            nPCT    = (nHP * 100) / GetMaxHitPoints(oPC),
            iPCTot = 0;


    object oPlayer = GetFirstPC();
    while (oPlayer != OBJECT_INVALID)
    {
        iPCTot++;
        oPlayer = GetNextPC();
    }

    iPCTot = iPCTot -1;

    string sOnline = " with " + IntToString(iPCTot) + " players online.";
    string sWebhookUrl = "/api/webhooks/472605187761242152/wqmbKttRf4VdSwhbg6C9fhy2GlQdtX8zCqohWwJesbyq3ImNx_s2AUpr0-E_p8m8VQo6/slack";
    string sPCName = "Player: " + GetName(oPC) + " - Account: " + GetPCPlayerName(oPC);
    string CurrentTime = NWNX_Time_GetSystemTime();
    string CurrentDate = NWNX_Time_GetSystemDate();
    string sMessage = sPCName + " - logged out" + sOnline;

//  Send a message to ACN Discord Channel of the client logging out
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", sWebhookUrl , sMessage , "Server");

//  If we are a DM we break the script
    if (GetIsDM(oPC))return;

    // Less than 10% Hitpoints, Consider a Death Log
    if (nPCT<10 && GetIsInCombat(oPC))
    {
        object oAttacker = GetLastHostileActor(oPC);

        effect eDam = EffectDamage(nHP+20, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY);

        string sMsg = GetName(oAttacker, TRUE) + " <có  >autokilled <cfÌþ>"+GetName(oPC)+
        "<có  > for possible deathlog while in </c>COMBAT"+
        "<có  > with less than </c>10% HP!";

        SpeakString(sMsg, TALKVOLUME_SHOUT);
        AssignCommand(oAttacker, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oPC));
    }

//  Log the client leaving the server and announce their departure
    if (!GetIsDM(oPC))
    {
        SpeakString("<có  >" + GetName(oPC)+ "</c> has logged out", TALKVOLUME_SHOUT);

    }
    WriteTimestampedLogEntry("Player: "+GetName(oPC)+
    " Account: "+GetPCPlayerName(oPC)+
    " - ID: " +GetPCPublicCDKey(oPC, TRUE)+
    " IP: "+GetPCIPAddress(oPC)+ " has logged off.");

//  Store player HP's
    HitPointsAntiCheatOnExit(oPC);
}

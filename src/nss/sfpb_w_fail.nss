//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_w_fail
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
#include "sfpb_config"
#include "nwnx_redis"

int StartingConditional()
{
    // Vars
    object oPC = GetLastSpeaker();
    string sID = SF_GetPlayerID(oPC);
    int nXP = StringToInt(GetLocalString(OBJECT_SELF, "EXP"));

    //int nBanked = GetCampaignInt("BANK_XP", DATABASE_XP + sID);
    //int nBanked = GetPersistentInt(oBanker, DATABASE_XP + sID, "BANK_XP");
    int zBanked = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:xp");
    int nBanked = NWNX_Redis_GetResultAsInt(zBanked);

    // Check if the player has enough to withdraw
    return(nBanked < nXP);
}

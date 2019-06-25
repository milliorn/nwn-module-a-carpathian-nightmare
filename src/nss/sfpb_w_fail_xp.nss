//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_w_fail
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
#include "nwnx_redis"
#include "sfpb_config_xp"
int StartingConditional()
{
    // Vars
    object oPC = GetLastSpeaker();
    string sID = SF_GetPlayerID(oPC);
    int nXP = StringToInt(GetLocalString(OBJECT_SELF, "EXP"));

    int zBanked = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:xp");
    int nBanked = NWNX_Redis_GetResultAsInt(zBanked);

    // Check if the player has enough to withdraw
    return(nBanked < nXP);
}

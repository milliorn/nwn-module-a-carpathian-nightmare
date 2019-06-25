//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_w_fail
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
#include "nwnx_redis"
#include "sfpb_config"
int StartingConditional()
{
    // Vars
    object oPC = GetLastSpeaker();
    string sID = SF_GetPlayerID(oPC);
    int nGP = StringToInt(GetLocalString(OBJECT_SELF, "GOLD"));

    int zBanked = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:gold");
    int nBanked = NWNX_Redis_GetResultAsInt(zBanked);

    // Check if the player has enough to withdraw
    return(nBanked < nGP);
}

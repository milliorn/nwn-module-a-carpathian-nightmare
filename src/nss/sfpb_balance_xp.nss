//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_balance
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
#include "sfpb_config_xp"
#include "nwnx_redis"

void main()
{
    // Vars
    object oPC = GetLastSpeaker();
    string sID = SF_GetPlayerID(oPC);

    int zBanked = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:xp");
    int nBanked = NWNX_Redis_GetResultAsInt(zBanked);

    // Set custom token for the account balance
    SetCustomToken(1111, IntToString(nBanked));

    FloatingTextStringOnCreature("<cÞhè>" + GetName(oPC) +
    " has " + IntToString(nBanked) + " XP</c>.", oPC, FALSE);

    SendMessageToAllDMs("<cÞhè>" + GetName(oPC) +
    " has " + IntToString(nBanked) + " XP</c>.");
}

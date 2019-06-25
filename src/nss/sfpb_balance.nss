//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_balance
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
#include "sfpb_config"
#include "nwnx_redis"

void main()
{
    // Vars
    object oPC = GetLastSpeaker();
    string sID = SF_GetPlayerID(oPC);

    int zBanked = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:gold");
    int nBanked = NWNX_Redis_GetResultAsInt(zBanked);

    // Set custom token for the account balance
    SetCustomToken(1000, IntToString(nBanked));

    FloatingTextStringOnCreature("<cÞhè>" + GetName(oPC) +
    " has " + IntToString(nBanked) + " GP</c>.", oPC, FALSE);

    SendMessageToAllDMs("<cÞhè>" + GetName(oPC) +
    " has " + IntToString(nBanked) + " GP</c>.");

}

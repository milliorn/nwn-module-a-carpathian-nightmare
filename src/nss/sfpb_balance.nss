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
    //int nBanked = GetCampaignInt("BANK_GOLD", DATABASE_GOLD + sID);
    //int nBanked = GetPersistentInt(oPC, DATABASE_GOLD + sID, "BANK_GOLD");

    int zBanked = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:gold");
    int nBanked = NWNX_Redis_GetResultAsInt(zBanked);

    //int nBanked = StringToInt(sBanked);


    // Set custom token for the account balance
    SetCustomToken(1000, IntToString(nBanked));

    FloatingTextStringOnCreature("<cÞhè>" + GetName(oPC) +
    " has " + IntToString(nBanked) + " GP</c>.", oPC, FALSE);

    SendMessageToAllDMs("<cÞhè>" + GetName(oPC) +
    " has " + IntToString(nBanked) + " GP</c>.");

}

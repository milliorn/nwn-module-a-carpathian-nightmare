//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_withdraw
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
    object oPC = GetPCSpeaker();
    string sID = SF_GetPlayerID(oPC);

    int nWithdraw = StringToInt(GetLocalString(OBJECT_SELF, "EXP"));
    int iXP = GetXP(oPC);

    int zBanked = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:xp");
    int nBanked = NWNX_Redis_GetResultAsInt(zBanked);

    // Give the amount required to the player and store in the database
    SetXP(oPC, iXP + nWithdraw);

    int nTotal = nBanked - nWithdraw;

    string sTotal = IntToString(nTotal);
    NWNX_Redis_SET("nwserver:players:" + sID + ":bank:xp", sTotal);

    //SetCampaignInt("BANK_XP", DATABASE_XP + sID, nTotal);
    //SetPersistentInt(oBanker, DATABASE_XP + sID, nTotal, 0, "BANK_XP");

    FloatingTextStringOnCreature("<cÞhè>" + GetName(oPC) + " Has withdrawn <cþþ>" +
              IntToString(nWithdraw) + " XP</c> and has <cþþ>"+ IntToString(nTotal) +
                        " XP</c> banked and <cþþ>" + IntToString(GetXP(oPC)) +
                        " XP</c> left</c>", oPC, FALSE);

    SendMessageToAllDMs("<cÞhè>" + GetName(oPC) + " Has withdrawn <cþþ>" +
              IntToString(nWithdraw) + " XP</c> and has <cþþ>"+ IntToString(nTotal) +
                        " XP</c> banked and <cþþ>" + IntToString(GetXP(oPC)) +
                        " XP</c> left</c>");

    // Set custom token
    SetCustomToken(1111, IntToString(nTotal));
}

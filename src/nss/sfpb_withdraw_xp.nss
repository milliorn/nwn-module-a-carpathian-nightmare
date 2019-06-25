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

    FloatingTextStringOnCreature("<c�h�>" + GetName(oPC) + " Has withdrawn <c��>" +
              IntToString(nWithdraw) + " XP</c> and has <c��>"+ IntToString(nTotal) +
                        " XP</c> banked and <c��>" + IntToString(GetXP(oPC)) +
                        " XP</c> left</c>", oPC, FALSE);

    SendMessageToAllDMs("<c�h�>" + GetName(oPC) + " Has withdrawn <c��>" +
              IntToString(nWithdraw) + " XP</c> and has <c��>"+ IntToString(nTotal) +
                        " XP</c> banked and <c��>" + IntToString(GetXP(oPC)) +
                        " XP</c> left</c>");

    // Set custom token
    SetCustomToken(1111, IntToString(nTotal));
}

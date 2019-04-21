//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_deposit
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
#include "nwnx_redis"
#include "sfpb_config_xp"

void main()
{
    // Vars
    object oPC = GetPCSpeaker(), oBanker = OBJECT_SELF;
    string sID = SF_GetPlayerID(oPC);
    string sAmount = GetLocalString(oBanker, "EXP");
    int nAmount = StringToInt(sAmount);
    int nTotal;
    //int nDivide = FloatToInt(0.1);
    int iXP = GetXP(oPC);

    // Anti-Cheat Check For Duping XP
    if (GetXP(oPC) >= nAmount)
    {
        // Take the deposited amount from the player and store
        // in the database
        SetXP(oPC, iXP - nAmount);

        //int nBanked = GetCampaignInt("BANK_XP", DATABASE_XP + sID);

        //nTotal = nAmount + nBanked;
        //SetCampaignInt("BANK_XP", DATABASE_XP + sID, nTotal);

        int zBanked = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:xp");
        int nBanked = NWNX_Redis_GetResultAsInt(zBanked);

        nTotal = nAmount + nBanked;

        string sTotal = IntToString(nTotal);
        NWNX_Redis_SET("nwserver:players:" + sID + ":bank:xp", sTotal);

        // This is a temp fix to prevent from going invalid, or losing the Carp Gem.
        GiveXPToCreature(oPC, 1);

        FloatingTextStringOnCreature("<cÞhè>" + GetName(oPC) + " Has deposited <cþþ>" +
              IntToString(nAmount) + " XP</c> and has <cþþ>"+ IntToString(nTotal) +
                        " XP</c> banked and <cþþ>" + IntToString(GetXP(oPC)) +
                        " XP</c> left</c>", oPC, FALSE);

        SendMessageToAllDMs("<cÞhè>" + GetName(oPC) + " Has deposited <cþþ>" +
              IntToString(nAmount) + " XP</c> and has <cþþ>"+ IntToString(nTotal) +
                        " XP</c> banked and <cþþ>" + IntToString(GetXP(oPC)) +
                        " XP</c> left</c>");
    }
    else // Set Anti-Cheat Variable
        SetLocalInt(oBanker, "ANTI_CHEAT_XP", TRUE);

    // Set custom token
    SetCustomToken(1111, IntToString(nTotal));
}

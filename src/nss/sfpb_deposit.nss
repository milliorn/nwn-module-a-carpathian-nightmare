#include "sfpb_config"
#include "nwnx_redis"
void main()
{
    // Vars
    object oPC = GetPCSpeaker(), oBanker = OBJECT_SELF;
    string sID = SF_GetPlayerID(oPC);
    string sAmount = GetLocalString(oBanker, "GOLD");
    int nAmount = StringToInt(sAmount);
    int nTotal;

    // Anti-Cheat Check For Duping Gold
    if (GetGold(oPC) >= nAmount)
    {
        // Take the deposited amount from the player and store
        // in the database
        TakeGoldFromCreature(nAmount, oPC, TRUE);

        int zBanked = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:gold");
        int nBanked = NWNX_Redis_GetResultAsInt(zBanked);

        nTotal = nAmount + nBanked;

        string sTotal = IntToString(nTotal);
        NWNX_Redis_SET("nwserver:players:" + sID + ":bank:gold", sTotal);


        FloatingTextStringOnCreature("<cÞhè>" + GetName(oPC) + " Has deposited <cþþ>" +
              IntToString(nAmount) + " gold</c> and has <cþþ>"+ IntToString(nTotal) +
                        " gold</c> banked and <cþþ>" + IntToString(GetGold(oPC)) +
                        " gold</c> left</c>", oPC, FALSE);

        SendMessageToAllDMs("<cÞhè>" + GetName(oPC) + " Has deposited <cþþ>" +
              IntToString(nAmount) + " gold</c> and has <cþþ>"+ IntToString(nTotal) +
                        " gold</c> banked and <cþþ>" + IntToString(GetGold(oPC)) +
                        " gold</c> left</c>");
    }
    else // Set Anti-Cheat Variable
        SetLocalInt(oBanker, "ANTI_CHEAT", TRUE);

    // Set custom token
    SetCustomToken(1000, IntToString(nTotal));
}

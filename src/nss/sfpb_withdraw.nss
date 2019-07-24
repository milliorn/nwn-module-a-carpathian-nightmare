#include "sfpb_config"
#include "nwnx_redis"

void main()
{
    // Vars
    object oPC = GetPCSpeaker();
    string sID = SF_GetPlayerID(oPC);

    int nWithdraw = StringToInt(GetLocalString(OBJECT_SELF, "GOLD"));

    int zBanked = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:gold");
    int nBanked = NWNX_Redis_GetResultAsInt(zBanked);

    // Give the amount required to the player and store in the database
    GiveGoldToCreature(oPC, nWithdraw);

    int nTotal = nBanked - nWithdraw;

    string sTotal = IntToString(nTotal);
    NWNX_Redis_SET("nwserver:players:" + sID + ":bank:gold", sTotal);


    FloatingTextStringOnCreature("<c�h�>" + GetName(oPC) + " Has withdrawn <c��>" +
              IntToString(nWithdraw) + " gold</c> and has <c��>"+ IntToString(nTotal) +
                        " gold</c> banked and <c��>" + IntToString(GetGold(oPC)) +
                        " gold</c> left</c>", oPC, FALSE);

    SendMessageToAllDMs("<c�h�>" + GetName(oPC) + " Has withdrawn <c��>" +
              IntToString(nWithdraw) + " gold</c> and has <c��>"+ IntToString(nTotal) +
                        " gold</c> banked and <c��>" + IntToString(GetGold(oPC)) +
                        " gold</c> left</c>");

    // Set custom token
    SetCustomToken(1000, IntToString(nWithdraw));
}

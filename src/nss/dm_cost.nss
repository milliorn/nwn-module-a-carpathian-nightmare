#include "dm_inc_forge"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int GOLD_COST = GetLocalInt(OBJECT_SELF,"GoldCost");
    int TOKEN_COST = GetLocalInt(OBJECT_SELF,"TokenCost");


    if(PAYMENT_METHOD == 1) // gold payment
        return GetGold(oPC) >= GOLD_COST;

    else
    if(PAYMENT_METHOD == 2) // token payment
        return GetHasTokens(oPC,TOKEN_COST);

    else
    if(PAYMENT_METHOD == 3) // gold and token payment
        return GetGold(oPC) >= GOLD_COST && GetHasTokens(oPC,TOKEN_COST);

    else
        return FALSE;
}

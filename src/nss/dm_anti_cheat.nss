#include "dm_inc_forge"

int StartingConditional()
{
    int GOLD = GetLocalInt(OBJECT_SELF,"GoldCost");
    int TOKEN = GetLocalInt(OBJECT_SELF,"TokenCost");

    if (PAYMENT_METHOD == 1)
        return GetGold(GetPCSpeaker()) < GOLD;
    else
    if (PAYMENT_METHOD == 2)
        return !GetHasTokens(GetPCSpeaker(), TOKEN);
    else
    if (PAYMENT_METHOD == 3)
        return GetGold(GetPCSpeaker()) < GOLD && !GetHasTokens(GetPCSpeaker(),TOKEN);
    else
        return FALSE;
}

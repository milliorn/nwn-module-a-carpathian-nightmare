#include "x2_inc_itemprop"

int StartingConditional()
{
    object oTarget = GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)));
    return (IPGetIsRangedWeapon(oTarget));
}

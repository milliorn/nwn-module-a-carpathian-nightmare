#include "dm_inc_forge"
int StartingConditional()
{
    object oItem = GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)));

    if(LIMIT_SPELL_LEVEL)
    {
        return GetHitDice(GetPCSpeaker()) >= 15 && !IsBaseItemWand(oItem);
    }
    else
        return !IsBaseItemWand(oItem);
}

#include "dm_inc_forge"
#include "dm_inc_const"

int StartingConditional()
{
    object oTarget = GetFirstItemInInventory(GetObjectByTag("omegaforge" +
    GetStringRight(GetTag(OBJECT_SELF),1)));

    if  (ALLOW_FORGE_ARMOR_CLASS == TRUE)
    {
        return !(IPGetIsRangedWeapon(oTarget) || IPGetIsMeleeWeapon(oTarget) ||
                (GetBaseItemType(oTarget) == BASE_ITEM_GLOVES) || dmIsCEPMelee(oTarget));
    }

    else return FALSE;
}

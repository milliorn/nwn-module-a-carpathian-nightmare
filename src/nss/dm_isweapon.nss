#include "dm_inc_forge"
#include "dm_inc_const"

int StartingConditional()
{
    object oTarget = GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)));

    if  (ALLOW_FORGE_ATTACK_BONUS == TRUE)
    {

        return (IPGetIsRangedWeapon(oTarget) || IPGetIsMeleeWeapon(oTarget) ||
                dmIsCEPMelee(oTarget) || (GetBaseItemType(oTarget) == BASE_ITEM_GLOVES));
    }

    else return FALSE;
}

#include "dm_inc_forge"
#include "dm_inc_const"

int StartingConditional()
{
    object oTarget = GetFirstItemInInventory(GetObjectByTag("omegaforge" +
    GetStringRight(GetTag(OBJECT_SELF),1)));

    if  (ALLOW_FORGE_DAMAGE_BONUS == TRUE)
    {
        return (IPGetIsMeleeWeapon(oTarget) ||
        (GetBaseItemType(oTarget) == BASE_ITEM_GLOVES) ||
         dmIsCEPMelee(oTarget));
    }

    else return FALSE;
}

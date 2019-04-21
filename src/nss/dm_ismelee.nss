#include "dm_inc_forge"

int StartingConditional()
{
    object oTarget = GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)));
    return (IPGetIsMeleeWeapon(oTarget) || dmIsCEPMelee(oTarget));
}

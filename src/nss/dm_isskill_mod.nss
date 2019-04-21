#include "dm_inc_forge"
#include "dm_inc_const"

int StartingConditional()
{
    object oTarget = GetFirstItemInInventory(GetObjectByTag("omegaforge" +
    GetStringRight(GetTag(OBJECT_SELF),1)));

    if  (ALLOW_FORGE_SKILL_MODIFIER == TRUE)
    {
        return TRUE;
    }

    else return FALSE;
}



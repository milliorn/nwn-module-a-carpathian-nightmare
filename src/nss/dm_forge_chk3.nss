#include "dm_inc_forge"

int StartingConditional()
{
    object oItem = GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)));
    return (dmIsMaxLevel(oItem));
}

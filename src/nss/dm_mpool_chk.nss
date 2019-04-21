#include "dm_inc_forge"

int StartingConditional()
{
/*    object oItem = GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)));
    return (IsBaseMagicItem(oItem) && !IsModMax(oItem) && !dmIsMaxLevel(oItem));
*/
    object oItem = GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)));
    return (GetBaseItemType(oItem) == BASE_ITEM_MAGICROD ||
    GetBaseItemType(oItem) == BASE_ITEM_MAGICSTAFF ||
    GetBaseItemType(oItem) == BASE_ITEM_MAGICWAND);

}

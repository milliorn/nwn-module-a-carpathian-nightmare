#include "dm_inc_forge"

int StartingConditional()
{
    object oItem = GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)));
    return (!IsBaseMagicItem(oItem) == BASE_ITEM_MAGICROD ||
    !IsBaseMagicItem(oItem) == BASE_ITEM_MAGICSTAFF ||
    !IsBaseMagicItem(oItem) == BASE_ITEM_MAGICWAND);
}

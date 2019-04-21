int StartingConditional()
{
    object oItem = GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)));
    object oOriginal = GetLocalObject(OBJECT_SELF,"ITEM_IN_FORGE");

    return oItem != oOriginal;
}

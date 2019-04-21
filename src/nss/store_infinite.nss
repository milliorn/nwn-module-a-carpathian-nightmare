void main()
{
    object oItem = GetFirstItemInInventory(OBJECT_SELF);
    while (GetIsObjectValid(oItem))
    {
        SetInfiniteFlag(oItem, TRUE);
        SetStolenFlag(oItem, FALSE);
        oItem = GetNextItemInInventory(OBJECT_SELF);
    }
}

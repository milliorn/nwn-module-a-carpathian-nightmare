int StartingConditional()
{
    object oH = GetItemInSlot(INVENTORY_SLOT_HEAD, GetPCSpeaker());
    if (GetLocalInt(oH, "NON_CRAFTABLE"))
    {
        return FALSE;
    }
    if (!GetIsObjectValid(oH))
    {
        return FALSE;
    }
    return TRUE;
}

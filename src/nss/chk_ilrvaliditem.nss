int StartingConditional()
{
    return !GetIsObjectValid(GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1))));
}

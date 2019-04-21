int StartingConditional()
{
    int iResult = 0;

    object oItem = GetFirstItemInInventory(GetObjectByTag("ChestofNames" + GetStringRight(GetTag(OBJECT_SELF),1)));

    while(oItem != OBJECT_INVALID)
    {
        iResult++;

        oItem = GetNextItemInInventory(GetObjectByTag("ChestofNames" + GetStringRight(GetTag(OBJECT_SELF),1)));
    }

    return iResult > 1;
}


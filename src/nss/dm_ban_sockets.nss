int StartingConditional()
{
    string sSockets = "sf_sockets";
    object oItem = GetFirstItemInInventory(GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1)));

    if (GetTag(oItem) == sSockets)
    {
        return TRUE;
    }

    else return FALSE;
}

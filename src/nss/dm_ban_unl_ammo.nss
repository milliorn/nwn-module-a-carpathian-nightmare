int StartingConditional()
{

    itemproperty ipLoop;
    object oTarget = GetFirstItemInInventory(GetObjectByTag("omegaforge" +
    GetStringRight(GetTag(OBJECT_SELF),1)));

    //Get the first itemproperty on the helmet
    ipLoop=GetFirstItemProperty(oTarget);

    //Loop for as long as the ipLoop variable is valid
    while (GetIsItemPropertyValid(ipLoop))
    {
        //If ipLoop is a true seeing property, remove it
        if (GetItemPropertyType(ipLoop)==ITEM_PROPERTY_UNLIMITED_AMMUNITION)
        return TRUE;
        //Next itemproperty on the list...
        ipLoop=GetNextItemProperty(oTarget);
   }

    return FALSE;
}

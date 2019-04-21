void main()
{
    object oItem;
    object oPC = GetExitingObject(),
           oForge1 = GetNearestObjectByTag("omegaforge1"),
           oForge2 = GetNearestObjectByTag("omegaforge2"),
           oForge3 = GetNearestObjectByTag("omegaforge3"),
           oForge4 = GetNearestObjectByTag("omegaforge4"),
           oForge5 = GetNearestObjectByTag("omegaforge5"),
           oLastUser1 = GetLocalObject(oForge1, "LAST_USER"),
           oLastUser2 = GetLocalObject(oForge2, "LAST_USER"),
           oLastUser3 = GetLocalObject(oForge3, "LAST_USER"),
           oLastUser4 = GetLocalObject(oForge4, "LAST_USER"),
           oLastUser5 = GetLocalObject(oForge5, "LAST_USER");

    // Search area to find is any players are still in area
    object oObject = GetFirstObjectInArea(OBJECT_SELF);
    while (GetIsObjectValid(oObject))
    {
        if (GetIsPC(oObject))
        {
            // Found a player exit script
            return;
        }
        oObject = GetNextObjectInArea(OBJECT_SELF);
    }
    // No players found in area so destroy all "BodyBags"
    oObject = GetFirstObjectInArea(OBJECT_SELF);
    while (GetIsObjectValid(oObject))
    {
        if (GetObjectType(oObject) == OBJECT_TYPE_PLACEABLE &&
            GetTag(oObject) == "BodyBag")
        {
            // Destroy all items in BodyBags to free up memory
            oItem = GetFirstItemInInventory(oObject);
            while (GetIsObjectValid(oItem))
            {
                AssignCommand(oItem, SetIsDestroyable(TRUE));
                CopyItem(oItem, GetObjectByTag("MarketMerchant"), TRUE);
                DestroyObject(oItem);
                oItem = GetNextItemInInventory(oObject);
            }
            AssignCommand(oObject, SetIsDestroyable(TRUE));
            DestroyObject(oObject, 0.1);
        }
        // Clear placeable inventories
        else if(GetObjectType(oObject) == OBJECT_TYPE_PLACEABLE && GetHasInventory(oObject))
        {
            DeleteLocalObject(oObject, "LAST_USER");
            oItem = GetFirstItemInInventory(oObject);
            while(GetIsObjectValid(oItem))
            {
                DestroyObject(oItem);
                oItem = GetNextItemInInventory(oObject);
            }
        }
        // Clear encounters
        else if (GetIsEncounterCreature(oObject))
        {
            AssignCommand(oObject, SetIsDestroyable(TRUE));
            DestroyObject(oObject);
        }

        else if (GetObjectType(oObject) == OBJECT_TYPE_ITEM)
        {
            AssignCommand(oObject, SetIsDestroyable(TRUE));
            DestroyObject(oObject);
        }

//      Clear NPC's
        else if (GetObjectType(oObject) == OBJECT_TYPE_CREATURE &&
                !GetAssociateType(oObject))
        {
            AssignCommand(oObject, SetIsDestroyable(TRUE));
            DestroyObject(oObject);
        }

        oObject = GetNextObjectInArea(OBJECT_SELF);
    }
}

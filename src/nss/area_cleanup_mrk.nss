//Purge Market Inventory
void MarketPurge();
void MarketPurge()
{
    int iStore = 0;
    object oStore = GetObjectByTag("MarketMerchant");
    object oItem = GetFirstItemInInventory(oStore);

    while (GetIsObjectValid(oItem))
    {
        ++iStore;
        oItem = GetNextItemInInventory(oStore);
    }

    if (iStore > 600)
    {
        object oItem = GetFirstItemInInventory(oStore);
        while (GetIsObjectValid(oItem))
        {
            DestroyObject(oItem);
            oItem = GetNextItemInInventory(oStore);
        }

        SpeakString("<c�f >Market items purged</c>", TALKVOLUME_SHOUT);
    }
}

void main()
{
    object oItem;
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
            oItem = GetFirstItemInInventory(oObject);
            while(GetIsObjectValid(oItem))
            {
                CopyItem(oItem, GetObjectByTag("MarketMerchant"), TRUE);
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

        else if(GetTag(oObject) == "merchantraregems")
        {
            oItem = GetFirstItemInInventory(oObject);
            while(GetIsObjectValid(oItem))
            {
                DestroyObject(oItem);
                oItem = GetNextItemInInventory(oObject);
            }
        }
        // Check Next object to clean
        oObject = GetNextObjectInArea(OBJECT_SELF);
    }

    MarketPurge();
}

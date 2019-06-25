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
/*
    if(GetIsAreaInterior(OBJECT_SELF) != TRUE)
    {
        SetFogAmount(FOG_TYPE_ALL, d12(), OBJECT_SELF);

        switch (Random(17))
        {
            case 0:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLACK, OBJECT_SELF); break;
            case 1:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE, OBJECT_SELF); break;
            case 2:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE_DARK, OBJECT_SELF); break;
            case 3:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN, OBJECT_SELF); break;
            case 4:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN_DARK, OBJECT_SELF); break;
            case 5:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_CYAN, OBJECT_SELF); break;
            case 6:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN, OBJECT_SELF); break;
            case 7:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN_DARK, OBJECT_SELF); break;
            case 8:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREY, OBJECT_SELF); break;
            case 9:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_MAGENTA, OBJECT_SELF); break;
            case 10: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE, OBJECT_SELF); break;
            case 11: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE_DARK, OBJECT_SELF); break;
            case 12: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED, OBJECT_SELF); break;
            case 13: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED_DARK, OBJECT_SELF); break;
            case 14: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_WHITE, OBJECT_SELF); break;
            case 15: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW, OBJECT_SELF); break;
            case 16: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW_DARK, OBJECT_SELF); break;
        }

        switch (d4())
        {
            case 1:  SetWeather(OBJECT_SELF, WEATHER_CLEAR); break;
            case 2:  SetWeather(OBJECT_SELF, WEATHER_RAIN); break;
            case 3:  SetWeather(OBJECT_SELF, WEATHER_SNOW); break;
            case 4:  SetWeather(OBJECT_SELF, WEATHER_USE_AREA_SETTINGS); break;
        }

        switch (Random(5))
        {
            case 0:  SetSkyBox(SKYBOX_DESERT_CLEAR, OBJECT_SELF); SpeakString("SKYBOX_DESERT_CLEAR", TALKVOLUME_SHOUT); break;
            case 1:  SetSkyBox(SKYBOX_GRASS_CLEAR, OBJECT_SELF); SpeakString("SKYBOX_GRASS_CLEAR", TALKVOLUME_SHOUT); break;
            case 2:  SetSkyBox(SKYBOX_GRASS_STORM, OBJECT_SELF); SpeakString("SKYBOX_GRASS_STORM", TALKVOLUME_SHOUT); break;
            case 3:  SetSkyBox(SKYBOX_ICY, OBJECT_SELF); SpeakString("SKYBOX_ICY", TALKVOLUME_SHOUT); break;
            case 4:  SetSkyBox(SKYBOX_WINTER_CLEAR, OBJECT_SELF); SpeakString("SKYBOX_WINTER_CLEAR", TALKVOLUME_SHOUT); break;
        }

    SetWeather(GetAreaFromLocation(GetStartingLocation()), WEATHER_USE_AREA_SETTINGS);

    }
*/
}

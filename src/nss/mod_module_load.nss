#include "nwnx_webhook"
#include "nwnx_time"
#include "nwnx_chat"
#include "nwnx_weapon"
#include "inc_private"

void main()
{
    object oTome = GetObjectByTag("TheBookOfLegendaryLevels"),
           oBasicLoot = GetObjectByTag("LOOT_GENERATOR"),
           oSocketLoot = GetObjectByTag("LOOT_SOCKET_GENERATOR"),
           oMiscLoot = GetObjectByTag("LOOT_MISC_GENERATOR"),
           oMod = GetModule();

    object oItem;
    object oArea;

    NWNX_Chat_RegisterChatScript("nwnx_chat_event");

    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_HANDAXE);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_LIGHTHAMMER);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_LIGHTMACE);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_SICKLE);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_DART);
    NWNX_Weapon_SetWeaponUnarmed(BASE_ITEM_DART);
    NWNX_Weapon_SetWeaponUnarmed(BASE_ITEM_SHURIKEN);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_SHURIKEN);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_QUARTERSTAFF);

//  Apply VFX to placeables in the module
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE)), oTome);

//  Create a Module Wide Dynamic Weather/Fog/Skybox system
    oArea = GetFirstArea();
    while (GetIsObjectValid(oArea))
    {
        if(GetIsAreaInterior(oArea) != TRUE)
        {
            SetSkyBox(Random(5), oArea);
            SetFogAmount(Random(2), d12() + d3(), oArea);

            switch (Random(16))
            {
                case 0:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLACK, oArea); break;
                case 1:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE, oArea); break;
                case 2:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE_DARK, oArea); break;
                case 3:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN, oArea); break;
                case 4:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN_DARK, oArea); break;
                case 5:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_CYAN, oArea); break;
                case 6:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN, oArea); break;
                case 7:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN_DARK, oArea); break;
                case 8:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREY, oArea); break;
                case 9:  SetFogColor(FOG_TYPE_ALL, FOG_COLOR_MAGENTA, oArea); break;
                case 10: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE, oArea); break;
                case 11: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE_DARK, oArea); break;
                case 12: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED, oArea); break;
                case 13: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED_DARK, oArea); break;
                case 14: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_WHITE, oArea); break;
                case 15: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW, oArea); break;
                case 16: SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW_DARK, oArea); break;
            }
        }

        oArea = GetNextArea();
    }

    oArea = GetFirstArea();
    while (GetIsObjectValid(oArea))
    {
        if(GetIsAreaInterior(oArea) != TRUE)
        {
            switch (d4(1))
            {
                case 1:  SetWeather(oArea, WEATHER_CLEAR); break;
                case 2:  SetWeather(oArea, WEATHER_RAIN); break;
                case 3:  SetWeather(oArea, WEATHER_SNOW); break;
                case 4:  SetWeather(oArea, WEATHER_USE_AREA_SETTINGS); break;
            }
        }
        oArea = GetNextArea();
    }

    SetWeather(GetAreaFromLocation(GetStartingLocation()), WEATHER_USE_AREA_SETTINGS);

//  Add vars to the loot box items because it takes too long to do them by hand
//  in the loot generator boxes.  These are cleared in the monsters OnDeath event
//  or onClientEnter event.

    oItem = GetFirstItemInInventory(oBasicLoot);
    while (GetIsObjectValid(oItem) == TRUE)
    {
        SetLocalInt(oItem, "LOOT_DROP", 1);
        oItem = GetNextItemInInventory(oBasicLoot);
    }

    oItem = GetFirstItemInInventory(oSocketLoot);
    while (GetIsObjectValid(oItem) == TRUE)
    {
        SetLocalInt(oItem, "LOOT_DROP", 1);
        oItem = GetNextItemInInventory(oSocketLoot);
    }

    oItem = GetFirstItemInInventory(oMiscLoot);
    while (GetIsObjectValid(oItem) == TRUE)
    {
        SetLocalInt(oItem, "LOOT_DROP", 1);
        oItem = GetNextItemInInventory(oMiscLoot);
    }

//  Set a var so that it can be compared in the "obj_sundial"
    int iRawBootTime = NWNX_Time_GetTimeStamp();
    string sBootTime = NWNX_Time_GetSystemTime();
    string sBootDate = NWNX_Time_GetSystemDate();
    SetLocalInt(oMod, "RAW_BOOT_TIME", iRawBootTime);
    SetLocalString(oMod, "BOOT_TIME", sBootTime);
    SetLocalString(oMod, "BOOT_DATE", sBootDate);

//  Redis DB Var
    SetLocalString(GetModule(), "SAVE_REDIS", "FALSE");

//  Make a note in Server log of when this script finishes and send a message
//  to Discord that the module is loaded.

    string sWebhookUrl = sDiscordHook;
    string CurrentTime = NWNX_Time_GetSystemTime();
    string CurrentDate = NWNX_Time_GetSystemDate();
    string sMessage = GetModuleName()+ " server is online: " + CurrentTime + " on: " + CurrentDate + " (GMT)";
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", sWebhookUrl , sMessage , "Server");
    WriteTimestampedLogEntry("***SERVER LOADED***");

    ExecuteScript("x3_mod_def_load", OBJECT_SELF);
}

//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_open
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
#include "nwnx_object"
#include "nwnx_redis"
#include "sfpb_config"

void main()
{
    // Vars
    object oPC = GetLastOpenedBy();
    object oChest = OBJECT_SELF;
    location lLoc = GetLocation(oPC);
    location lChest = GetLocation(OBJECT_SELF);

    string sID = SF_GetPlayerID(oPC);
    string sUserID = GetLocalString(oChest, "USER_ID");
    string sModName = "BANK_ITEM"; //GetName(GetModule());
    string sPlayer =  GetPCPublicCDKey(oPC, TRUE);
    string sName = GetName(oPC);

    // End script if any of these conditions are met
    if (!GetIsPC(oPC) ||
         GetIsDM(oPC) ||
         GetIsDMPossessed(oPC) ||
         GetIsPossessedFamiliar(oPC)) return;

    // If the chest is already in use then this must be a thief
    if (sUserID != "" && sUserID != sID) return;

    FloatingTextStringOnCreature("<cþf >Reminder that only a maximum of " +
    IntToString(MAX_ITEMS) + " items are allowed to be stored.</c>", oPC);

    // Set the players ID as a local string onto the chest
    // for anti theft purposes
    SetLocalString(oChest, "USER_ID", sID);

    // Get the player's storer NPC from the database
    //object oStorer = RetrieveCampaignObject(sModName, DATABASE_ITEM + sID, lLoc);
    //DeleteCampaignVariable(sModName, DATABASE_ITEM + sID);

//    string sStorer = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:item");
//    object oStorer = NWNX_Object_Deserialize(sStorer);

    int zStorer = NWNX_Redis_GET("nwserver:players:" + sID + ":bank:item");
    string sStorer = NWNX_Redis_GetResultAsString(zStorer);
    object oStorer = NWNX_Object_Deserialize(sStorer);

    // loop through the NPC storers inventory and copy the items
    // into the chest.
    object oItem = GetFirstItemInInventory(oStorer);
    while (GetIsObjectValid(oItem))
    {
        // Copy the item into the chest
        CopyItem(oItem, oChest, TRUE);

        // Destroy the original
        DestroyObject(oItem);

        // Next item
        oItem = GetNextItemInInventory(oStorer);
    }

    // Destroy the NPC storer
    DestroyObject(oStorer);

    //Visual FX
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DECK), lChest);
}

//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_used
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////

#include "sfpb_config"
void main()
{
    // Vars
    object oPC = GetLastUsedBy();
    object oChest = OBJECT_SELF;
    string sID = SF_GetPlayerID(oPC);
    string sUserID = GetLocalString(oChest, "USER_ID");
    string sModName = "BANK_ITEM"; //GetName(GetModule());

    // End script if any of these conditions are met
    if (!GetIsPC(oPC) ||
         GetIsDM(oPC) ||
         GetIsDMPossessed(oPC) ||
         GetIsPossessedFamiliar(oPC)) return;

    // If the chest is already in use then this must be a thief
    if (sUserID != "" && sUserID != sID)
    {
        AssignCommand(oPC, ClearAllActions());
        DelayCommand(6.0, FloatingTextStringOnCreature("<cþf >WARNING!  Do not disturb"
        + "<cþf > someone's Item Transfer Chest while in use.  Now, escape from jail!", oPC));
        AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("WP_JAIL"))));
        SendMessageToAllDMs(GetName(oPC) + " is trying to use a bank " +
                                           "chest that is already in use.");
    }
}

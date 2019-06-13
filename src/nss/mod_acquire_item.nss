//:://////////////////////////////////////////////
/*
    Put into: OnItemAcquire Event

*/
//:://////////////////////////////////////////////
//:: Created By: Milliorn
//:://////////////////////////////////////////////
#include "x2_inc_itemprop"
#include "inc_mod_events"
#include "x2_inc_switches"

void main()
{

    object  oPC = GetModuleItemAcquiredBy(),
            oFrom = GetModuleItemAcquiredFrom(),
            oItem = GetModuleItemAcquired();

    string  sPlayerName = GetName (oPC),
            sItemOwnerName = GetName (oFrom),
            sName = GetName(oItem),
            sArea = GetTag(GetArea(oPC));

//  Set the Gold Piece value in the items Description
    PrintGPValue(oItem);

//  Clear all Temp Item Properties so they don't become permanent
    IPRemoveAllItemProperties(oItem, DURATION_TYPE_TEMPORARY);

//  Hotfix for Evil Blight On Hit Cast Spell (Permanent) to be removed in the future
    IPRemoveMatchingItemProperties(oItem, ITEM_PROPERTY_ONHITCASTSPELL, DURATION_TYPE_PERMANENT);

//  If DM we break the script
    if (!GetIsPC(oPC)) return;

//  Identify the Acquired Item
    SetIdentified(oItem, TRUE);

//  Remove stolen flags
    DelayCommand(6.0, SetStolenFlag(oItem, FALSE));

//  Fix Barter Exploit that clones items
    if (GetIsPC(oFrom) && GetIsPC(oPC))
    {
        ExportSingleCharacter(oFrom);
        FloatingTextStringOnCreature("<c ó >Character Saved</c>", oFrom, FALSE);
        ExportSingleCharacter(oPC);
        FloatingTextStringOnCreature("<c ó >Character Saved</c>", oPC, FALSE);
        ExecuteScript("ws_saveall_sub", oFrom);
        ExecuteScript("ws_saveall_sub", oPC);
    }

//  Display Custom Message to Party to notify what loot was acquired.
    if (sName == "")
    {
         SendMsgToFactionWithinDistance(oPC,"<cfÌþ>" + sPlayerName +
         "<cóóó> accquired <cóó >Gold Pieces", 40.0);
         return;
    }

    else
    {
        if (oFrom == OBJECT_INVALID) return;

        SendMsgToFactionWithinDistance(oPC,"<cfÌþ>"+ sPlayerName +
        "<cóóó> accquired <c óó>" + sName, 40.0);
    }

//  Add a variable to be checked for Pickpocket Abuse
    if (GetStolenFlag(oItem) == TRUE && sArea == "Arena")
    {
        SendMessageToAllDMs(sPlayerName + "<cþf > has possibly stolen </c>"+ sName +
        "<cþf > from </c>"+sItemOwnerName+" in the Arena!!!.</c>");

        CopyItem(oItem, oFrom, TRUE);
        DelayCommand(1.0, DestroyObject(oItem));
        SetLocalInt(oFrom, "STOP_PICK_ABUSE", TRUE);
        DelayCommand(6.0, DeleteLocalInt(oFrom, "STOP_PICK_ABUSE"));
        FloatingTextStringOnCreature("<cóó >Pickpocketing is not allowed in the Arena!!!", oFrom, FALSE);

        ClearAllActions(FALSE);
        SetActionMode(oPC, ACTION_MODE_STEALTH, FALSE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oPC, 6.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oPC, 6.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC, 6.0);
        return;
    }

//  Check for Pickpocket Abuse
    if (GetLocalInt(oPC, "STOP_PICK_ABUSE") == TRUE)
    {
        SendMessageToAllDMs(sPlayerName + "<cþf > has possibly stolen </c>"+ sName +
        "<cþf > from </c>"+sItemOwnerName+"<có  > an has been punished for repeated"+
        " attempts at pickpocketing more than once per 6 seconds!!!");

        FloatingTextStringOnCreature("<cóó >Punished for repeated"+
        " attempts at pickpocketing more than once per 6 seconds!!!", oPC, FALSE);

        ClearAllActions(FALSE);
        SetActionMode(oPC, ACTION_MODE_STEALTH, FALSE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oPC, 6.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oPC, 6.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC, 6.0);
        return;
    }

//  Add a variable to be checked for Pickpocket Abuse
    if (GetStolenFlag(oItem) == TRUE && GetIsPC(oPC))
    {
        SendMessageToAllDMs(sPlayerName + "<cþf > has possibly stolen </c>"+ sName +
        "<cþf > from </c>"+sItemOwnerName+".</c>");

        SetLocalInt(oPC, "STOP_PICK_ABUSE", TRUE);
        DelayCommand(6.0, DeleteLocalInt(oPC, "STOP_PICK_ABUSE"));
    }

//  Mark these items cursed so they cannot be sold in store
    if (FindSubString(sName, "Asterius"))
    {
        SetPlotFlag(oItem, TRUE);
        SpeakString("fuck", TALKVOLUME_SHOUT);
    }

//  Clean off the vars that are set OnModuleLoad to mark items generated from
//  the loot chest that were obtained from chest.
    object oClean = GetFirstItemInInventory(OBJECT_SELF);
    while (GetIsObjectValid(oClean) && GetLocalInt(oClean, "LOOT_DROP"))
    {
        DeleteLocalInt(oClean, "LOOT_DROP");
        oClean = GetNextItemInInventory(OBJECT_SELF);
    }
}

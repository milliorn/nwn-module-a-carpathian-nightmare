//::///////////////////////////////////////////////
//:: Scarface's Socketed Items
//:: V2.5
//:: sf_sockets
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
#include "x2_inc_itemprop"
#include "x2_inc_switches"
#include "sf_sockets_inc"

void RemoveTempBuffs(object oItem)
{
    IPRemoveAllItemProperties(oItem, DURATION_TYPE_TEMPORARY);
}

void main() {

    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) { return; }

    object oPC = GetItemActivator();
    object oTarget = GetItemActivatedTarget();
    object oActivated = GetItemActivated();

    if (GetIsInCombat(oPC)) {

        FloatingTextStringOnCreature("You can not use this item while in combat.", oPC);
        return;
    }

    if (SF_GetIsItemActivatedValid(oActivated)) {

        SF_GetHasSockets(oPC, oActivated);
        return;
    }

    if (GetItemPossessor(oTarget) != oPC) {

        FloatingTextStringOnCreature("The targeted item is not in your possession.", oPC);
        return;
    }

    if (GetTag(oTarget) != "sf_sockets") {

        FloatingTextStringOnCreature("The targeted item can not be socketed.", oPC);
        return;
    }

    if (!SF_GetIsItemActivatedValid(oTarget)) {

        FloatingTextStringOnCreature("Invalid target.", oPC);
        return;
    }

    RemoveTempBuffs(oTarget);
    SF_SocketGemToItem(oPC, oTarget, oActivated);
}

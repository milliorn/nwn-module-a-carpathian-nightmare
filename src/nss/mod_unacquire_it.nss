#include "inc_mod_events"
#include "x2_inc_switches"
#include "x2_inc_itemprop"

void main()
{
     object oItem = GetModuleItemLost();
     object oPC = GetModuleItemLostBy();
     string sTag = GetTag(oItem);
     object oArea = GetArea(oPC);

    if (!GetIsPC(oPC)) return;

    IPRemoveAllItemProperties(oItem, DURATION_TYPE_TEMPORARY);

    PrintGPValue(oItem);
     // * Generic Item Script Execution Code
     // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // * it will execute a script that has the same name as the item's tag
     // * inside this script you can manage scripts for all events by checking against
     // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_UNACQUIRE);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

    }

//  Prevent items being dropped in a state of combat
     if (GetIsInCombat(oPC))
     {
         if (!GetStolenFlag(oItem) && nGetIsWeapon(oItem) == TRUE)
         {
             CopyItem(oItem, oPC, TRUE);
             DestroyObject(oItem, 0.2);
         }
         return;
     }

     else
     {
        DelayCommand(1.0,CheckDroppedItem(oItem, oPC));

        if (GetBaseItemType(oItem) == BASE_ITEM_TRAPKIT)
        {
            if (GetLocalInt(oArea, "NO_PVP") == TRUE)
            {
                CheckForTraps(oArea, oPC);
            }

            else
            {
                //NoTrapStacking(oPC, oItem);
            }
         }
     }
}

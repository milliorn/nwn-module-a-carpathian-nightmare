#include "x2_inc_switches"

void main()
{

    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE)
    {
        return;
    }

    object oPC          = GetItemActivator();
    object oTarget      = GetItemActivatedTarget();
    int nTargetType     = GetBaseItemType(oTarget);

    switch (nTargetType)
    {
        case BASE_ITEM_ARROW:
        case BASE_ITEM_BOLT:
        case BASE_ITEM_BULLET:  SetItemStackSize(oTarget, 999); SetPlotFlag(oTarget, TRUE); break;
        case BASE_ITEM_DART:
        case BASE_ITEM_SHURIKEN:
        case BASE_ITEM_THROWINGAXE: SetItemStackSize(oTarget, 500); SetPlotFlag(oTarget, TRUE); break;
        case BASE_ITEM_GRENADE: SetItemStackSize(oTarget, 10); SetPlotFlag(oTarget, TRUE); break;

        default: FloatingTextStringOnCreature("The Target Must Be An Ammuntion Type Item!", oPC, FALSE); break;
    }
}

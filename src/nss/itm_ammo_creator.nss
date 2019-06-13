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
        case BASE_ITEM_ARROW:       SetLocalInt(oTarget, "NO_AMMO_SALE", TRUE);
                                    SetPlotFlag(CopyItem(oTarget, oPC, TRUE), TRUE);
                                    break;

        case BASE_ITEM_BOLT:        SetPlotFlag(CopyItem(oTarget, oPC, TRUE), TRUE);
                                    break;

        case BASE_ITEM_BULLET:      SetPlotFlag(CopyItem(oTarget, oPC, TRUE), TRUE);
                                    break;

        case BASE_ITEM_DART:        SetPlotFlag(CopyItem(oTarget, oPC, TRUE), TRUE);
                                    break;

        case BASE_ITEM_SHURIKEN:    SetPlotFlag(CopyItem(oTarget, oPC, TRUE), TRUE);
                                    break;

        case BASE_ITEM_THROWINGAXE: SetPlotFlag(CopyItem(oTarget, oPC, TRUE), TRUE);
                                    break;

        case BASE_ITEM_GRENADE:     SetPlotFlag(CopyItem(oTarget, oPC, TRUE), TRUE);
                                    break;

        default: FloatingTextStringOnCreature("The Target Must Be An Ammuntion Type Item!", oPC, FALSE); break;
    }
}

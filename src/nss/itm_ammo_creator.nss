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
        case BASE_ITEM_ARROW:       SetLocalString(oTarget, "NO_AMMO_SALE", "TRUE");
                                    CopyItem(oTarget, oPC, TRUE);
                                    break;

        case BASE_ITEM_BOLT:        SetLocalString(oTarget, "NO_AMMO_SALE", "TRUE");
                                    CopyItem(oTarget, oPC, TRUE);
                                    break;

        case BASE_ITEM_BULLET:      SetLocalString(oTarget, "NO_AMMO_SALE", "TRUE");
                                    CopyItem(oTarget, oPC, TRUE);
                                    break;

        case BASE_ITEM_DART:        SetLocalString(oTarget, "NO_AMMO_SALE", "TRUE");
                                    CopyItem(oTarget, oPC, TRUE);
                                    break;

        case BASE_ITEM_SHURIKEN:    SetLocalString(oTarget, "NO_AMMO_SALE", "TRUE");
                                    CopyItem(oTarget, oPC, TRUE);
                                    break;

        case BASE_ITEM_THROWINGAXE: SetLocalString(oTarget, "NO_AMMO_SALE", "TRUE");
                                    CopyItem(oTarget, oPC, TRUE);
                                    break;

        case BASE_ITEM_GRENADE:     SetLocalString(oTarget, "NO_AMMO_SALE", "TRUE");
                                    CopyItem(oTarget, oPC, TRUE);
                                    break;

        default: FloatingTextStringOnCreature("The Target Must Be An Ammuntion Type Item!", oPC, FALSE); return; break;
    }
}

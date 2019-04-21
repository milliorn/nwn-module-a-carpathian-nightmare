#include "x2_inc_itemprop"
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

    object oArmSlot = GetItemInSlot(INVENTORY_SLOT_ARMS, oPC);
    object oArrowSlot = GetItemInSlot(INVENTORY_SLOT_ARROWS, oPC);
    object oBoltSlot = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
    object oBulletSlot = GetItemInSlot(INVENTORY_SLOT_BULLETS, oPC);
    object oSlot = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);

    itemproperty ipCurse = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_EVIL_BLIGHT, 40);

    if (GetBaseItemType(oArmSlot) == BASE_ITEM_GLOVES)
    {
        IPSafeAddItemProperty(oArmSlot, ipCurse, 1440.0);
        FloatingTextStringOnCreature("King Merry's Curse has applied to your Gloves.", oPC);
    }

    if (GetBaseItemType(oArrowSlot) == BASE_ITEM_ARROW)
    {
        IPSafeAddItemProperty(oArrowSlot, ipCurse, 1440.0);
        FloatingTextStringOnCreature("King Merry's Curse has applied to your Arrows.", oPC);
    }

    if (GetBaseItemType(oBoltSlot) == BASE_ITEM_BOLT)
    {
        IPSafeAddItemProperty(oBoltSlot, ipCurse, 1440.0);
        FloatingTextStringOnCreature("King Merry's Curse has applied to your Bolts.", oPC);
    }

    if (GetBaseItemType(oBulletSlot) == BASE_ITEM_BULLET)
    {
        IPSafeAddItemProperty(oBulletSlot, ipCurse, 1440.0);
        FloatingTextStringOnCreature("King Merry's Curse has applied to your Bullets.", oPC);
    }

    IPSafeAddItemProperty(oSlot, ipCurse, 1440.0);
    FloatingTextStringOnCreature("King Merry's Curse has applied to your Right Hand Weapon.", oPC);
    return;
}

//::///////////////////////////////////////////////
//:: NW_O2_ONOFF.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Turns the placeable object's animation on/off
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  January 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy(),
           oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);

    if (GetObjectByTag("NW_IT_TORCH001") != oItem)
    {
        SendMessageToPC(oPC, "You need a torch to light this brazier");
        return;
    }

    if (GetLocalInt(OBJECT_SELF,"NW_L_AMION") == 0)
    {

        if (!GetIsObjectValid(oItem) == BASE_ITEM_TORCH)
        {
            SendMessageToPC(oPC, "You need a torch to light this brazier");
            return;
        }

        SetLocalInt(OBJECT_SELF,"NW_L_AMION",1);
        PlayAnimation (ANIMATION_PLACEABLE_ACTIVATE);
        SetPlaceableIllumination (OBJECT_SELF, TRUE);
        RecomputeStaticLighting(GetArea(OBJECT_SELF));

        SetLocalInt(GetModule(), "rakshash2", 2);

    }
/*
    else
    {
        DeleteLocalInt(OBJECT_SELF,"NW_L_AMION");
        PlayAnimation (ANIMATION_PLACEABLE_DEACTIVATE);
        SetPlaceableIllumination (OBJECT_SELF, FALSE);
        RecomputeStaticLighting(GetArea(OBJECT_SELF));

        DeleteLocalInt(GetModule(), "rakshash2");
    }
*/
    int a = GetLocalInt(GetModule(), "rakshash");
    int b = GetLocalInt(GetModule(), "rakshash2");
    int c = GetLocalInt(GetModule(), "rakshash3");

    if (a == 2 && b == 2 && c == 2)
    {
        object door = GetObjectByTag("ravana_shop");
        AssignCommand(door, ActionOpenDoor(door));
        DelayCommand(60.0, ActionCloseDoor(door));
        DelayCommand(61.0, SetLocked(door, TRUE));
        FloatingTextStringOnCreature("You here a door open in the distance", oPC, TRUE);
    }

    DelayCommand(56.0, DeleteLocalInt(OBJECT_SELF,"NW_L_AMION"));
    DelayCommand(57.0,PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
    DelayCommand(58.0,SetPlaceableIllumination (OBJECT_SELF, FALSE));
    DelayCommand(59.0,RecomputeStaticLighting(GetArea(OBJECT_SELF)));

    DelayCommand(60.0, DeleteLocalInt(GetModule(), "rakshash2"));
}


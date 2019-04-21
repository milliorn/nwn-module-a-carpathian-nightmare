//:://////////////////////////////////////////////
//:: Created By: Rich Dersheimer
//:: Created On: July 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy(); // assign oPC to the player who pulls the lever

    if (GetTag(OBJECT_SELF) == "FloorLever1")
    {
        object oDoor = GetObjectByTag("mindoor1"); // assign oDoor the stuck door

        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE); // move the lever
        PlaySound("as_sw_lever1");
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocked(oDoor, FALSE);
        AssignCommand (oDoor, ActionOpenDoor(oDoor));
        return;
    }

    if (GetTag(OBJECT_SELF) == "FloorLever2")
    {
        object oDoor = GetObjectByTag("mindoor2"); // assign oDoor the stuck door

        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE); // move the lever
        PlaySound("as_sw_lever1");
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocked(oDoor, FALSE);
        AssignCommand (oDoor, ActionOpenDoor(oDoor));
        return;
    }

    if (GetTag(OBJECT_SELF) == "FloorLever3")
    {
        object oDoor = GetObjectByTag("mindoor3"); // assign oDoor the stuck door

        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE); // move the lever
        PlaySound("as_sw_lever1");
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocked(oDoor, FALSE);
        AssignCommand (oDoor, ActionOpenDoor(oDoor));
        return;
    }

    if (GetTag(OBJECT_SELF) == "FloorLever4")
    {
        object oDoor = GetObjectByTag("mindoor4"); // assign oDoor the stuck door

        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE); // move the lever
        PlaySound("as_sw_lever1");
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocked(oDoor, FALSE);
        AssignCommand (oDoor, ActionOpenDoor(oDoor));
        return;
    }

    if (GetTag(OBJECT_SELF) == "FloorLever5")
    {
        object oDoor = GetObjectByTag("mindoor5"); // assign oDoor the stuck door

        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE); // move the lever
        PlaySound("as_sw_lever1");
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocked(oDoor, FALSE);
        AssignCommand (oDoor, ActionOpenDoor(oDoor));
        return;
    }

    if (GetTag(OBJECT_SELF) == "FloorLever6")
    {
        object oDoor = GetObjectByTag("mindoor6"); // assign oDoor the stuck door

        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE); // move the lever
        PlaySound("as_sw_lever1");
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocked(oDoor, FALSE);
        AssignCommand (oDoor, ActionOpenDoor(oDoor));
        return;
    }

    else
    {
        SendMessageToAllDMs("ERROR: Asterius Labyrinth Script" + GetName(OBJECT_SELF));
        WriteTimestampedLogEntry("ERROR: Asterius Labyrinth Script" + GetName(OBJECT_SELF));
        return;
    }
}

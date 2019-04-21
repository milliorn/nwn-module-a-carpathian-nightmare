//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT7
/*
  Default OnDeath event handler for NPCs.

  Adjusts killer's alignment if appropriate and
  alerts allies to our death.
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////
//:://////////////////////////////////////////////////
//:: Modified By: Deva Winblood
//:: Modified On: April 1st, 2008
//:: Added Support for Dying Wile Mounted
//:://///////////////////////////////////////////////

//#include "x2_inc_compon"
//#include "x0_i0_spawncond"
#include "x3_inc_horse"

void main()
{
//    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
//    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
//    object oKiller = GetLastKiller();

    if (GetLocalInt(GetModule(),"X3_ENABLE_MOUNT_DB")&&GetIsObjectValid(GetMaster(OBJECT_SELF))) SetLocalInt(GetMaster(OBJECT_SELF),"bX3_STORE_MOUNT_INFO",TRUE);


    // If we're a good/neutral commoner,
    // adjust the killer's alignment evil
/*    if(nClass > 0 && (nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL))
    {
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }
*/
    // Call to allies to let them know we're dead
    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);

    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

    // NOTE: the OnDeath user-defined event does not
    // trigger reliably and should probably be removed
/*    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
         SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
*/
    ExecuteScript("sf_xp", OBJECT_SELF);

    object oItem = GetFirstItemInInventory(OBJECT_SELF);
    while (GetIsObjectValid(oItem) && GetLocalInt(oItem, "LOOT_DROP"))
    {
        DelayCommand(1.0, FloatingTextStringOnCreature("Loot Available", GetLastKiller(), TRUE));
        DeleteLocalInt(oItem, "LOOT_DROP");
        oItem = GetNextItemInInventory(OBJECT_SELF);
    }

    object oTargetA = GetWaypointByTag("NW_MERRY_SPAWN_A"),
           oTargetB = GetWaypointByTag("NW_MERRY_SPAWN_B"),
           oTargetC = GetWaypointByTag("NW_MERRY_SPAWN_C"),
           oTargetD = GetWaypointByTag("NW_MERRY_SPAWN_D"),
           oTargetE = GetWaypointByTag("NW_MERRY_SPAWN_E"),
           oTargetF = GetWaypointByTag("NW_MERRY_SPAWN_F"),
           oTargetG = GetWaypointByTag("NW_MERRY_SPAWN_G"),
           oTargetH = GetWaypointByTag("NW_MERRY_SPAWN_H"),
           oTargetI = GetWaypointByTag("NW_MERRY_SPAWN_I"),
           oTargetJ = GetWaypointByTag("NW_MERRY_SPAWN_J"),
           oTargetK = GetWaypointByTag("NW_MERRY_SPAWN_K"),
           oTargetL = GetWaypointByTag("NW_MERRY_SPAWN_L");

    switch (d12())
    {
        case 1:  CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetA)); break;
        case 2:  CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetB)); break;
        case 3:  CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetC)); break;
        case 4:  CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetD)); break;
        case 5:  CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetE)); break;
        case 6:  CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetF)); break;
        case 7:  CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetG)); break;
        case 8:  CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetH)); break;
        case 9:  CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetI)); break;
        case 10: CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetJ)); break;
        case 11: CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetK)); break;
        case 12: CreateObject(OBJECT_TYPE_CREATURE, "merrypriest", GetLocation(oTargetL)); break;
    }
}

//::///////////////////////////////////////////////
//:: ACN OnDeath Boss Script
//:: acn_boss_death
//:://////////////////////////////////////////////
//:: Created By: Milliorn, Scarface, Moe
//:: Created On: 2006
//:://////////////////////////////////////////////

void main()
{
    // Initial necessary var
    object oKiller = GetLastKiller();
    // Validate Killer as PC and not a DM
    while (GetIsObjectValid(GetMaster(oKiller)))
    {
        oKiller = GetMaster(oKiller);
    }


    if (GetResRef(OBJECT_SELF) == "gatekeeperal")
    {
        // Spawn in next henchman
        CreateObject(OBJECT_TYPE_CREATURE, "gatekeeperbe", GetLocation(GetWaypointByTag("WP_SPAWN_BEBILITH")), TRUE);
        // get rid of dead Boss
        ExecuteScript("sf_xp", OBJECT_SELF);
    }

    else if (GetResRef(OBJECT_SELF) == "gatekeeperbe")
    {
        // Spawn in next henchman
        CreateObject(OBJECT_TYPE_CREATURE, "gatekeeperce", GetLocation(GetWaypointByTag("WP_SPAWN_CELESTIAL")), TRUE);
        // get rid of dead Boss
        ExecuteScript("sf_xp", OBJECT_SELF);
    }

    else if (GetResRef(OBJECT_SELF) == "gatekeeperce")
    {
        // Spawn in next henchman
        CreateObject(OBJECT_TYPE_CREATURE, "gatekeeperd", GetLocation(GetWaypointByTag("WP_SPAWN_DRIDER")), TRUE);
        // get rid of dead Boss
        ExecuteScript("sf_xp", OBJECT_SELF);
    }

    else if (GetResRef(OBJECT_SELF) == "gatekeeperd")
    {
        // Spawn in next henchman
        CreateObject(OBJECT_TYPE_CREATURE, "gatekeepersl", GetLocation(GetWaypointByTag("WP_SPAWN_SLAAD")), TRUE);
        // get rid of dead Boss
        ExecuteScript("sf_xp", OBJECT_SELF);
    }

    else if (GetResRef(OBJECT_SELF) == "gatekeepersl")
    {
        // Spawn in next henchman
        CreateObject(OBJECT_TYPE_CREATURE, "gatekeeperty", GetLocation(GetWaypointByTag("WP_SPAWN_TYRANT")), TRUE);
        // get rid of dead Boss
        ExecuteScript("sf_xp", OBJECT_SELF);
    }

    else if (GetResRef(OBJECT_SELF) == "gatekeeperty")
    {
        // Spawn in next henchman
        CreateObject(OBJECT_TYPE_CREATURE, "gatekeepervr", GetLocation(GetWaypointByTag("WP_SPAWN_VROK")), TRUE);
        // get rid of dead Boss
        ExecuteScript("sf_xp", OBJECT_SELF);
    }

    else if (GetResRef(OBJECT_SELF) == "gatekeepervr")
    {
        // Spawn in next henchman
        CreateObject(OBJECT_TYPE_CREATURE, "gatekeeperro", GetLocation(GetWaypointByTag("WP_SPAWN_ROGUE")), TRUE);
        // get rid of dead Boss
        ExecuteScript("sf_xp", OBJECT_SELF);
    }

    else if (GetResRef(OBJECT_SELF) == "gatekeeperro")
    {
        object oArea = GetArea(OBJECT_SELF);
        object oObject = GetFirstObjectInArea(oArea);
        while(GetIsObjectValid(oObject))
        {
            // Set Gauntlet Master Plot Status to off
            if(GetTag(oObject) == "GauntletMaster")
            {
                SetPlotFlag(oObject, FALSE);
                FloatingTextStringOnCreature("GAUNTLET BOSS IS NOW VULUNERABLE!", oKiller, TRUE);
            }

         oObject = GetNextObjectInArea(oArea);

        }

        ExecuteScript("sf_xp", OBJECT_SELF);
    }

    if (!GetIsPC(oKiller) || GetIsDM(oKiller)) return;

    int iCR = FloatToInt(GetChallengeRating(OBJECT_SELF));
    int iLevel = 0;

    string sBoss = GetName(OBJECT_SELF, FALSE);
    string sName = GetName(oKiller);
    string sLvl = IntToString(GetHitDice(oKiller));
    string sMsg = sName + ", level " + sLvl + ", has slayed " + sBoss + "." ;
}

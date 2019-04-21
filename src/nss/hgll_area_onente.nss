void main()
{
    object oPC = GetEnteringObject();
    if (GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oPC) != OBJECT_INVALID)
    {
        if (!GetIsDM(oPC))
        {
            location lWay = GetLocation(GetWaypointByTag("Carp_to_CloakTower"));//port to entry
            AssignCommand(oPC, JumpToLocation(lWay));

            DelayCommand(6.0, FloatingTextStringOnCreature(""
            +"<cú>CANNOT ENTER LEGENDARY LEVEL AREA IF SOMEONE"
            +" IS IN THE AREA.</c>", oPC, TRUE));

            SendMessageToAllDMs(GetName(oPC) +
            "<cú> cannot enter Legendary Level Area. Already in use.</c>");
        }
    }

    else
    {
        ForceRest(oPC);
        SendMessageToAllDMs(GetName(oPC) + "<c°°°> has entered Legendary Levels Room.");
    }
}


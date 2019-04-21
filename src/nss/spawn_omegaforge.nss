#include "inc_mod_events"

void main()
{
    object oPC = GetEnteringObject(),
           oObject1 = GetWaypointByTag("NW_CURLY"),
           oObject2 = GetWaypointByTag("NW_JOE"),
           oObject3 = GetWaypointByTag("NW_LARRY"),
           oObject4 = GetWaypointByTag("NW_MOE"),
           oObject5 = GetWaypointByTag("NW_SHEMP");

    AssignCommand(oPC, ClearAllActions(TRUE));
    RemoveAllEffects(oPC);

    if (!GetIsObjectValid(GetNearestObjectByTag("omegasmith03", oObject1)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "omegasmith03", GetLocation(oObject1));
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("omegasmith4", oObject2)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "omegasmith4", GetLocation(oObject2));
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("omegasmith01", oObject3)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "omegasmith01", GetLocation(oObject3));
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("omegasmith02", oObject4)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "omegasmith02", GetLocation(oObject4));
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("omegasmith5", oObject5)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "omegasmith5", GetLocation(oObject5));
    }
}

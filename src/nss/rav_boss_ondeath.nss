#include "nw_i0_plot"
#include "inc_ai"

void main()
{
    object oKiller = GetLastKiller();
    object oArea = GetArea(OBJECT_SELF);

    if (!GetIsPC(oKiller) || GetIsDM(oKiller)) return;

    // Validate Killer as PC and not a DM
    while (GetIsObjectValid(GetMaster(oKiller)))
    {
        oKiller = GetMaster(oKiller);
    }

    object oPartyMember = GetFirstFactionMember(oKiller, TRUE);

    // now that everything is figured out - loop through party to see who gets ported out.
    while (GetIsObjectValid(oPartyMember) == TRUE)
    {
        // Check if oPartyMember is in the same area, if not then skip
        // all code inside the statement and carry on with loop
        if (GetArea(oPartyMember) == oArea)
        {
            if(HasItem(oPartyMember, "RavanasKey") == TRUE || HasItem(oPartyMember, "gauntlet_token") == TRUE)
            {
                AssignCommand(oPartyMember, ClearAllActions());
                AssignCommand(oPartyMember, ActionJumpToLocation(GetStartingLocation()));
                FloatingTextStringOnCreature("<có  >Force teleported</c> out of area for having Ravana items.", oPartyMember, TRUE);
            }
        }

    oPartyMember = GetNextFactionMember(oKiller, TRUE);

    }

    SpeakString("<cóóó> has been defeated by </c>"
    + GetName(oKiller) + "<cóóó> at </c>"
    + GetName(oArea) + "<cóóó> with </c>"
    + CheckBossRating(OBJECT_SELF, oKiller) + ".", TALKVOLUME_SHOUT);

    ExecuteScript("nw_s3_balordeth", OBJECT_SELF);
}

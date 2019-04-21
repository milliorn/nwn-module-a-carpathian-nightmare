#include "nw_i0_plot"

//  Display the CR Rating for the Boss script OnDeath
string CheckBossRating(object oDead, object oKiller);
string CheckBossRating(object oDead, object oKiller)
{
/*
     a rating of effortless is 6 levels lower
     a rating of easy is 4 to 5 levels lower
     a rating of moderate is 2 to 3 levels lower
     a rating f challenging is same or 1 level lower
     a rating of very difficult is 1 or 2 levels higher
     a rating of overpowering is 3 or 4 levels higher
     a rating of impossible is 5 or more levels higher.
*/
    int iPC = GetHitDice(oDead),
        iKiller = GetHitDice(oKiller),

        iKiller_LL = GetLocalInt(GetItemPossessedBy(oKiller, "plotItemTag"), "nLegendLevel");

    if (iKiller_LL > 40) iKiller = iKiller_LL;

    if (iPC + 6 <= iKiller)                            return " an <cóóó>EFFORTLESS</c> rating";
    else if (iPC + 5 == iKiller || iPC + 4 == iKiller) return " an <c ó >EASY</c> rating";
    else if (iPC + 3 == iKiller || iPC + 2 == iKiller) return "a <c fþ>MODERATE</c> rating";
    else if (iPC + 1 == iKiller || iPC == iKiller)     return "a <cóó >CHALLENGING</c> rating";
    else if (iKiller + 2 == iPC || iKiller + 1 == iPC) return "a <cþf >VERY DIFFICULT</c> rating";
    else if (iKiller + 4 == iPC || iKiller + 3 == iPC) return "an <có  >OVERPOWERING</c> rating";
    else if (iKiller + 5 <= iPC)                       return "an <có ó>IMPOSSIBLE</c> rating";

    // This should never display
    else return "an UNKNOWN rating";
}

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

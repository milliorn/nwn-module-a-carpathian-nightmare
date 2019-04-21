#include "inc_mod_events"
void main()
{
object  oPlayer = GetLastPlayerDied(),
        oKiller = GetLastHostileActor(oPlayer),
        oArea  = GetArea(oPlayer);

string  sArea = GetTag(GetArea(oPlayer)),
        sArea2 = GetName(oArea),
        sName = GetName(oPlayer),
        sName2 = GetName(oKiller);

//  Reset Faction Reputation to PC
    SetFactionsFriendly(oPlayer);

    if (sArea == "Arena")
    {
        //Send the 2 PC's a message
        DelayCommand(1.0,FloatingTextStringOnCreature("You Win", oKiller, FALSE));
        DelayCommand(1.0,FloatingTextStringOnCreature("You Lose", oPlayer, FALSE));

        //Shout server Arena message
        SpeakString("<cúú>"+sName+"</c> lost a duel to <cúú>" +sName2+
        "</c> in the <có ó>Arena</c>", TALKVOLUME_SHOUT);
        AssignCommand(oKiller, ClearAllActions(TRUE));
        Raise(oPlayer);
        return;
    }

//  Reset the dueling PC's, auto raise the defeated PC, and shout the results of the duel
    else if (sArea == "GladiatorPit")
    {
        AssignCommand(oPlayer, ClearAllActions());
        AssignCommand(oKiller, JumpToLocation(GetLocation(GetWaypointByTag("WP_PIT_WINNER"))));
        AssignCommand(oPlayer, JumpToLocation(GetLocation(GetWaypointByTag("WP_PIT_LOSER"))));
        Raise(oPlayer);
        Raise(oKiller);
        DelayCommand(1.0,FloatingTextStringOnCreature("<cú>You Win!</c>", oKiller, FALSE));
        DelayCommand(1.0,FloatingTextStringOnCreature("<cú>You Lose</c>", oPlayer, FALSE));
        SpeakString("<cúú>"+sName+"</c> was defeated by <cúú>" +sName2+
        "</c> in the <cddÈ>Gladiator Ring</c>", TALKVOLUME_SHOUT);
        return;
    }

//  Auto Raise PC if they die in these areas
    else if (GetLocalInt(oArea, "PC_AUTO_RAISE"))
    {
        AssignCommand(oKiller, ClearAllActions(TRUE));
        Raise(oPlayer);
        return;
    }

//  Check if its a PK from PvP and apply the Respawn GUI with a death VFX
    else
    {
        ExecuteScript("sf_bounty", OBJECT_SELF);
        DelayCommand(2.5, PopUpDeathGUIPanel(oPlayer, TRUE, TRUE, 0, "Respawning will lose you 100xp per character level and 15% of your total gold with a maximum of 15,000 gp"));
        DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), OBJECT_SELF));
        DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE), OBJECT_SELF));
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH_L), OBJECT_SELF));
    }
}

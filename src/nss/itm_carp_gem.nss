// Milliorn's Recall Stone
#include "x2_inc_switches"

//  Check if PC is in a hostile situation and if so stop the teleportation.
void CheckIsInBattle(object oPC, int iTimer, vector vLoc);
void CheckIsInBattle(object oPC, int iTimer, vector vLoc)
{
    FloatingTextStringOnCreature(IntToString(iTimer), oPC, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_PARALYZE_HOLD),oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWKILL), oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_S), oPC);

    //  Cancel teleport if hostile actions begin
    if (GetIsInCombat(oPC) || GetPositionFromLocation(GetLocation(oPC)) != vLoc)

    {
        FloatingTextStringOnCreature("Teleport cancelled!", oPC, FALSE);
        return;
    }

    //  If timer runs out teleport PC
    if (iTimer <= 0)
    {
        location lLoc = GetLocation(GetWaypointByTag("NW_DEATH_TEMPLE"));
        DelayCommand(1.0,AssignCommand(oPC, JumpToLocation(lLoc)));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION), oPC);
        return;
    }

    iTimer--;
    DelayCommand(1.0, CheckIsInBattle(oPC, iTimer, vLoc));
}

void main()
{
    int nEvent =GetUserDefinedItemEventNumber();

    if (nEvent ==  X2_ITEM_EVENT_ACTIVATE)
    {
        // Vars
        object oPC = GetItemActivator();
        vector vLoc = GetPositionFromLocation(GetLocation(oPC));

        //  Check if PC is in a forbidden area to teleport
        if (GetLocalInt(GetArea(oPC), "NO_TELEPORT"))
        {
            FloatingTextStringOnCreature("You cannot teleport from this area!!", oPC, FALSE);
        }

        else
        {
            //  Disable teleport in combat
            if (GetIsInCombat(oPC))
            {
                FloatingTextStringOnCreature("You cannot teleport while in battle", oPC, FALSE);
            }
            else
            {

                CheckIsInBattle(oPC, 3, vLoc);
            }
        }
    }
}

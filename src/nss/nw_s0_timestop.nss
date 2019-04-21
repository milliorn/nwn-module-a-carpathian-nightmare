//::////////////////////////////////////////////////////////////////////////////
//:: Scarface's Timestop Replacement
//:: nw_s0_timestop
//::////////////////////////////////////////////////////////////////////////////
/*
     This will replace the default "nw_s0_timestop" script
     For use with Scarface's No PVP Exploit Fixes
*/

//:: Constants

//:: Set the distance radius for for those to be effected by the spell
const int DISTANCE_TO_CASTER = 10; // Meters

//:: Set the Minumum duration for the spell, this will be multiplied
//:: by the dice roll below
/*
     Example of the DICE_ROLL and MIN_DURATION:
     If the MIN_DURATION was set to 5 seconds (default) and the DICE_ROLL set
     to 4 (default) that would mean the spell would last a minumum 5 on a
     dice roll of 1, and a maximum 20 seconds on a dice roll of 4.
*/
const int MIN_DURATION = 9; // Seconds minumum

//:: Set how many sided dice to roll to multiply the minumum duration
const int DICE_ROLL = 4; // Sided Dice

#include "x2_inc_spellhook"
#include "X0_I0_SPELLS"
void main()
{
/*
  Spellcast Hook Code
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more
*/
    if (!X2PreSpellCastCode())
    {
        // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }
  // End of Spell Cast Hook

    object oCaster = OBJECT_SELF;
//  int iRoll = Random(DICE_ROLL) +1 + MIN_DURATION;
    int iRoll = 9;
    //int iDC = GetSpellSaveDC() + (GetCasterLevel(oCaster) / 2);
    location lLoc = GetSpellTargetLocation();
    effect eTimeStop = EffectVisualEffect(VFX_FNF_TIME_STOP);

    if (GetLocalInt(oCaster, "TIME_STOP") == SPELL_TIME_STOP)
    {
        SetModuleOverrideSpellScriptFinished();
        FloatingTextStringOnCreature("Timestop cooldown timer.  Must wait 6 seconds after effect wears off to cast again.", oCaster);
        return;
    }

        SetLocalInt(oCaster, "TIME_STOP", SPELL_TIME_STOP);
        DelayCommand(15.0, DeleteLocalInt(oCaster, "TIME_STOP"));

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTimeStop, lLoc);



    if (!GetLocalInt(GetArea(oCaster), "NO_PVP"))
    {
      object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, IntToFloat(DISTANCE_TO_CASTER),lLoc, FALSE, OBJECT_TYPE_CREATURE);
      while (GetIsObjectValid(oTarget))
        {
            //if(oTarget != oCaster && !MySavingThrow(SAVING_THROW_REFLEX, oTarget, iDC, SAVING_THROW_TYPE_NONE, OBJECT_SELF, 0.0))
            if(oTarget != oCaster && !MyResistSpell(oCaster, oTarget, 0.0))
            {
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oTarget, IntToFloat(iRoll));
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), oTarget, IntToFloat(iRoll));
            }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, IntToFloat(DISTANCE_TO_CASTER),lLoc, FALSE, OBJECT_TYPE_CREATURE);
        }
    }
    else
    {
        FloatingTextStringOnCreature("This spell is disabled in this area!!", OBJECT_SELF);
    }
}

//::///////////////////////////////////////////////
//:: Evil Blight
//:: x2_s0_EvilBlight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Any enemies within the area of effect will
    suffer a curse effect
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 2/03
//:://////////////////////////////////////////////
//:: Updated by: Andrew Nobbs
//:: Updated on: March 28, 2003
//:: 2003-07-07: Stacking Spell Pass, Georg Zoeller

//  Edited By Milliorn: December 19th, 2018

//#include "nw_i0_spells"
//#include "x0_i0_spells"
#include "x2_inc_spellhook"

void main()
{
    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

    effect eCurse;

    switch (d6())
    {
        case 1: eCurse = EffectAbilityDecrease(ABILITY_CHARISMA, 1); /*SpeakString("ABILITY_CHARISMA")*/; break;
        case 2: eCurse = EffectAbilityDecrease(ABILITY_CONSTITUTION, 1); /*SpeakString("ABILITY_CONSTITUTION"); */break;
        case 3: eCurse = EffectAbilityDecrease(ABILITY_DEXTERITY, 1); /*SpeakString("ABILITY_DEXTERITY"); */break;
        case 4: eCurse = EffectAbilityDecrease(ABILITY_INTELLIGENCE, 1); /*SpeakString("ABILITY_INTELLIGENCE"); */break;
        case 5: eCurse = EffectAbilityDecrease(ABILITY_STRENGTH, 1); /*SpeakString("ABILITY_STRENGTH"); */break;
        case 6: eCurse = EffectAbilityDecrease(ABILITY_WISDOM, 1); /*SpeakString("ABILITY_WISDOM"); */break;

        default: PrintString("Evil Blight Error!"); break;
    }

    //Declare major variables
    object oTarget = GetSpellTargetObject();
    effect eImpact = EffectVisualEffect(VFX_IMP_DOOM);
    effect eVis = EffectVisualEffect(VFX_IMP_EVIL_HELP);
    //effect eCurse = SupernaturalEffect(EffectCurse(3,3,3,3,3,3));

    //Apply Spell Effects
    location lLoc = GetLocation(OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc);

    //Get first target in the area of effect
    //oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_CREATURE);

    //float fDelay;

    if(GetIsObjectValid(oTarget))
    {
        //SpeakString("while loop started");
        //Check faction of oTarget
        if (GetIsEnemy(oTarget))
        {
            //SpeakString("GetIsEnemy passed");
            //Signal spell cast at event
            SignalEvent(oTarget, EventSpellCastAt(oTarget,  GetSpellId()));
            //Make SR Check
            if (!MyResistSpell(OBJECT_SELF, oTarget))
            {
                    //SpeakString("MyResistSpell passed");
                    //Make Will Save
                if (!MySavingThrow(SAVING_THROW_WILL, oTarget, GetSpellSaveDC()))
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eImpact, oTarget);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eCurse, oTarget, 60.0);
                }
            }
        }
    }
    //SpeakString("script ended.");
}

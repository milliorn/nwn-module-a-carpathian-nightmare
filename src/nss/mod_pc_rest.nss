//::///////////////////////////////////////////////
//:: Name: x2_onrest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The generic wandering monster system
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: June 9/03
//:://////////////////////////////////////////////
//#include "x2_inc_switches"
#include "inc_mod_events"
#include "x0_i0_petrify"
void main()
{
    object oPC = GetLastPCRested();
    effect eSleep = EffectVisualEffect(VFX_IMP_SLEEP);
    effect eBlind = EffectBlindness();
    effect eDarkness = EffectDarkness();

    switch(GetLastRestEventType())
    {
        case REST_EVENTTYPE_REST_STARTED:
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eSleep, oPC);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBlind, oPC, 12.0);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDarkness, oPC, 12.0);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPC);
            break;
        }
        case REST_EVENTTYPE_REST_CANCELLED:
        {
            RemoveEffectOfType(oPC, EFFECT_TYPE_BLINDNESS);
            RemoveEffectOfType(oPC, EFFECT_TYPE_DARKNESS);
            ExportSingleCharacter(oPC);
            FloatingTextStringOnCreature("<c ó >Character Saved</c>", oPC, FALSE);
            ExecuteScript("ws_saveall_sub", oPC);
            ApplyBountyFlag(oPC);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPC);
            break;
        }
        case REST_EVENTTYPE_REST_FINISHED:
        {
            RemoveEffectOfType(oPC, EFFECT_TYPE_BLINDNESS);
            RemoveEffectOfType(oPC, EFFECT_TYPE_DARKNESS);
            ExportSingleCharacter(oPC);
            FloatingTextStringOnCreature("<c ó >Character Saved</c>", oPC, FALSE);
            ExecuteScript("ws_saveall_sub", oPC);
            ApplyBountyFlag(oPC);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPC);
            break;
        }
    }
}

//:: Assassin Buffs
//:: cls_spell_asasin
//:: Copyright?
//:://////////////////////////////////////////////
/*
    Applies all protection spells for the Assassin
    based on class level and required INT
*/
//:://////////////////////////////////////////////
//:: Created By: Ynnead
//:: Created On: 12/23/2018
//:://////////////////////////////////////////////

#include "x2_inc_spellhook"

void main()
{

/*
  Spellcast Hook Code
  Added 2003-06-23 by GeorgZ
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook


    //Declare major variables
    int casterLevel = GetLevelByClass(CLASS_TYPE_ASSASSIN);
    int casterINT = GetAbilityScore(OBJECT_SELF, ABILITY_INTELLIGENCE, TRUE);

    //--LEVEL 4 SPELLS--\\
    if(casterLevel >= 7 && casterINT >= 14)
    {
        //CLAIRAUDIENCE/CLAIRVOYANCE
        //Declare major variables
        effect eSpotCC = EffectSkillIncrease(SKILL_SPOT, 10);
        effect eListenCC = EffectSkillIncrease(SKILL_LISTEN, 10);
        effect eVisCC = EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT);
        effect eDurCC = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

        effect eLinkCC = EffectLinkEffects(eSpotCC, eListenCC);
        eLinkCC = EffectLinkEffects(eLinkCC, eVisCC);
        eLinkCC = EffectLinkEffects(eLinkCC, eDurCC);

        //Make sure the spell has not already been applied
        if(!GetHasSpellEffect(SPELL_CLAIRAUDIENCE_AND_CLAIRVOYANCE, OBJECT_SELF))
        {
            //Fire cast spell at event for the specified target
            SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, SPELL_CLAIRAUDIENCE_AND_CLAIRVOYANCE, FALSE));

            //Apply linked and VFX effects
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkCC, OBJECT_SELF, TurnsToSeconds(casterLevel));
        }

        //FREEDOM OF MOVEMENT
        effect eParalFOM = EffectImmunity(IMMUNITY_TYPE_PARALYSIS);
        effect eEntangleFOM = EffectImmunity(IMMUNITY_TYPE_ENTANGLE);
        effect eSlowFOM = EffectImmunity(IMMUNITY_TYPE_SLOW);
        effect eMoveFOM = EffectImmunity(IMMUNITY_TYPE_MOVEMENT_SPEED_DECREASE);
        effect eVisFOM = EffectVisualEffect(VFX_DUR_FREEDOM_OF_MOVEMENT);
        effect eDurFOM = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

        //Link effects
        effect eLinkFOM = EffectLinkEffects(eParalFOM, eEntangleFOM);
        eLinkFOM = EffectLinkEffects(eLinkFOM, eSlowFOM);
        eLinkFOM = EffectLinkEffects(eLinkFOM, eVisFOM);
        eLinkFOM = EffectLinkEffects(eLinkFOM, eDurFOM);
        eLinkFOM = EffectLinkEffects(eLinkFOM, eMoveFOM);

        //Search for and remove the above negative effects
        effect eLookFOM = GetFirstEffect(OBJECT_SELF);
        while(GetIsEffectValid(eLookFOM))
        {
            if(GetEffectType(eLookFOM) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eLookFOM) == EFFECT_TYPE_ENTANGLE ||
                GetEffectType(eLookFOM) == EFFECT_TYPE_SLOW ||
                GetEffectType(eLookFOM) == EFFECT_TYPE_MOVEMENT_SPEED_DECREASE)
            {
                RemoveEffect(OBJECT_SELF, eLookFOM);
            }
            eLookFOM = GetNextEffect(OBJECT_SELF);
        }

        //Fire cast spell at event for the specified target
        SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, SPELL_FREEDOM_OF_MOVEMENT, FALSE));

        //Apply Linked Effect
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkFOM, OBJECT_SELF, TurnsToSeconds(casterLevel));


        //IMPROVED INVISIBILITY
        effect eImpactII = EffectVisualEffect(VFX_IMP_HEAD_MIND);
        effect eInvisII = EffectInvisibility(INVISIBILITY_TYPE_NORMAL);
        effect eVisII = EffectVisualEffect(VFX_DUR_INVISIBILITY);
        effect eDurII = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
        effect eCoverII = EffectConcealment(50);

        //Link effects
        effect eLinkII = EffectLinkEffects(eDurII, eCoverII);
        eLinkII = EffectLinkEffects(eLinkII, eVisII);

        //Fire cast spell at event for the specified target
        SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, SPELL_IMPROVED_INVISIBILITY, FALSE));

        //Apply the VFX impact and effects
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eImpactII, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkII, OBJECT_SELF, TurnsToSeconds(casterLevel));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eInvisII, OBJECT_SELF, TurnsToSeconds(casterLevel));

    }
    //Has Level but not INT req
    else if(casterLevel >= 7 && casterINT < 14)
    {
        SendMessageToPC(OBJECT_SELF, "Level 4 Spells require 14 intelligence to cast.");
    }



    //--LEVEL 3 SPELLS--\\
    if(casterLevel >= 5 && casterINT >= 13)
    {
        //MAGIC CIRCLE AGAINST GOOD
        //Declare major variables including Area of Effect Object
        effect eAOEMCAD = EffectAreaOfEffect(AOE_MOB_CIRCEVIL);
        effect eVisMCAD = EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MINOR);
        effect eDurMCAD = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
        effect eEvilMCAD = EffectVisualEffect(VFX_IMP_EVIL_HELP);

        effect eLinkMCAD = EffectLinkEffects(eAOEMCAD, eVisMCAD);
        eLinkMCAD = EffectLinkEffects(eLinkMCAD, eDurMCAD);

        //Fire cast spell at event for the specified target
        SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, SPELL_MAGIC_CIRCLE_AGAINST_GOOD, FALSE));

        //Create an instance of the AOE Object using the Apply Effect function
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkMCAD, OBJECT_SELF, HoursToSeconds(casterLevel));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eEvilMCAD, OBJECT_SELF);


        //FALSE LIFE
        //Declare major variables
        effect eVisFF = EffectVisualEffect(VFX_IMP_HOLY_AID);
        effect eHPFF = EffectTemporaryHitpoints(d10(1) + (casterLevel <= 10 ? casterLevel : 10));
        effect eDurFF = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
        effect eLinkFF = EffectLinkEffects(eHPFF, eDurFF);

        //Apply the VFX impact and effects
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisFF, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkFF, OBJECT_SELF, HoursToSeconds(casterLevel));

    }
    //Has Level but not INT req
    else if(casterLevel >= 5 && casterINT < 13)
    {
        SendMessageToPC(OBJECT_SELF, "Level 3 Spells require 13 intelligence to cast.");
    }



    //--LEVEL 2 SPELLS--\\
    if(casterLevel >= 3 && casterINT >= 12)
    {
        //CAT'S GRACE
        effect eDexCG;
        effect eVisCG = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
        effect eDurCG = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

        //Signal spell cast at event to fire on the target.
        SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, SPELL_CATS_GRACE, FALSE));

        //Create the Ability Bonus effect with the correct modifier
        eDexCG = EffectAbilityIncrease(ABILITY_DEXTERITY, 4);
        effect eLinkCG = EffectLinkEffects(eDexCG, eDurCG);

        //Apply visual and bonus effects
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkCG, OBJECT_SELF, HoursToSeconds(casterLevel));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisCG, OBJECT_SELF);


        //FOX'S CUNNING
        effect eIntFC;
        effect eVisFC = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
        effect eDurFC = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

        //Signal spell cast at event to fire on the target.
        SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, SPELL_FOXS_CUNNING, FALSE));

        //Create the Ability Bonus effect with the correct modifier
        eIntFC = EffectAbilityIncrease(ABILITY_INTELLIGENCE, 4);
        effect eLinkFC = EffectLinkEffects(eIntFC, eDurFC);

        //Apply visual and bonus effects
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkFC, OBJECT_SELF, HoursToSeconds(casterLevel));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisFC, OBJECT_SELF);
    }
    //Has Level but not INT req
    else if(casterLevel >= 3 && casterINT < 12)
    {
        SendMessageToPC(OBJECT_SELF, "Level 2 Spells require 12 intelligence to cast.");
    }



    //--LEVEL 1 SPELLS--\\
/*    if(casterLevel >= 1 && casterINT >= 11)
    {
        //OBSCURING MIST
        //Declare major variables
        effect eConcealOM = EffectConcealment(20);
        effect eVisOM = EffectVisualEffect(VFX_IMP_AC_BONUS);
        effect eDurOM = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

        effect eLinkOM = EffectLinkEffects(eConcealOM, eDurOM);

        //Apply the VFX impact and effects
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkOM, OBJECT_SELF, TurnsToSeconds(casterLevel));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisOM, OBJECT_SELF);

    }
    //Has Level but not INT req
    else if(casterLevel >= 1 && casterINT < 11)
    {
        SendMessageToPC(OBJECT_SELF, "Level 1 Spells require 11 intelligence to cast.");
    }*/
}

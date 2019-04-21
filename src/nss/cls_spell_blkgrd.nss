//:: Blackguard Buffs
//:: cls_spell_blkgrd
//:: Copyright?
//:://////////////////////////////////////////////
/*
    Applies all protection spells for the Blackguard
    based on class level and required INT
*/
//:://////////////////////////////////////////////
//:: Created By: Ynnead
//:: Created On: 12/23/2018
//:://////////////////////////////////////////////

#include "x2_inc_spellhook"

void AddCorruptWeapon(object oTarget, float fDuration)
{
   // If the spell is cast again, any previous enhancement boni are kept
   IPSafeAddItemProperty(oTarget, ItemPropertyEnhancementBonus(1), fDuration, X2_IP_ADDPROP_POLICY_KEEP_EXISTING,TRUE);
   // Replace existing temporary anti undead boni
   //IPSafeAddItemProperty(oTarget, ItemPropertyDamageBonusVsRace(IP_CONST_RACIALTYPE_UNDEAD, IP_CONST_DAMAGETYPE_DIVINE, IP_CONST_DAMAGEBONUS_2d6), fDuration,X2_IP_ADDPROP_POLICY_REPLACE_EXISTING );
   IPSafeAddItemProperty(oTarget, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_NEGATIVE, IP_CONST_DAMAGEBONUS_2d6), fDuration,X2_IP_ADDPROP_POLICY_REPLACE_EXISTING );
   IPSafeAddItemProperty(oTarget, ItemPropertyVisualEffect(ITEM_VISUAL_EVIL), fDuration,X2_IP_ADDPROP_POLICY_REPLACE_EXISTING,FALSE,TRUE );
   return;
}

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
    int casterLevel = GetLevelByClass(CLASS_TYPE_BLACKGUARD);
    int casterWIS = GetAbilityScore(OBJECT_SELF, ABILITY_WISDOM, TRUE);

    //--LEVEL 4 SPELLS--\\
    if(casterLevel >= 7 && casterWIS >= 14)
    {
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
    }
    //Has Level but not Wis req
    else if(casterLevel >= 7 && casterWIS < 14)
    {
        SendMessageToPC(OBJECT_SELF, "Level 4 Spells require 14 wisdom to cast.");
    }

    //--LEVEL 3 SPELLS--\\
    if(casterLevel >= 5 && casterWIS >= 13)
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
    }
    //Has Level but not Wis req
    else if(casterLevel >= 5 && casterWIS < 13)
    {
        SendMessageToPC(OBJECT_SELF, "Level 3 Spells require 13 wisdom to cast.");
    }



    //--LEVEL 2 SPELLS--\\
    if(casterLevel >= 3 && casterWIS >= 12)
    {
        //Eagle's Splendor
        effect eDexCG;
        effect eVisCG = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
        effect eDurCG = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

        //Signal spell cast at event to fire on the target.
        SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, SPELL_EAGLE_SPLEDOR, FALSE));

        //Create the Ability Bonus effect with the correct modifier
        eDexCG = EffectAbilityIncrease(ABILITY_CHARISMA, 4);
        effect eLinkCG = EffectLinkEffects(eDexCG, eDurCG);

        //Apply visual and bonus effects
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkCG, OBJECT_SELF, HoursToSeconds(casterLevel));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisCG, OBJECT_SELF);
    }

    //Has Level but not Wis req
    else if(casterLevel >= 3 && casterWIS < 12)
    {
        SendMessageToPC(OBJECT_SELF, "Level 2 Spells require 12 wisdom to cast.");
    }

    //--LEVEL 1 SPELLS--\\
    if(casterLevel >= 1 && casterWIS >= 11)
    {
        //CORRUPT WEAPON
        //Declare major variables
        effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
        effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
        object oTarget = GetSpellTargetObject();
        int nDuration = 2 * GetCasterLevel(OBJECT_SELF);

        // ---------------- TARGETED ON BOLT  -------------------
        if(GetIsObjectValid(oTarget) && GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
        {
            // special handling for blessing crossbow bolts that can slay rakshasa's
            if (GetBaseItemType(oTarget) ==  BASE_ITEM_BOLT ||
                                             BASE_ITEM_ARROW ||
                                             BASE_ITEM_BULLET ||
                                             BASE_ITEM_DART ||
                                             BASE_ITEM_GRENADE ||
                                             BASE_ITEM_THROWINGAXE)
            {
                SignalEvent(GetItemPossessor(oTarget), EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));
                IPSafeAddItemProperty(oTarget, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_NEGATIVE, IP_CONST_DAMAGEBONUS_2d6), IntToFloat(nDuration),X2_IP_ADDPROP_POLICY_REPLACE_EXISTING );
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oTarget));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oTarget), RoundsToSeconds(nDuration));
                //return;
            }
        }

        object oObject = GetItemInSlot(INVENTORY_SLOT_ARMS, OBJECT_SELF);
        object oMyWeapon   =  IPGetTargetedOrEquippedMeleeWeapon();

        if(GetIsObjectValid(oMyWeapon) || GetBaseItemType(oObject) == BASE_ITEM_GLOVES)
        {
            SignalEvent(GetItemPossessor(oMyWeapon), EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));

            if (nDuration>0)
            {
                AddCorruptWeapon(oMyWeapon, TurnsToSeconds(nDuration));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), TurnsToSeconds(nDuration));
                //return;
            }
        }

        else if(GetBaseItemType(oTarget) == BASE_ITEM_BOLT || GetBaseItemType(oTarget) == BASE_ITEM_ARROW ||
                GetBaseItemType(oTarget) == BASE_ITEM_BULLET || GetBaseItemType(oTarget) == BASE_ITEM_DART ||
                GetBaseItemType(oTarget) == BASE_ITEM_GRENADE || GetBaseItemType(oTarget) == BASE_ITEM_THROWINGAXE)
        {
            SignalEvent(GetItemPossessor(oTarget), EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));

            if (nDuration>0)
            {
                AddCorruptWeapon(oTarget, TurnsToSeconds(nDuration));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oTarget));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oTarget), TurnsToSeconds(nDuration));
                return;
            }
        }
        //Has Level but not Wis req
        else if(casterLevel >= 1 && casterWIS < 11)
        {
            SendMessageToPC(OBJECT_SELF, "Level 1 Spells require 11 wisdom to cast.");
        }
    }
}

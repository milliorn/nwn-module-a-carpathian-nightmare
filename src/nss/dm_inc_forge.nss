//::///////////////////////////////////////////////
//:: Name     Forge System Handler
//:: FileName dm_inc_forge.nss
//:://////////////////////////////////////////////
/*

    This is the main file for the forge system.
    It holds all the custom functions and makes
    the system work. Please do not alter any of
    this file. Any altering of this file is
    considered unsupported.
    For instructions on configuring the forge,
    please refer to the new script file: dm_forge_config

    OmegaDM

*/
//:://////////////////////////////////////////////
//:: Created By: OmegaDM
//:: Created On: August 2005
//:://////////////////////////////////////////////

//////////////////////////////////////////////////

#include "dm_forge_config"
#include "x2_inc_itemprop"

//::///////////////////////////////////////////////////////////////
//::        Do not alter ANYTHING within this include.
//::        All forge configuring is done in the file
//::        dm_forge_config
//::///////////////////////////////////////////////////////////////

itemproperty dmEnhancement(int NCode)
{
    itemproperty ipNew;
    switch(NCode)
    {
        case 0:ipNew = ItemPropertyEnhancementBonus(1);break;
        case 1:ipNew = ItemPropertyEnhancementBonus(2);break;
        case 2:ipNew = ItemPropertyEnhancementBonus(3);break;
        case 3:ipNew = ItemPropertyEnhancementBonus(4);break;
        case 4:ipNew = ItemPropertyEnhancementBonus(5);break;
        case 5:ipNew = ItemPropertyEnhancementBonus(6);break;
        case 6:ipNew = ItemPropertyEnhancementBonus(7);break;
        case 7:ipNew = ItemPropertyEnhancementBonus(8);break;
        case 8:ipNew = ItemPropertyEnhancementBonus(9);break;
        case 9:ipNew = ItemPropertyEnhancementBonus(10);break;
    }
    return ipNew;
}

itemproperty dmDamageBonus(int NCode)
{
    int iType, iBonus;

    switch(NCode / 10)
    {
        case 0: iType = IP_CONST_DAMAGETYPE_FIRE; break;
        case 1: iType = IP_CONST_DAMAGETYPE_COLD; break;
        case 2: iType = IP_CONST_DAMAGETYPE_ELECTRICAL; break;
        case 3: iType = IP_CONST_DAMAGETYPE_ACID; break;
        case 4: iType = IP_CONST_DAMAGETYPE_SONIC; break;
        case 5: iType = IP_CONST_DAMAGETYPE_DIVINE; break;
        case 6: iType = IP_CONST_DAMAGETYPE_MAGICAL; break;
    }

    switch(NCode % 10)
    {
        case 0: iBonus = IP_CONST_DAMAGEBONUS_1d4; break;
        case 1: iBonus = IP_CONST_DAMAGEBONUS_1d6; break;
        case 2: iBonus = IP_CONST_DAMAGEBONUS_1d8; break;
        case 3: iBonus = IP_CONST_DAMAGEBONUS_1d10; break;
        case 4: iBonus = IP_CONST_DAMAGEBONUS_1d12; break;
        case 5: iBonus = IP_CONST_DAMAGEBONUS_2d4; break;
        case 6: iBonus = IP_CONST_DAMAGEBONUS_2d6; break;
        case 7: iBonus = IP_CONST_DAMAGEBONUS_2d8; break;
        case 8: iBonus = IP_CONST_DAMAGEBONUS_2d10; break;
        case 9: iBonus = IP_CONST_DAMAGEBONUS_2d12; break;
    }

    return ItemPropertyDamageBonus(iType,iBonus);
}


itemproperty dmBonusFeat(int NCode)
{
    itemproperty ipNew;
    switch(NCode)
    {
        case 0: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_ALERTNESS);break;
        case 1: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_AMBIDEXTROUS);break;
        case 2: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_ARMOR_PROF_HEAVY);break;
        case 3: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_ARMOR_PROF_MEDIUM);break;
        case 4: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_ARMOR_PROF_LIGHT);break;
        case 5: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_CLEAVE);break;
        case 6: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_COMBAT_CASTING);break;
        case 7: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_DODGE);break;
        case 8: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_EXTRA_TURNING);break;
        case 9: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_IMPCRITUNARM);break;
        case 10: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_KNOCKDOWN);break;
        case 11: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_POINTBLANK);break;
        case 12: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_POWERATTACK);break;
        case 13: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_SPELLFOCUSABJ);break;
        case 14: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_SPELLFOCUSCON);break;
        case 15: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_SPELLFOCUSDIV);break;
        case 16: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_SPELLFOCUSENC);break;
        case 17: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_SPELLFOCUSEVO);break;
        case 18: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_SPELLFOCUSILL);break;
        case 19: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_SPELLFOCUSNEC);break;
        case 20: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_SPELLPENETRATION);break;
        case 21: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_TWO_WEAPON_FIGHTING);break;
        case 22: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_WEAPFINESSE);break;
        case 23: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_WEAPON_PROF_SIMPLE);break;
        case 24: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_WEAPON_PROF_MARTIAL);break;
        case 25: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_WEAPON_PROF_EXOTIC);break;
        case 26: ipNew = ItemPropertyBonusFeat(IP_CONST_FEAT_WEAPSPEUNARM);break;
    }
    return ipNew;
}

itemproperty dmDamageReduction(int NCode)
{
    int iSoak, iReduct;
    switch(NCode / 10)
    {
        case 0: iSoak = IP_CONST_DAMAGESOAK_5_HP; break;
        case 1: iSoak = IP_CONST_DAMAGESOAK_10_HP; break;
        case 2: iSoak = IP_CONST_DAMAGESOAK_15_HP; break;
        case 3: iSoak = IP_CONST_DAMAGESOAK_20_HP; break;
    }

    switch(NCode % 10)
    {
        case 0: iReduct = IP_CONST_DAMAGEREDUCTION_1; break;
        case 1: iReduct = IP_CONST_DAMAGEREDUCTION_2; break;
        case 2: iReduct = IP_CONST_DAMAGEREDUCTION_3; break;
        case 3: iReduct = IP_CONST_DAMAGEREDUCTION_4; break;
        case 4: iReduct = IP_CONST_DAMAGEREDUCTION_5; break;
        case 5: iReduct = IP_CONST_DAMAGEREDUCTION_6; break;
        case 6: iReduct = IP_CONST_DAMAGEREDUCTION_7; break;
        case 7: iReduct = IP_CONST_DAMAGEREDUCTION_8; break;
        case 8: iReduct = IP_CONST_DAMAGEREDUCTION_9; break;
        case 9: iReduct = IP_CONST_DAMAGEREDUCTION_10; break;
    }

    return ItemPropertyDamageReduction(iReduct,iSoak);
}

itemproperty dmDamageResistance(int NCode)
{
    int iType, iResist;
    switch(NCode / 10)
    {
        case 0: iResist = IP_CONST_DAMAGERESIST_5; break;
        case 1: iResist = IP_CONST_DAMAGERESIST_10; break;
        case 2: iResist = IP_CONST_DAMAGERESIST_15; break;
        case 3: iResist = IP_CONST_DAMAGERESIST_20; break;
    }

    switch(NCode % 10)
    {
        case 0: iType = IP_CONST_DAMAGETYPE_FIRE; break;
        case 1: iType = IP_CONST_DAMAGETYPE_COLD; break;
        case 2: iType = IP_CONST_DAMAGETYPE_ELECTRICAL; break;
        case 3: iType = IP_CONST_DAMAGETYPE_ACID; break;
        case 4: iType = IP_CONST_DAMAGETYPE_SONIC; break;
        case 5: iType = IP_CONST_DAMAGETYPE_DIVINE; break;
        case 6: iType = IP_CONST_DAMAGETYPE_MAGICAL; break;
        case 7: iType = IP_CONST_DAMAGETYPE_SLASHING; break;
        case 8: iType = IP_CONST_DAMAGETYPE_PIERCING; break;
        case 9: iType = IP_CONST_DAMAGETYPE_BLUDGEONING; break;
    }
    return ItemPropertyDamageResistance(iType,iResist);
}

itemproperty dmBonusAC(int NCode)
{
    itemproperty ipNew;
    switch(NCode)
    {
        case 0: ipNew = ItemPropertyACBonus(1);break;
        case 1: ipNew = ItemPropertyACBonus(2);break;
        case 2: ipNew = ItemPropertyACBonus(3);break;
        case 3: ipNew = ItemPropertyACBonus(4);break;
        case 4: ipNew = ItemPropertyACBonus(5);break;
        case 5: ipNew = ItemPropertyACBonus(6);break;
        case 6: ipNew = ItemPropertyACBonus(7);break;
        case 7: ipNew = ItemPropertyACBonus(8);break;
        case 8: ipNew = ItemPropertyACBonus(9);break;
        case 9: ipNew = ItemPropertyACBonus(10);break;
    }
    return ipNew;
}

int dmGetBonusAmt(int nRcode)
{
    int nBonusAmt;
    switch(nRcode)
    {
        case 0: nBonusAmt = 1; break;
        case 1: nBonusAmt = 2; break;
        case 2: nBonusAmt = 3; break;
        case 3: nBonusAmt = 4; break;
        case 4: nBonusAmt = 5; break;
        case 5: nBonusAmt = 6; break;
        case 6: nBonusAmt = 7; break;
        case 7: nBonusAmt = 8; break;
        case 8: nBonusAmt = 9; break;
        case 9: nBonusAmt = 10; break;
    }
    return nBonusAmt;
}


itemproperty dmAbilityModifier(int NCode)
{
    int iAbil, iBonus;
    switch(NCode / 10)
    {
        case 0: iAbil = IP_CONST_ABILITY_STR; break;
        case 1: iAbil = IP_CONST_ABILITY_DEX; break;
        case 2: iAbil = IP_CONST_ABILITY_CON; break;
        case 3: iAbil = IP_CONST_ABILITY_INT; break;
        case 4: iAbil = IP_CONST_ABILITY_WIS; break;
        case 5: iAbil = IP_CONST_ABILITY_CHA; break;
    }

    iBonus = dmGetBonusAmt(NCode % 10);

    return ItemPropertyAbilityBonus(iAbil,iBonus);
}

itemproperty dmSkillBonusFirstList(int NCode)
{
    int iSkill, iBonus;
    switch(NCode / 10)
    {
        case 0: iSkill = SKILL_ANIMAL_EMPATHY; break;
        case 1: iSkill = SKILL_APPRAISE; break;
        case 2: iSkill = SKILL_BLUFF; break;
        case 3: iSkill = SKILL_CONCENTRATION; break;
        case 4: iSkill = SKILL_CRAFT_ARMOR; break;
        case 5: iSkill = SKILL_CRAFT_TRAP; break;
        case 6: iSkill = SKILL_CRAFT_WEAPON; break;
        case 7: iSkill = SKILL_DISABLE_TRAP; break;
        case 8: iSkill = SKILL_DISCIPLINE; break;
    }

    iBonus = dmGetBonusAmt(NCode % 10);

    return ItemPropertySkillBonus(iSkill,iBonus);
}

itemproperty dmSkillBonusSecondList(int NCode)
{
    int iSkill, iBonus;
    switch(NCode / 10)
    {
        case 0: iSkill = SKILL_HEAL; break;
        case 1: iSkill = SKILL_HIDE; break;
        case 2: iSkill = SKILL_INTIMIDATE; break;
        case 3: iSkill = SKILL_LISTEN; break;
        case 4: iSkill = SKILL_LORE; break;
        case 5: iSkill = SKILL_MOVE_SILENTLY; break;
        case 6: iSkill = SKILL_OPEN_LOCK; break;
        case 7: iSkill = SKILL_PARRY; break;
        case 8: iSkill = SKILL_PERFORM; break;
    }

    iBonus = dmGetBonusAmt(NCode % 10);

    return ItemPropertySkillBonus(iSkill,iBonus);
}

itemproperty dmSkillBonusThirdList(int NCode)
{
    int iSkill, iBonus;
    switch(NCode / 10)
    {
        case 0: iSkill = SKILL_PERSUADE; break;
        case 1: iSkill = SKILL_PICK_POCKET; break;
        case 2: iSkill = SKILL_SEARCH; break;
        case 3: iSkill = SKILL_SET_TRAP; break;
        case 4: iSkill = SKILL_SPELLCRAFT; break;
        case 5: iSkill = SKILL_SPOT; break;
        case 6: iSkill = SKILL_TAUNT; break;
        case 7: iSkill = SKILL_TUMBLE; break;
        case 8: iSkill = SKILL_USE_MAGIC_DEVICE; break;
    }

    iBonus = dmGetBonusAmt(NCode % 10);

    return ItemPropertySkillBonus(iSkill,iBonus);
}

itemproperty dmMiscImmunity(int NCode)
{
    itemproperty ipNew;
    switch(NCode)
    {
        case 0: ipNew = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_DEATH_MAGIC); break;
        case 1: ipNew = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_DISEASE); break;
        case 2: ipNew = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_FEAR); break;
        case 3: ipNew = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_KNOCKDOWN); break;
        case 4: ipNew = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_LEVEL_ABIL_DRAIN); break;
        case 5: ipNew = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_MINDSPELLS); break;
        case 6: ipNew = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_PARALYSIS); break;
        case 7: ipNew = ItemPropertyImmunityMisc(IP_CONST_IMMUNITYMISC_POISON); break;
    }
    return ipNew;
}

itemproperty dmSavThrowBonus(int NCode)
{
    int iBonus = dmGetBonusAmt(NCode % 10);
    itemproperty ipSav;

    switch(NCode / 10)
    {
        case 0: ipSav = ItemPropertyBonusSavingThrow(IP_CONST_SAVEBASETYPE_FORTITUDE,iBonus); break;
        case 1: ipSav = ItemPropertyBonusSavingThrow(IP_CONST_SAVEBASETYPE_REFLEX,iBonus); break;
        case 2: ipSav = ItemPropertyBonusSavingThrow(IP_CONST_SAVEBASETYPE_WILL,iBonus); break;
        case 3: ipSav = ItemPropertyBonusSavingThrowVsX(IP_CONST_SAVEVS_UNIVERSAL,iBonus); break;
    }

    return ipSav;
}

itemproperty dmMiscBonus(int NCode)
{
    itemproperty ipNew;
    switch(NCode)
    {
        case 0: ipNew = ItemPropertyFreeAction(); break;
        case 1: ipNew = ItemPropertyHaste(); break;
        case 2: ipNew = ItemPropertyKeen(); break;
        case 3: ipNew = ItemPropertyTrueSeeing(); break;
        case 4: ipNew = ItemPropertyImprovedEvasion(); break;
        case 5: ipNew = ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_BASIC); break;
        case 6: ipNew = ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_1D6COLD); break;
        case 7: ipNew = ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_1D6FIRE); break;
        case 8: ipNew = ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_1D6LIGHT); break;
        case 9: ipNew = ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_PLUS1); break;
        case 10: ipNew = ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_PLUS2); break;
        case 11: ipNew = ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_PLUS3); break;
        case 12: ipNew = ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_PLUS4); break;
        case 13: ipNew = ItemPropertyUnlimitedAmmo(IP_CONST_UNLIMITEDAMMO_PLUS5); break;
        case 14: ipNew = ItemPropertyVampiricRegeneration(2); break;
        case 15: ipNew = ItemPropertyVampiricRegeneration(4); break;
        case 16: ipNew = ItemPropertyVampiricRegeneration(6); break;
        case 17: ipNew = ItemPropertyVampiricRegeneration(8); break;
        case 18: ipNew = ItemPropertyVampiricRegeneration(10); break;
        case 19: ipNew = ItemPropertyVampiricRegeneration(12); break;
        case 20: ipNew = ItemPropertyBonusSpellResistance(IP_CONST_SPELLRESISTANCEBONUS_12); break;
        case 21: ipNew = ItemPropertyBonusSpellResistance(IP_CONST_SPELLRESISTANCEBONUS_14); break;
        case 22: ipNew = ItemPropertyBonusSpellResistance(IP_CONST_SPELLRESISTANCEBONUS_16); break;
        case 23: ipNew = ItemPropertyBonusSpellResistance(IP_CONST_SPELLRESISTANCEBONUS_18); break;
        case 24: ipNew = ItemPropertyBonusSpellResistance(IP_CONST_SPELLRESISTANCEBONUS_20); break;
        case 25: ipNew = ItemPropertyBonusSpellResistance(IP_CONST_SPELLRESISTANCEBONUS_22); break;
        case 26: ipNew = ItemPropertyBonusSpellResistance(IP_CONST_SPELLRESISTANCEBONUS_24); break;
        case 27: ipNew = ItemPropertyBonusSpellResistance(IP_CONST_SPELLRESISTANCEBONUS_26); break;
        case 28: ipNew = ItemPropertyBonusSpellResistance(IP_CONST_SPELLRESISTANCEBONUS_28); break;
        case 29: ipNew = ItemPropertyBonusSpellResistance(IP_CONST_SPELLRESISTANCEBONUS_30); break;
        case 30: ipNew = ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_1d4); break;
        case 31: ipNew = ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_1d6); break;
        case 32: ipNew = ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_1d8); break;
        case 33: ipNew = ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_1d10); break;
        case 34: ipNew = ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_1d12); break;
        case 35: ipNew = ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_2d4); break;
        case 36: ipNew = ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_2d6); break;
        case 37: ipNew = ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_2d8); break;
        case 38: ipNew = ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_2d10); break;
        case 39: ipNew = ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_2d12); break;
        case 40: ipNew = ItemPropertyVisualEffect(ITEM_VISUAL_ACID); break;
        case 41: ipNew = ItemPropertyVisualEffect(ITEM_VISUAL_COLD); break;
        case 42: ipNew = ItemPropertyVisualEffect(ITEM_VISUAL_ELECTRICAL); break;
        case 43: ipNew = ItemPropertyVisualEffect(ITEM_VISUAL_EVIL); break;
        case 44: ipNew = ItemPropertyVisualEffect(ITEM_VISUAL_FIRE); break;
        case 45: ipNew = ItemPropertyVisualEffect(ITEM_VISUAL_HOLY); break;
        case 46: ipNew = ItemPropertyVisualEffect(ITEM_VISUAL_SONIC); break;
    }
    return ipNew;
}

itemproperty dmAttackBonus(int NCode)
{
    itemproperty ipNew;
    switch(NCode)
    {
        case 0:ipNew = ItemPropertyAttackBonus(1);break;
        case 1:ipNew = ItemPropertyAttackBonus(2);break;
        case 2:ipNew = ItemPropertyAttackBonus(3);break;
        case 3:ipNew = ItemPropertyAttackBonus(4);break;
        case 4:ipNew = ItemPropertyAttackBonus(5);break;
        case 5:ipNew = ItemPropertyAttackBonus(6);break;
        case 6:ipNew = ItemPropertyAttackBonus(7);break;
        case 7:ipNew = ItemPropertyAttackBonus(8);break;
        case 8:ipNew = ItemPropertyAttackBonus(9);break;
        case 9:ipNew = ItemPropertyAttackBonus(10);break;
    }
    return ipNew;
}

itemproperty dmRegenBonus(int NCode)
{
    itemproperty ipNew;
    switch(NCode)
    {
        case 0: ipNew = ItemPropertyRegeneration(1);break;
        case 1: ipNew = ItemPropertyRegeneration(2);break;
        case 2: ipNew = ItemPropertyRegeneration(3);break;
        case 3: ipNew = ItemPropertyRegeneration(4);break;
        case 4: ipNew = ItemPropertyRegeneration(5);break;
        case 5: ipNew = ItemPropertyRegeneration(6);break;
        case 6: ipNew = ItemPropertyRegeneration(7);break;
        case 7: ipNew = ItemPropertyRegeneration(8);break;
        case 8: ipNew = ItemPropertyRegeneration(9);break;
        case 9: ipNew = ItemPropertyRegeneration(10);break;
    }
    return ipNew;
}

itemproperty dmMightyBonus(int NCode)
{
    itemproperty ipNew;
    switch(NCode)
    {
        case 0: ipNew = ItemPropertyMaxRangeStrengthMod(1);break;
        case 1: ipNew = ItemPropertyMaxRangeStrengthMod(2);break;
        case 2: ipNew = ItemPropertyMaxRangeStrengthMod(3);break;
        case 3: ipNew = ItemPropertyMaxRangeStrengthMod(4);break;
        case 4: ipNew = ItemPropertyMaxRangeStrengthMod(5);break;
        case 5: ipNew = ItemPropertyMaxRangeStrengthMod(6);break;
        case 6: ipNew = ItemPropertyMaxRangeStrengthMod(7);break;
        case 7: ipNew = ItemPropertyMaxRangeStrengthMod(8);break;
        case 8: ipNew = ItemPropertyMaxRangeStrengthMod(9);break;
        case 9: ipNew = ItemPropertyMaxRangeStrengthMod(10);break;
    }
    return ipNew;
}

//::///////////////////////////////////////////////////////////////////////////
/////////////     Here we add the new cast-spell IPs        ///////////////////
//::///////////////////////////////////////////////////////////////////////////

itemproperty dmSpell_L0(int ModCode,int nUses)
{
    itemproperty ipSpell;
    switch(ModCode)
    {
        case 1: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ACID_SPLASH_1,nUses); break;
        case 2: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CURE_MINOR_WOUNDS_1,nUses); break;
        case 3: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DAZE_1,nUses); break;
        case 4: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ELECTRIC_JOLT_1,nUses); break;
        case 5: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FLARE_1,nUses); break;
        case 6: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_INFLICT_MINOR_WOUNDS_1,nUses); break;
        case 7: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_LIGHT_5,nUses); break;
        case 8: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_RAY_OF_FROST_1,nUses); break;
        case 9: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_RESISTANCE_5,nUses); break;
        case 10: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_VIRTUE_1,nUses); break;
    }
    return ipSpell;
}

itemproperty dmSpell_L1(int ModCode,int nUses)
{
    itemproperty ipSpell;
    switch(ModCode)
    {
        case 1: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BANE_5,nUses); break;
        case 2: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BLESS_2,nUses); break;
        case 3: ipSpell = ItemPropertyCastSpell(472,nUses); break;
        case 4: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BURNING_HANDS_5,nUses); break;
        case 5: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CAMOFLAGE_5,nUses); break;
        case 6: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CHARM_PERSON_10,nUses); break;
        case 7: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_COLOR_SPRAY_2,nUses); break;
        case 8: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CURE_LIGHT_WOUNDS_5,nUses); break;
        case 9: ipSpell = ItemPropertyCastSpell(471,nUses); break;
        case 10: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DIVINE_FAVOR_5,nUses); break;
        case 11: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DOOM_5,nUses); break;
        case 12: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ENDURE_ELEMENTS_2,nUses); break;
        case 13: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ENTANGLE_5,nUses); break;
        case 14: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ENTROPIC_SHIELD_5,nUses); break;
        case 15: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_EXPEDITIOUS_RETREAT_5,nUses); break;
        case 16: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GREASE_2,nUses); break;
        case 17: ipSpell = ItemPropertyCastSpell(459,nUses); break;
        case 18: ipSpell = ItemPropertyCastSpell(478,nUses); break;
        case 19: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_IDENTIFY_3,nUses); break;
        case 20: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_INFLICT_LIGHT_WOUNDS_5,nUses); break;
        case 21: ipSpell = ItemPropertyCastSpell(460,nUses); break;
        case 22: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MAGE_ARMOR_2,nUses); break;
        case 23: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MAGIC_FANG_5,nUses); break;
        case 24: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MAGIC_MISSILE_9,nUses); break;
        case 25: ipSpell = ItemPropertyCastSpell(479,nUses); break;
        case 26: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_NEGATIVE_ENERGY_RAY_9,nUses); break;
        case 27: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_PROTECTION_FROM_ALIGNMENT_5,nUses); break;
        case 28: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_RAY_OF_ENFEEBLEMENT_2,nUses); break;
        case 29: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_REMOVE_FEAR_2,nUses); break;
        case 30: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SANCTUARY_2,nUses); break;
        case 31: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SCARE_2,nUses); break;
        case 32: ipSpell = ItemPropertyCastSpell(469,nUses); break;
        case 33: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SHIELD_5,nUses); break;
        case 34: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SHIELD_OF_FAITH_5,nUses); break;
        case 35: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SLEEP_5,nUses); break;
        case 36: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SUMMON_CREATURE_I_5,nUses); break;
        case 37: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_TRUE_STRIKE_5,nUses); break;
        // ULTRAVISION - No IP_CONST_CASTSPELL_ constant for this that i could find
    }
    return ipSpell;
}

itemproperty dmSpell_L2(int ModCode,int nUses)
{
    itemproperty ipSpell;
    switch(ModCode)
    {
        case 1: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_AID_3,nUses); break;
        case 2: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_AURAOFGLORY_7,nUses); break;
        case 3: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BALAGARNSIRONHORN_7,nUses); break;
        case 4: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BARKSKIN_6,nUses); break;
        case 5: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BLINDNESS_DEAFNESS_3,nUses); break;
        case 6: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BLOOD_FRENZY_7,nUses); break;
        case 7: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BULLS_STRENGTH_15,nUses); break;
        case 8: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CATS_GRACE_15,nUses); break;
        case 9: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CHARM_PERSON_OR_ANIMAL_10,nUses); break;
        case 10: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CLARITY_3,nUses); break;
        case 11: ipSpell = ItemPropertyCastSpell(486,nUses); break;
        case 12: ipSpell = ItemPropertyCastSpell(456,nUses); break;
        case 13: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CONTINUAL_FLAME_7,nUses); break;
        case 14: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CURE_MODERATE_WOUNDS_10,nUses); break;
        case 15: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DARKNESS_3,nUses); break;
        case 16: ipSpell = ItemPropertyCastSpell(457,nUses); break;
        case 17: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_EAGLE_SPLEDOR_15,nUses); break;
        case 18: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ENDURANCE_15,nUses); break;
        case 19: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FIND_TRAPS_3,nUses); break;
        case 20: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FLAME_LASH_10,nUses); break;
        case 21: ipSpell = ItemPropertyCastSpell(477,nUses); break;
        case 22: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FOXS_CUNNING_15,nUses); break;
        case 23: ipSpell = ItemPropertyCastSpell(458,nUses); break;
        case 24: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GHOSTLY_VISAGE_15,nUses); break;
        case 25: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GHOUL_TOUCH_3,nUses); break;
        case 26: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_HOLD_ANIMAL_3,nUses); break;
        case 27: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_HOLD_PERSON_3,nUses); break;
        case 28: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_INFLICT_MODERATE_WOUNDS_7,nUses); break;
        case 29: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_INVISIBILITY_3,nUses); break;
        case 30: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_KNOCK_3,nUses); break;
        case 31: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_LESSER_DISPEL_5,nUses); break;
        case 32: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_LESSER_RESTORATION_3,nUses); break;
        case 33: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MELFS_ACID_ARROW_9,nUses); break;
        case 34: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ONE_WITH_THE_LAND_7,nUses); break;
        case 35: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_OWLS_WISDOM_15,nUses); break;
        case 36: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_PROTECTION_FROM_ELEMENTS_10,nUses); break;
        case 37: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_REMOVE_PARALYSIS_3,nUses); break;
        case 38: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_RESIST_ELEMENTS_10,nUses); break;
        case 39: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SEE_INVISIBILITY_3,nUses); break;
        case 40: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SILENCE_3,nUses); break;
        case 41: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SOUND_BURST_3,nUses); break;
        case 42: ipSpell = ItemPropertyCastSpell(465,nUses); break;
        case 43: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SUMMON_CREATURE_II_3,nUses); break;
        case 44: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_TASHAS_HIDEOUS_LAUGHTER_7,nUses); break;
        case 45: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_WEB_3,nUses); break;
    }
    return ipSpell;
}


itemproperty dmSpell_L3(int ModCode,int nUses)
{
    itemproperty ipSpell;
    switch(ModCode)
    {
        case 1: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ANIMATE_DEAD_15,nUses); break;
        case 2: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BESTOW_CURSE_5,nUses); break;
        case 3: ipSpell = ItemPropertyCastSpell(470,nUses); break;
        case 4: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CALL_LIGHTNING_10,nUses); break;
        case 5: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CHARM_MONSTER_10,nUses); break;
        case 6: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CLAIRAUDIENCE_CLAIRVOYANCE_15,nUses); break;
        case 7: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CONFUSION_10,nUses); break;
        case 8: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CONTAGION_5,nUses); break;
        case 9: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CURE_SERIOUS_WOUNDS_10,nUses); break;
        case 10: ipSpell = ItemPropertyCastSpell(483,nUses); break;
        case 11: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DISPEL_MAGIC_10,nUses); break;
        case 12: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DISPLACEMENT_9,nUses); break;
        case 13: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DOMINATE_ANIMAL_5,nUses); break;
        case 14: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FEAR_5,nUses); break;
        case 15: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FIREBALL_10,nUses); break;
        case 16: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FLAME_ARROW_18,nUses); break;
        case 17: ipSpell = ItemPropertyCastSpell(484,nUses); break;
        case 18: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GREATER_MAGIC_FANG_9,nUses); break;
        case 19: ipSpell = ItemPropertyCastSpell(480,nUses); break;
        case 20: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GUST_OF_WIND_10,nUses); break;
        case 21: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_HASTE_10,nUses); break;
        case 22: ipSpell = ItemPropertyCastSpell(452,nUses); break;
        case 23: ipSpell = ItemPropertyCastSpell(451,nUses); break;
        case 24: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_INFLICT_SERIOUS_WOUNDS_9,nUses); break;
        case 25: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_INVISIBILITY_PURGE_5,nUses); break;
        case 26: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_INVISIBILITY_SPHERE_5,nUses); break;
        case 27: ipSpell = ItemPropertyCastSpell(474,nUses); break;
        case 28: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_LIGHTNING_BOLT_10,nUses); break;
        case 29: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MAGIC_CIRCLE_AGAINST_ALIGNMENT_5,nUses); break;
        case 30: ipSpell = ItemPropertyCastSpell(481,nUses); break;
        case 31: ipSpell = ItemPropertyCastSpell(461,nUses); break;
        case 32: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_NEGATIVE_ENERGY_PROTECTION_15,nUses); break;
        case 33: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_NEUTRALIZE_POISON_5,nUses); break;
        case 34: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_POISON_5,nUses); break;
        case 35: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_PRAYER_5,nUses); break;
        case 36: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_PROTECTION_FROM_ELEMENTS_10,nUses); break;
        case 37: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_QUILLFIRE_8,nUses); break;
        case 38: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_REMOVE_BLINDNESS_DEAFNESS_5,nUses); break;
        case 39: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_REMOVE_CURSE_5,nUses); break;
        case 40: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_REMOVE_DISEASE_5,nUses); break;
        case 41: ipSpell = ItemPropertyCastSpell(464,nUses); break;
        case 42: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SEARING_LIGHT_5,nUses); break;
        case 43: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SLOW_5,nUses); break;
        case 44: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SPIKE_GROWTH_9,nUses); break;
        case 45: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_STINKING_CLOUD_5,nUses); break;
        case 46: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SUMMON_CREATURE_III_5,nUses); break;
        case 47: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_VAMPIRIC_TOUCH_5,nUses); break;
        case 48: ipSpell = ItemPropertyCastSpell(372,nUses); break;
    }
    return ipSpell;
}

itemproperty dmSpell_L4(int ModCode,int nUses)
{
    itemproperty ipSpell;
    switch(ModCode)
    {
        case 1: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CURE_CRITICAL_WOUNDS_15,nUses); break;
        case 2: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DEATH_WARD_7,nUses); break;
        case 3: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DISMISSAL_18,nUses); break;
        case 4: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DIVINE_POWER_7,nUses); break;
        case 5: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ELEMENTAL_SHIELD_12,nUses); break;
        case 6: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ENERVATION_7,nUses); break;
        case 7: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_EVARDS_BLACK_TENTACLES_15,nUses); break;
        case 8: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FEAR_5,nUses); break;
        case 9: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FLAME_STRIKE_18,nUses); break;
        case 10: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FREEDOM_OF_MOVEMENT_7,nUses); break;
        case 11: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_HAMMER_OF_THE_GODS_12,nUses); break;
        case 12: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_HOLD_MONSTER_7,nUses); break;
        case 13: ipSpell = ItemPropertyCastSpell(473,nUses); break;
        case 14: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ICE_STORM_9,nUses); break;
        case 15: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_IMPROVED_INVISIBILITY_7,nUses); break;
        case 16: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_INFLICT_CRITICAL_WOUNDS_12,nUses); break;
        case 17: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ISAACS_LESSER_MISSILE_STORM_13,nUses); break;
        case 18: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_LEGEND_LORE_5,nUses); break;
        case 19: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_LESSER_SPELL_BREACH_7,nUses); break;
        case 20: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MASS_CAMOFLAGE_13,nUses); break;
        case 21: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MINOR_GLOBE_OF_INVULNERABILITY_15,nUses); break;
        case 22: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_PHANTASMAL_KILLER_7,nUses); break;
        case 23: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_POLYMORPH_SELF_7,nUses); break;
        case 24: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_RESTORATION_7,nUses); break;
        case 25: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SHADOW_CONJURATION_7,nUses); break;
        case 26: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_STONESKIN_7,nUses); break;
        case 27: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SUMMON_CREATURE_IV_7,nUses); break;
        case 28: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_WALL_OF_FIRE_9,nUses); break;
        case 29: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_WAR_CRY_7,nUses); break;
    }
    return ipSpell;
}


itemproperty dmSpell_L5(int ModCode,int nUses)
{
    itemproperty ipSpell;
    switch(ModCode)
    {
        case 1: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ANIMATE_DEAD_15,nUses); break;
        case 2: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_AWAKEN_9,nUses); break;
        case 3: ipSpell = ItemPropertyCastSpell(454,nUses); break;
        case 4: ipSpell = ItemPropertyCastSpell(455,nUses); break;
        case 5: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BIGBYS_INTERPOSING_HAND_15,nUses); break;
        case 6: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CIRCLE_OF_DOOM_20,nUses); break;
        case 7: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CLOUDKILL_9,nUses); break;
        case 8: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CONE_OF_COLD_15,nUses); break;
        // case 9: DISMISSAL - available at 4th
        case 10: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DOMINATE_PERSON_7,nUses); break;
        case 11: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ENERGY_BUFFER_20,nUses); break;
        case 12: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FEEBLEMIND_9,nUses); break;
        case 13: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FIREBRAND_15,nUses); break;
        // case 14: FLAMESTRIKE - available at 4th
        case 15: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GREATER_SHADOW_CONJURATION_9,nUses); break;
        case 16: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_HEALING_CIRCLE_16,nUses); break;
        case 17: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_INFERNO_15,nUses); break;
        case 18: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_LESSER_MIND_BLANK_9,nUses); break;
        case 19: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_LESSER_PLANAR_BINDING_9,nUses); break;
        case 20: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_LESSER_SPELL_MANTLE_9,nUses); break;
        case 21: ipSpell = ItemPropertyCastSpell(462,nUses); break;
        case 22: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MIND_FOG_9,nUses); break;
        case 23: ipSpell = ItemPropertyCastSpell(463,nUses); break;
        case 24: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_OWLS_INSIGHT_15,nUses); break;
        case 25: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_RAISE_DEAD_9,nUses); break;
        case 26: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SLAY_LIVING_9,nUses); break;
        case 27: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SPELL_RESISTANCE_15,nUses); break;
        case 28: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SUMMON_CREATURE_V_9,nUses); break;
        case 29: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_TRUE_SEEING_9,nUses); break;
        case 30: ipSpell = ItemPropertyCastSpell(467,nUses); break;
    }
    return ipSpell;
}


itemproperty dmSpell_L6(int ModCode,int nUses)
{
    itemproperty ipSpell;
    switch(ModCode)
    {
        case 1: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ACID_FOG_11,nUses); break;
        case 2: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BANISHMENT_15,nUses); break;
        case 3: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BIGBYS_FORCEFUL_HAND_15,nUses); break;
        case 4: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BLADE_BARRIER_15,nUses); break;
        case 5: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CHAIN_LIGHTNING_20,nUses); break;
        case 6: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CIRCLE_OF_DEATH_20,nUses); break;
        case 7: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CONTROL_UNDEAD_20,nUses); break;
        case 8: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CREATE_UNDEAD_16,nUses); break;
        case 9: ipSpell = ItemPropertyCastSpell(450,nUses); break;
        case 10: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DIRGE_15,nUses); break;
        case 11: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DROWN_15,nUses); break;
        // case 12: ENERGY BUFFER - available at 5th
        case 13: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ETHEREAL_VISAGE_15,nUses); break;
        case 14: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GLOBE_OF_INVULNERABILITY_11,nUses); break;
        case 15: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GREATER_DISPELLING_15,nUses); break;
        case 16: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GREATER_SPELL_BREACH_11,nUses); break;
        case 17: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GREATER_STONESKIN_11,nUses); break;
        case 18: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_HARM_11,nUses); break;
        case 19: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_HEAL_11,nUses); break;
        case 20: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ISAACS_GREATER_MISSILE_STORM_15,nUses); break;
        case 21: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MASS_HASTE_11,nUses); break;
        case 22: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_PLANAR_ALLY_15,nUses); break;
        case 23: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_REGENERATE_13,nUses); break;
        case 24: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SHADES_11,nUses); break;
        case 25: ipSpell = ItemPropertyCastSpell(482,nUses); break;
        case 26: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SUMMON_CREATURE_VI_11,nUses); break;
        case 27: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_TENSERS_TRANSFORMATION_11,nUses); break;
        case 28: ipSpell = ItemPropertyCastSpell(466,nUses); break;
    }
    return ipSpell;
}


itemproperty dmSpell_L7(int ModCode,int nUses)
{
    itemproperty ipSpell;
    switch(ModCode)
    {
        case 1: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_AURA_OF_VITALITY_13,nUses); break;
        case 2: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BIGBYS_GRASPING_HAND_17,nUses); break;
        case 3: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CREEPING_DOOM_13,nUses); break;
        case 4: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DELAYED_BLAST_FIREBALL_20,nUses); break;
        case 5: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DESTRUCTION_13,nUses); break;
        case 6: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FINGER_OF_DEATH_13,nUses); break;
        case 7: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FIRE_STORM_18,nUses); break;
        case 8: ipSpell = ItemPropertyCastSpell(453,nUses); break;
        case 9: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GREATER_RESTORATION_13,nUses); break;
        case 10: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MORDENKAINENS_SWORD_18,nUses); break;
        case 11: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_POWER_WORD_STUN_13,nUses); break;
        case 12: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_PRISMATIC_SPRAY_13,nUses); break;
        case 13: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_PROTECTION_FROM_SPELLS_20,nUses); break;
        case 14: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_RESURRECTION_13,nUses); break;
        case 15: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SHADOW_SHIELD_13,nUses); break;
        case 16: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SPELL_MANTLE_13,nUses); break;
        case 17: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SUMMON_CREATURE_VII_13,nUses); break;
        case 18: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_WORD_OF_FAITH_13,nUses); break;
    }
    return ipSpell;
}


itemproperty dmSpell_L8(int ModCode,int nUses)
{
    itemproperty ipSpell;
    switch(ModCode)
    {
        case 1: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_AURA_VERSUS_ALIGNMENT_15,nUses); break;
        case 2: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BIGBYS_CLENCHED_FIST_20,nUses); break;
        case 3: ipSpell = ItemPropertyCastSpell(476,nUses); break;
        case 4: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BOMBARDMENT_20,nUses); break;
        case 5: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_CREATE_GREATER_UNDEAD_18,nUses); break;
        case 6: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_EARTHQUAKE_20,nUses); break;
        case 7: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GREATER_PLANAR_BINDING_15,nUses); break;
        case 8: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_HORRID_WILTING_20,nUses); break;
        case 9: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_INCENDIARY_CLOUD_15,nUses); break;
        case 10: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MASS_BLINDNESS_DEAFNESS_15,nUses); break;
        case 11: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MASS_CHARM_15,nUses); break;
        case 12: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MIND_BLANK_15,nUses); break;
        case 13: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_NATURES_BALANCE_15,nUses); break;
        case 14: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_PREMONITION_15,nUses); break;
        case 15: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SUMMON_CREATURE_VIII_15,nUses); break;
        case 16: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SUNBEAM_13,nUses); break;
        case 17: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SUNBURST_20,nUses); break;
    }
    return ipSpell;
}


itemproperty dmSpell_L9(int ModCode,int nUses)
{
    itemproperty ipSpell;
    switch(ModCode)
    {
        case 1: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_BIGBYS_CRUSHING_HAND_20,nUses); break;
        case 2: ipSpell = ItemPropertyCastSpell(468,nUses); break;
        case 3: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_DOMINATE_MONSTER_17,nUses); break;
        case 4: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ELEMENTAL_SWARM_17,nUses); break;
        case 5: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_ENERGY_DRAIN_17,nUses); break;
        case 6: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GATE_17,nUses); break;
        case 7: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_GREATER_SPELL_MANTLE_17,nUses); break;
        case 8: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_IMPLOSION_17,nUses); break;
        case 9: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MASS_HEAL_15,nUses); break;
        case 10: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_METEOR_SWARM_17,nUses); break;
        case 11: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MORDENKAINENS_DISJUNCTION_17,nUses); break;
        case 12: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_POWER_WORD_KILL_17,nUses); break;
        case 13: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SHAPECHANGE_17,nUses); break;
        case 14: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_STORM_OF_VENGEANCE_17,nUses); break;
        case 15: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_SUMMON_CREATURE_IX_17,nUses); break;
        case 16: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_TIME_STOP_17,nUses); break;
        case 17: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_WAIL_OF_THE_BANSHEE_17,nUses); break;
        case 18: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_WEIRD_17,nUses); break;
        case 19: ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_UNDEATHS_ETERNAL_FOE_20,nUses); break;
    }
    return ipSpell;
}


int dmIsCEPMelee(object oItem);
int dmIsCEPMelee(object oItem)
{
    int bCEP = FALSE;
    int iType = GetBaseItemType(oItem);

    switch(iType)
    {
        //case 300:   bCEP = TRUE; break;  removed for CEPv2 NWNv1.67
        case 301:   bCEP = TRUE; break;
        case 302:   bCEP = TRUE; break;
        case 303:   bCEP = TRUE; break;
        case 304:   bCEP = TRUE; break;
        case 305:   bCEP = TRUE; break;
        case 308:   bCEP = TRUE; break;
        case 309:   bCEP = TRUE; break;
        case 310:   bCEP = TRUE; break;
        case 312:   bCEP = TRUE; break;
        case 313:   bCEP = TRUE; break;
        case 316:   bCEP = TRUE; break;
        case 317:   bCEP = TRUE; break;
        case 318:   bCEP = TRUE; break;
        case 319:   bCEP=TRUE;break;
        case 320:   bCEP=TRUE;break;
        case 321:   bCEP=TRUE; break;
        case 322:   bCEP = TRUE; break;
        case 323:   bCEP= TRUE; break;
    }
    return bCEP;
}

int BaseItemValid(object oItem)
{
    int rValue = FALSE;

    if(USE_CEP == TRUE && dmIsCEPMelee(oItem))
    { return rValue = TRUE; }

    if(IPGetIsRangedWeapon(oItem)
        || IPGetIsMeleeWeapon(oItem))
        { return rValue = TRUE; }

    int iItem = GetBaseItemType(oItem);
    switch(iItem)
    {
        case BASE_ITEM_AMULET:rValue = TRUE;break;
        case BASE_ITEM_ARMOR:rValue = TRUE;break;
        case BASE_ITEM_BELT:rValue = TRUE;break;
        case BASE_ITEM_BRACER:rValue = TRUE;break;
        case BASE_ITEM_CLOAK:rValue = TRUE;break;
        case BASE_ITEM_GLOVES:rValue = TRUE;break;
        case BASE_ITEM_HELMET:rValue = TRUE;break;
        case BASE_ITEM_LARGESHIELD:rValue = TRUE;break;
        case BASE_ITEM_MAGICSTAFF:rValue = TRUE;break;
        case BASE_ITEM_BOOTS:rValue = TRUE;break;
        case BASE_ITEM_RING:rValue = TRUE;break;
        case BASE_ITEM_SMALLSHIELD:rValue = TRUE;break;
        case BASE_ITEM_TOWERSHIELD:rValue = TRUE;break;
    }
    return rValue;
}

int IsBaseMagicItem(object oItem)
{
    int rValue = FALSE;

    if(BaseItemValid(oItem))
    { return rValue = TRUE; }

    int iItem = GetBaseItemType(oItem);

    if(USE_CEP && (iItem == 307 || iItem == 311))
    {
        return rValue = TRUE;
    }
    else
    switch(iItem)
    {
        case BASE_ITEM_BOOK: rValue = TRUE; break;
        case BASE_ITEM_MAGICSTAFF: rValue = TRUE; break;
        case BASE_ITEM_MAGICROD: rValue = TRUE; break;
        case BASE_ITEM_MAGICWAND: rValue = TRUE; break;
        case BASE_ITEM_MISCLARGE: rValue = TRUE; break;
        case BASE_ITEM_MISCMEDIUM: rValue = TRUE; break;
        case BASE_ITEM_MISCSMALL: rValue = TRUE; break;
        case BASE_ITEM_MISCTHIN: rValue = TRUE; break;
    }
    return rValue;
}

// returns true if oItem is a wand
int IsBaseItemWand(object oItem);

int IsBaseItemWand(object oItem)
{
    return GetBaseItemType(oItem) == BASE_ITEM_MAGICWAND;
}


int IsModMax(object oTarget)
{
    int Mods = IPGetNumberOfItemProperties(oTarget);
    itemproperty ip = GetFirstItemProperty(oTarget);
    int ipType;
    while(GetIsItemPropertyValid(ip))
    {
        ipType = GetItemPropertyType(ip);
        if(ipType == ITEM_PROPERTY_VISUALEFFECT ||
            ipType == ITEM_PROPERTY_USE_LIMITATION_ALIGNMENT_GROUP ||
            ipType == ITEM_PROPERTY_USE_LIMITATION_CLASS ||
            ipType == ITEM_PROPERTY_USE_LIMITATION_RACIAL_TYPE ||
            ipType == ITEM_PROPERTY_USE_LIMITATION_SPECIFIC_ALIGNMENT)
        {
            Mods --;
        }
        else
        if(USE_CEP && ipType == 150){Mods--;}

        ip = GetNextItemProperty(oTarget);
    }
    return (Mods >= FORGE_MAX_ENHANCEMENTS);
}


int dmIsMaxLevel(object oItem)
{
    int nCost = GetGoldPieceValue(oItem);
    int bMax = FALSE;

    if(nCost > ITEM_MAX_LVL) {bMax = TRUE;}

    return bMax;
}


int GetHasTokens(object oPC, int Count)
{
    int Total = 0;
    object oToken = GetFirstItemInInventory(oPC);
    while(GetIsObjectValid(oToken))
    {
        if(GetTag(oToken) == "dm_ftoken")
        {
            Total = Total + GetItemStackSize(oToken);
        }
        oToken = GetNextItemInInventory(oPC);
    }
    return Total >= Count;
}

void GetTokens(object oPC, int Count)
{
    int Done = FALSE;
    object oToken = GetFirstItemInInventory(oPC);
    while(GetIsObjectValid(oToken) && !Done)
    {
        if(GetTag(oToken) == "dm_ftoken")
        {
            int iStack = GetItemStackSize(oToken);
            if(iStack > Count)
            {
                SetItemStackSize(oToken,(iStack-Count));
                Done = TRUE;
            }

            else
            {
                Count = Count - iStack;
                DestroyObject(oToken);
            }
        }
        oToken = GetNextItemInInventory(oPC);
    }
}


void DoEnhancements(object oTarget, int Mods, int ModCode)
{
    int NCode = (ModCode - 1);
    itemproperty ipNew;
    switch(Mods)
    {
        case 1: ipNew = dmEnhancement(NCode); break;
        case 2: ipNew = dmDamageBonus(NCode); break;
        case 3: ipNew = dmBonusFeat(NCode); break;
        case 4: ipNew = dmDamageReduction(NCode); break;
        case 5: ipNew = dmDamageResistance(NCode); break;
        case 6: ipNew = dmBonusAC(NCode); break;
        case 7: ipNew = dmAbilityModifier(NCode); break;
        case 8: ipNew = dmSkillBonusFirstList(NCode); break;
        case 9: ipNew = dmSkillBonusSecondList(NCode); break;
        case 10: ipNew = dmSkillBonusThirdList(NCode); break;
        case 11: ipNew = dmMiscImmunity(NCode); break;
        case 12: ipNew = dmSavThrowBonus(NCode); break;
        case 13: ipNew = dmMiscBonus(NCode); break;
        case 14: ipNew = dmAttackBonus(NCode); break;
        case 15: ipNew = dmRegenBonus(NCode); break;
        case 16: ipNew = dmMightyBonus(NCode); break;
    }

    IPSafeAddItemProperty(oTarget,ipNew,0.0,X2_IP_ADDPROP_POLICY_REPLACE_EXISTING,FALSE,FALSE);
}

void dmAddSpellEnchantment(object oTarget, int SpellLv, int Mods, int ModCode)
{
    itemproperty ipNew;
    switch(SpellLv)
    {
        case 0: ipNew = dmSpell_L0(ModCode,Mods); break;
        case 1: ipNew = dmSpell_L1(ModCode,Mods); break;
        case 2: ipNew = dmSpell_L2(ModCode,Mods); break;
        case 3: ipNew = dmSpell_L3(ModCode,Mods); break;
        case 4: ipNew = dmSpell_L4(ModCode,Mods); break;
        case 5: ipNew = dmSpell_L5(ModCode,Mods); break;
        case 6: ipNew = dmSpell_L6(ModCode,Mods); break;
        case 7: ipNew = dmSpell_L7(ModCode,Mods); break;
        case 8: ipNew = dmSpell_L8(ModCode,Mods); break;
        case 9: ipNew = dmSpell_L9(ModCode,Mods); break;
        // For later possible use
        // case 10: ipNew = dmSpell_EPIC(ModCode,Mods); break;
    }

    IPSafeAddItemProperty(oTarget,ipNew,0.0,X2_IP_ADDPROP_POLICY_REPLACE_EXISTING,FALSE,FALSE);
}

void SetSmithToken(object oSmith,string sGold,string sTokens,string sLvToken)
{
    string sSmith = GetStringRight(GetTag(oSmith),1);

    if (sSmith == "1")
    {
        SetCustomToken(4500,sGold);
        SetCustomToken(4501,sTokens);
        SetCustomToken(4502,sLvToken);
    }
    else
    if(sSmith == "2")
    {
        SetCustomToken(4503,sGold);
        SetCustomToken(4504,sTokens);
        SetCustomToken(4505,sLvToken);
    }
    else
    if(sSmith == "3")
    {
        SetCustomToken(4506,sGold);
        SetCustomToken(4507,sTokens);
        SetCustomToken(4508,sLvToken);
    }
    else
    if(sSmith == "4")
    {
        SetCustomToken(4509,sGold);
        SetCustomToken(4510,sTokens);
        SetCustomToken(4511,sLvToken);
    }
    else
    if(sSmith == "5")
    {
        SetCustomToken(4512,sGold);
        SetCustomToken(4513,sTokens);
        SetCustomToken(4514,sLvToken);
    }
}


string dmGetNewLevel(object oItem)
{
    int nValue = GetGoldPieceValue(oItem);
    string sLevel;

    if(nValue > L_60) { sLevel = "A Godly 61+"; }
    else if(nValue > L_59) { sLevel = "60"; }
    else if(nValue > L_58) { sLevel = "59"; }
    else if(nValue > L_57) { sLevel = "58"; }
    else if(nValue > L_56) { sLevel = "57"; }
    else if(nValue > L_55) { sLevel = "56"; }
    else if(nValue > L_54) { sLevel = "55"; }
    else if(nValue > L_53) { sLevel = "54"; }
    else if(nValue > L_52) { sLevel = "53"; }
    else if(nValue > L_51) { sLevel = "52"; }
    else if(nValue > L_50) { sLevel = "51"; }
    else if(nValue > L_49) { sLevel = "50"; }
    else if(nValue > L_48) { sLevel = "49"; }
    else if(nValue > L_47) { sLevel = "48"; }
    else if(nValue > L_46) { sLevel = "47"; }
    else if(nValue > L_45) { sLevel = "46"; }
    else if(nValue > L_44) { sLevel = "45"; }
    else if(nValue > L_43) { sLevel = "44"; }
    else if(nValue > L_42) { sLevel = "43"; }
    else if(nValue > L_41) { sLevel = "42"; }
    else if(nValue > L_40) { sLevel = "41"; }
    else if(nValue > L_39) { sLevel = "40"; }
    else if(nValue > L_38) { sLevel = "39"; }
    else if(nValue > L_37) { sLevel = "38"; }
    else if(nValue > L_36) { sLevel = "37"; }
    else if(nValue > L_35) { sLevel = "36"; }
    else if(nValue > L_34) { sLevel = "35"; }
    else if(nValue > L_33) { sLevel = "34"; }
    else if(nValue > L_32) { sLevel = "33"; }
    else if(nValue > L_31) { sLevel = "32"; }
    else if(nValue > L_30) { sLevel = "31"; }
    else if(nValue > L_29) { sLevel = "30"; }
    else if(nValue > L_28) { sLevel = "29"; }
    else if(nValue > L_27) { sLevel = "28"; }
    else if(nValue > L_26) { sLevel = "27"; }
    else if(nValue > L_25) { sLevel = "26"; }
    else if(nValue > L_24) { sLevel = "25"; }
    else if(nValue > L_23) { sLevel = "24"; }
    else if(nValue > L_22) { sLevel = "23"; }
    else if(nValue > L_21) { sLevel = "22"; }
    else if(nValue > L_20) { sLevel = "21"; }
    else if(nValue > L_19) { sLevel = "20"; }
    else if(nValue > L_18) { sLevel = "19"; }
    else if(nValue > L_17) { sLevel = "18"; }
    else if(nValue > L_16) { sLevel = "17"; }
    else if(nValue > L_15) { sLevel = "16"; }
    else if(nValue > L_14) { sLevel = "15"; }
    else if(nValue > L_13) { sLevel = "14"; }
    else if(nValue > L_12) { sLevel = "13"; }
    else if(nValue > L_11) { sLevel = "12"; }
    else if(nValue > L_10) { sLevel = "11"; }
    else if(nValue > L_09) { sLevel = "10"; }
    else if(nValue > L_08) { sLevel = "9"; }
    else if(nValue > L_07) { sLevel = "8"; }
    else if(nValue > L_06) { sLevel = "7"; }
    else if(nValue > L_05) { sLevel = "6"; }
    else if(nValue > L_04) { sLevel = "5"; }
    else if(nValue > L_03) { sLevel = "4"; }
    else if(nValue > L_02) { sLevel = "3"; }
    else if(nValue > L_01) { sLevel = "2"; }

    else { sLevel = "1"; }

    return sLevel;
}


void SetModCost(object oOriginal, object oModified, object oSmith)
{
    int y = GetGoldPieceValue(oModified);
    int x = GetGoldPieceValue(oOriginal);
    float fDiff = IntToFloat(abs(y-x));

    float fGoldCost = CASH_COST_MULTIPLIER * fDiff;
    float fTokenCost;

    if(y > L_20)
    {
        fGoldCost = fGoldCost * EPIC_COST_VAR;
        fTokenCost = fDiff * EPIC_COST_VAR;
    }

    fTokenCost /= FORGE_TOKEN_VALUE;


    int iGold = FloatToInt(fGoldCost);
    int iToken = FloatToInt(fTokenCost);

    if (PAYMENT_METHOD == 1) // Gold for payment
    {
        if(GetLocalInt(oSmith,"Visual"))
        {
            iGold = VISUAL_GOLD_VALUE;
            iToken = 0;
        }

        if(y <= x)
        {
            SetLocalInt(oSmith,"Refund",TRUE);
        }

        if(iGold < 1)
        {
            iGold = 1;
            iToken = 0;
        }

        SetLocalInt(oSmith,"GoldCost",iGold);
        SetLocalInt(oSmith,"TokenCost",0);
        SetSmithToken(oSmith,IntToString(iGold),"0",dmGetNewLevel(oModified));
    }
    else
    if(PAYMENT_METHOD == 2) // Tokens used instead
    {
        if(GetLocalInt(oSmith,"Visual"))
        {
            iGold = 0;
            iToken = VISUAL_TOKEN_VALUE;
        }

        if(y <= x)
        {
            SetLocalInt(oSmith,"Refund",TRUE);
        }

        if(iToken < 1)
        {
            iGold = 0;
            iToken = 1;
        }

        SetLocalInt(oSmith,"GoldCost",0);
        SetLocalInt(oSmith,"TokenCost",iToken);
        SetSmithToken(oSmith,"0",IntToString(iToken),dmGetNewLevel(oModified));
    }
    else
    if(PAYMENT_METHOD == 3) // Use both gold and tokens
    {
        if(GetLocalInt(oSmith,"Visual"))
        {
            iGold = VISUAL_GOLD_VALUE;
            iToken = VISUAL_TOKEN_VALUE;
        }

        if(y <= x)
        {
            SetLocalInt(oSmith,"Refund",TRUE);
        }

        if(iToken < 1) iToken = 1;
        if(iGold < 1) iGold = 1;

        SetLocalInt(oSmith,"GoldCost",iGold);
        SetLocalInt(oSmith,"TokenCost",iToken);
        SetSmithToken(oSmith,IntToString(iGold),IntToString(iToken),dmGetNewLevel(oModified));
    }
}


void ModItem(object oOriginal, object oForge, object oAnvil, object oSmith, int Mods, int ModCode)
{
    object oModified = CopyItem(oOriginal,oAnvil);
    SetLocalObject(oSmith,"ITEM_IN_FORGE",oOriginal);
    DoEnhancements(oModified,Mods,ModCode);

    DelayCommand(0.3, SetModCost(oOriginal, oModified, oSmith));

}

void ModSpellItem(object oOriginal,object oPool,object oAnvil,object oMage,int iSpell,int Mods,int ModCode)
{
    object oModified = CopyItem(oOriginal,oAnvil);
    SetLocalObject(oMage,"ITEM_IN_FORGE",oOriginal);
    dmAddSpellEnchantment(oModified,iSpell,Mods,ModCode);

    DelayCommand(0.3, SetModCost(oOriginal,oModified,oMage));
}

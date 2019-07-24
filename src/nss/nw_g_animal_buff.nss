//::///////////////////////////////////////////////
//:: FileName nw_g_animal_buff
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 1/15/2019 1:22:07 PM
//:://////////////////////////////////////////////
void main()
{
    object oMaster = GetPCSpeaker();

    effect eEffect = GetFirstEffect(OBJECT_SELF);
    while(GetIsEffectValid(eEffect))
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_ABILITY_INCREASE ||
            GetEffectType(eEffect) == EFFECT_TYPE_AC_INCREASE ||
            GetEffectType(eEffect) == EFFECT_TYPE_ATTACK_INCREASE ||
            GetEffectType(eEffect) == EFFECT_TYPE_SAVING_THROW_INCREASE ||
            GetEffectType(eEffect) == EFFECT_TYPE_SKILL_INCREASE)
        {
            RemoveEffect(OBJECT_SELF, eEffect);
        }

        eEffect = GetNextEffect(OBJECT_SELF);
    }

    int iRank;
    int iRawRank;

    if (GetAssociateType(OBJECT_SELF) == ASSOCIATE_TYPE_ANIMALCOMPANION)
    {
        iRank = GetSkillRank(SKILL_ANIMAL_EMPATHY, oMaster);
        iRawRank = GetSkillRank(SKILL_ANIMAL_EMPATHY, oMaster, TRUE);
    }

    if (GetAssociateType(OBJECT_SELF) == ASSOCIATE_TYPE_FAMILIAR)
    {
        iRank = GetSkillRank(SKILL_CONCENTRATION, oMaster);
        iRawRank = GetSkillRank(SKILL_CONCENTRATION, oMaster, TRUE);
    }

    if (iRank > 120) iRank == 120;
    if (iRank < 10) iRank == 10;

    if (iRawRank < 1) iRawRank == 1;

    string sMsg = "<c σ >Your creature gained the following bonuses.";
    sMsg += "\n";
    sMsg += "</c>Ability Bonus: <cσσσ>" + IntToString(iRank / 10);
    sMsg += "\n";
    sMsg += "</c>AC: <cσσσ>" + IntToString(iRank / 6);
    sMsg += "\n";
    sMsg += "</c>HP Bonus: <cσσσ>" + IntToString(iRank);
    sMsg += "\n";
    sMsg += "</c>Attack Bonus: <cσσσ>" + IntToString(iRank / 6);
    sMsg += "\n";
    sMsg += "</c>Saves Bonus: <cσσσ>" + IntToString(iRank / 6);
    sMsg += "\n";
    sMsg += "</c>Skill Bonus: <cσσσ>" + IntToString(iRawRank);
    sMsg += "\n";
    sMsg += "</c>Concealment: <cσσσ>" + IntToString(iRawRank);
    sMsg += "\n";
    sMsg += "</c>Spell Resistance: <cσσσ>" + IntToString(iRawRank);
    SendMessageToPC(oMaster, sMsg);

    effect eCHA = EffectAbilityIncrease(ABILITY_CHARISMA, iRank / 10);      // +1 per 10 points
    effect eCON = EffectAbilityIncrease(ABILITY_CONSTITUTION, iRank / 10);  // +1 per 10 points
    effect eDEX = EffectAbilityIncrease(ABILITY_DEXTERITY, iRank / 10);     // +1 per 10 points
    effect eINT = EffectAbilityIncrease(ABILITY_INTELLIGENCE, iRank / 10);  // +1 per 10 points
    effect eSTR = EffectAbilityIncrease(ABILITY_STRENGTH, iRank / 10);      // +1 per 10 points
    effect eWIS = EffectAbilityIncrease(ABILITY_WISDOM, iRank / 10);        // +1 per 10 points

    effect eAC = EffectACIncrease(iRank / 6); // +1 per 6 points
    effect eAttack = EffectAttackIncrease(iRank / 6); // +1 per 6 points
    effect eSaves = EffectSavingThrowIncrease(SAVING_THROW_ALL, iRank / 6); // +1 per 6 points
    effect eHP = EffectTemporaryHitpoints(iRank); // HP gained equals iRank
    effect eSkill = EffectSkillIncrease(SKILL_ALL_SKILLS, iRawRank); // raw skill points
    effect eConceal = EffectConcealment(iRawRank); // raw skill points
    effect eHaste = EffectHaste();
    effect eSR = EffectSpellResistanceIncrease(iRawRank); // raw skill points
    effect eLink = EffectLinkEffects(eCHA, eCON);

    eLink = EffectLinkEffects(eLink, eDEX);
    eLink = EffectLinkEffects(eLink, eINT);
    eLink = EffectLinkEffects(eLink, eSTR);
    eLink = EffectLinkEffects(eLink, eWIS);
    eLink = EffectLinkEffects(eLink, eAC);
    eLink = EffectLinkEffects(eLink, eAttack);
    eLink = EffectLinkEffects(eLink, eSaves);
    eLink = EffectLinkEffects(eLink, eHP);
    eLink = EffectLinkEffects(eLink, eSkill);
    eLink = EffectLinkEffects(eLink, eConceal);
    eLink = EffectLinkEffects(eLink, eHaste);
    eLink = EffectLinkEffects(eLink, eSR);

    effect eBuff = ExtraordinaryEffect(eLink);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBuff, OBJECT_SELF, TurnsToSeconds(iRawRank)); // Duration is turns = raw skill ranks

    effect eFNF = EffectVisualEffect(VFX_FNF_LOS_NORMAL_30);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eFNF, GetLocation(OBJECT_SELF));
}

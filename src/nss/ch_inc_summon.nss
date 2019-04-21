//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//
//  ch_inc_summon
//  Authored By: Cheetah (Katherine Taylor)
//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//
/*
    Notes: Include containing all the summoning bits and pieces.
    Edit: Takes into account conjuration focus feats... for an added twist.
    Edit 18/3/08 - Damage Bonuses fixed. An appropiate amount for each
                   level of bonus is applied now.
*/
//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//

// Applies effects according to the caster's level to the newly summoned creature.
// oMaster should be the master of the creature calling this function.
void ApplyBonusSummonEffects(object oMaster);

void ApplyBonusSummonEffects(object oMaster)
{
// STEP 1:
// First off, we get the bonus bracket which is 1-5, 5 being a high level caster.
int nLevel = GetCasterLevel(oMaster);
int nBracket;

    if (nLevel > 35)
    nBracket = 5;
    else if (nLevel > 25)
    nBracket = 4;
    else if (nLevel > 15)
    nBracket = 3;
    else if (nLevel > 5)
    nBracket = 2;
    else
    nBracket = 1;

// STEP 2:
// Now get the bonus for AB/AC etc...
int nValue;

nValue = nBracket - 1;

    if (GetHasFeat(FEAT_EPIC_SPELL_FOCUS_CONJURATION, oMaster))
    {
    nValue += 3;
//    SendMessageToPC(oMaster, "Found ''Epic Spell Focus Conjuration'' nValue = " + IntToString(nValue)); // DEBUG MESSAGE
    }
    else if (GetHasFeat(FEAT_GREATER_SPELL_FOCUS_CONJURATION, oMaster))
    {
    nValue += 2;
//    SendMessageToPC(oMaster, "Found ''Greater Spell Focus Conjuration'' nValue = " + IntToString(nValue)); // DEBUG MESSAGE
    }
    else if (GetHasFeat(FEAT_SPELL_FOCUS_CONJURATION, oMaster))
    {
    nValue += 1;
//    SendMessageToPC(oMaster, "Found ''Spell Focus Conjuration'' nValue = " + IntToString(nValue)); // DEBUG MESSAGE
    }

// STEP 3:
// Next we get HP bonus.
float fValue;

    switch (nBracket)
    {
    case 1: fValue = 0.0; break;
    case 2: fValue = 0.04; break;
    case 3: fValue = 0.08; break;
    case 4: fValue = 0.12; break;
    case 5: fValue = 0.16; break;
    }

    if (GetHasFeat(FEAT_EPIC_SPELL_FOCUS_CONJURATION, oMaster))
    {
    fValue += 0.12;
//    SendMessageToPC(oMaster, "Found ''Epic Spell Focus Conjuration'' fValue = " + FloatToString((fValue * 100), 3, 2)); // DEBUG MESSAGE
    }
    else if (GetHasFeat(FEAT_GREATER_SPELL_FOCUS_CONJURATION, oMaster))
    {
    fValue += 0.08;
//    SendMessageToPC(oMaster, "Found ''Greater Spell Focus Conjuration'' fValue = " + FloatToString((fValue * 100), 3, 2)); // DEBUG MESSAGE
    }
    else if (GetHasFeat(FEAT_SPELL_FOCUS_CONJURATION, oMaster))
    {
    fValue += 0.04;
//    SendMessageToPC(oMaster, "Found ''Spell Focus Conjuration'' fValue = " + FloatToString((fValue * 100), 3, 2)); // DEBUG MESSAGE
    }

// STEP 4:
// Now we do the actual applying of the bonuses above...

// I am not writing this as OBJECT_SELF for a reason. DO NOT CHANGE!!!
object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oMaster);
int nMaxHP = GetMaxHitPoints(oSummon);
int nBonus = nValue; // Readability
int nDamageBonus = nBonus; // Readability
float fBonus = fValue; // Readability
float fHPCalculation;
effect eEffect;
string sFeedback;

fHPCalculation = IntToFloat(nMaxHP)*fBonus;
nMaxHP = FloatToInt(fHPCalculation);

eEffect = ExtraordinaryEffect(SupernaturalEffect(EffectAttackIncrease(nBonus)));
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oSummon);

eEffect = ExtraordinaryEffect(SupernaturalEffect(EffectACIncrease(nBonus)));
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oSummon);

eEffect = ExtraordinaryEffect(SupernaturalEffect(EffectSavingThrowIncrease(SAVING_THROW_ALL, nBonus)));
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oSummon);

    switch (nDamageBonus)
    {
    case 1: nDamageBonus = DAMAGE_BONUS_1d4; break;
    case 2: nDamageBonus = DAMAGE_BONUS_1d6; break;
    case 3: nDamageBonus = DAMAGE_BONUS_1d8; break;
    case 4: nDamageBonus = DAMAGE_BONUS_2d4; break;
    case 5: nDamageBonus = DAMAGE_BONUS_2d6; break;
    case 6: nDamageBonus = DAMAGE_BONUS_2d8; break;
    case 7: nDamageBonus = DAMAGE_BONUS_2d10; break;
    case 8: nDamageBonus = DAMAGE_BONUS_2d12; break;
    }
eEffect = ExtraordinaryEffect(SupernaturalEffect(EffectDamageIncrease(nDamageBonus, DAMAGE_TYPE_SLASHING)));
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oSummon);

eEffect = ExtraordinaryEffect(SupernaturalEffect(EffectTemporaryHitpoints(nMaxHP)));
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oSummon);

sFeedback = "Your summon has been given +" + IntToString(nBonus) +
            " to it's abilities due to your casting level and feats.";
SendMessageToPC(oMaster, sFeedback);

//SendMessageToPC(oMaster, "Casting Level = " + IntToString(nLevel)); // DEBUG MESSAGE
}


//void main(){}

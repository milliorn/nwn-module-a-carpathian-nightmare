#include "x2_inc_itemprop"

//Apply Power-ups to the Winner of a PvP duel
void ApplyPvPBonus(object oKiller);
void ApplyPvPBonus(object oKiller)
{
    object oDead       = GetLastPlayerDied(),
           oKiller     = GetLastHostileActor(oDead),
           oRecall     = GetItemPossessedBy(oKiller, "itm_carp_gem");
    object oMyWeapon   = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oKiller);
    int    iBounty     = GetLocalInt(oKiller, "BOUNTY");
    int    iBounty_C   = GetLocalInt(oKiller, "BOUNTY");
    int    iBounty_W   = GetLocalInt(oKiller, "BOUNTY");
    string sTag        = GetTag(OBJECT_SELF);
    string sLeft       = GetStringLeft(sTag, 3);

    // Check if oDead is a player
    if (!GetIsPC(oDead)) return;

    // Check if oKiller is a player possessed familiar
    if (GetIsPossessedFamiliar(oKiller))
    {
        oKiller = GetMaster(oKiller);
    }

    if (sLeft == "SU_" && GetIsPossessedFamiliar(oKiller))
    {
        oKiller = GetMaster(oKiller);
    }

    // Check if oKiller is a player or
    else if (!GetIsPC(oKiller)) return;

    effect eHeal = EffectHeal(GetMaxHitPoints(oKiller));

    if (iBounty >= 5) iBounty = 5;
    if (iBounty_C >= 100) iBounty_C = 100;
    if (iBounty_W >= 20) iBounty_W = 20;

    effect eAC      = EffectACIncrease(iBounty);
    effect eAB      = EffectAttackIncrease(iBounty);
    effect eConceal = EffectConcealment(iBounty_C);
    effect eDR      = EffectDamageReduction(iBounty, DAMAGE_POWER_PLUS_TWENTY, GetMaxHitPoints(oKiller));
    effect eShield  = EffectDamageShield(iBounty, DAMAGE_BONUS_1d6, DAMAGE_TYPE_MAGICAL);
    effect eAtk     = EffectModifyAttacks(1);
    effect eRegen   = EffectRegenerate(iBounty, 6.0);
    effect eSanct   = EffectSanctuary(iBounty_C);
    effect eSave    = EffectSavingThrowIncrease(SAVING_THROW_ALL, iBounty);
    effect eSkill   = EffectSkillIncrease(SKILL_ALL_SKILLS, iBounty);
    effect eSpellSR = EffectSpellResistanceIncrease(iBounty_C);
    effect eHP      = EffectTemporaryHitpoints(iBounty_C);

    effect eDur = EffectVisualEffect(VFX_DUR_GHOST_SMOKE_2);
    effect eVis2 = EffectVisualEffect(VFX_DUR_PDK_FEAR);

    //Link effects
    effect eLink = EffectLinkEffects(eVis2, eDur);
    eLink = ExtraordinaryEffect(eLink);

    effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);

    itemproperty ipWeapon = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_POSITIVE, DAMAGE_BONUS_1d6);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oKiller);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oKiller);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oKiller, TurnsToSeconds(iBounty));

    IPSafeAddItemProperty(oMyWeapon, ipWeapon, TurnsToSeconds(iBounty_C));

    DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eAC), oKiller, TurnsToSeconds(iBounty_W)));
    DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eAB), oKiller, TurnsToSeconds(iBounty_W)));
    DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eConceal), oKiller, TurnsToSeconds(iBounty_W)));
    DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eDR), oKiller, TurnsToSeconds(iBounty_W)));
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eShield), oKiller, TurnsToSeconds(iBounty_W)));
    DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eAtk), oKiller, TurnsToSeconds(iBounty_W)));
    DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eRegen), oKiller, TurnsToSeconds(iBounty_W)));
    DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eSanct), oKiller, TurnsToSeconds(iBounty_W)));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eSave), oKiller, TurnsToSeconds(iBounty_W)));
    DelayCommand(1.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eSkill), oKiller, TurnsToSeconds(iBounty_W)));
    DelayCommand(1.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eSpellSR), oKiller, TurnsToSeconds(iBounty_W)));
    DelayCommand(1.3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(eHP), oKiller, TurnsToSeconds(iBounty_W)));
}

string CheckPCCR(object oDead, object oKiller)
{
/*
     a rating of effortless is 6 levels lower
     a rating of easy is 4 to 5 levels lower
     a rating of moderate is 2 to 3 levels lower
     a rating f challenging is same or 1 level lower
     a rating of very difficult is 1 or 2 levels higher
     a rating of overpowering is 3 or 4 levels higher
     a rating of impossible is 5 or more levels higher.
*/
    int iPC = GetHitDice(oDead),
        iKiller = GetHitDice(oKiller),

        iDead_LL = GetLocalInt(GetItemPossessedBy(oDead, "hgll_check_level"), "nLegendLevel"),
        iKiller_LL = GetLocalInt(GetItemPossessedBy(oKiller, "plotItemTag"), "nLegendLevel");

    if (iDead_LL > 40) iPC = iDead_LL;
    if (iKiller_LL > 40) iKiller = iKiller_LL;

    if (iPC + 6 <= iKiller)                            return "an <cóóó>EFFORTLESS</c> rating";
    else if (iPC + 5 == iKiller || iPC + 4 == iKiller) return "an <c ó >EASY</c> rating";
    else if (iPC + 3 == iKiller || iPC + 2 == iKiller) return "a <c fþ>MODERATE</c> rating";
    else if (iPC + 1 == iKiller || iPC == iKiller)     return "a <cóó >CHALLENGING</c> rating";
    else if (iKiller + 2 == iPC || iKiller + 1 == iPC) return "a <cþf >VERY DIFFICULT</c> rating";
    else if (iKiller + 4 == iPC || iKiller + 3 == iPC) return "an <có  >OVERPOWERING</c> rating";
    else if (iKiller + 5 <= iPC)                       return "an <có ó>IMPOSSIBLE</c> rating";

    // This should never display
    else return "an UNKNOWN rating";
}

string DiscordPCCR(object oDead, object oKiller)
{
/*
     a rating of effortless is 6 levels lower
     a rating of easy is 4 to 5 levels lower
     a rating of moderate is 2 to 3 levels lower
     a rating f challenging is same or 1 level lower
     a rating of very difficult is 1 or 2 levels higher
     a rating of overpowering is 3 or 4 levels higher
     a rating of impossible is 5 or more levels higher.
*/
    int iPC = GetHitDice(oDead),
        iKiller = GetHitDice(oKiller),
        iDead_LL = GetLocalInt(GetItemPossessedBy(oDead, "hgll_check_level"), "nLegendLevel"),
        iKiller_LL = GetLocalInt(GetItemPossessedBy(oKiller, "plotItemTag"), "nLegendLevel");

    if (iDead_LL > 40) iPC = iDead_LL;
    if (iKiller_LL > 40) iKiller = iKiller_LL;

    if (iPC + 6 <= iKiller)                            return "an EFFORTLESS rating";
    else if (iPC + 5 == iKiller || iPC + 4 == iKiller) return "an EASY rating";
    else if (iPC + 3 == iKiller || iPC + 2 == iKiller) return "a MODERATE rating";
    else if (iPC + 1 == iKiller || iPC == iKiller)     return "a CHALLENGING rating";
    else if (iKiller + 2 == iPC || iKiller + 1 == iPC) return "a VERY DIFFICULT rating";
    else if (iKiller + 4 == iPC || iKiller + 3 == iPC) return "an OVERPOWERING rating";
    else if (iKiller + 5 <= iPC)                       return "an IMPOSSIBLE rating";

    // This should never display
    else return "an UNKNOWN rating";
}

int BountyMultiplier(object oDead, object oKiller)
{
/*
     a rating of effortless is 6 levels lower
     a rating of easy is 4 to 5 levels lower
     a rating of moderate is 2 to 3 levels lower
     a rating f challenging is same or 1 level lower
     a rating of very difficult is 1 or 2 levels higher
     a rating of overpowering is 3 or 4 levels higher
     a rating of impossible is 5 or more levels higher.
*/
    int iPC = GetHitDice(oDead),
        iKiller = GetHitDice(oKiller);

    if (iPC + 6 <= iKiller)                            return 1; //Effortless
    else if (iPC + 5 == iKiller || iPC + 4 == iKiller) return 1; //Easy
    else if (iPC + 3 == iKiller || iPC + 2 == iKiller) return 1; //Moderate
    else if (iPC + 1 == iKiller || iPC == iKiller)     return 1; //Challenging
    else if (iKiller + 2 == iPC || iKiller + 1 == iPC) return 2; //Very Difficult
    else if (iKiller + 4 == iPC || iKiller + 3 == iPC) return 3; //Overpowering
    else if (iKiller + 5 <= iPC)                       return 4; //Impossible

    // This should never display
    else return 1;
}
//////////////////////////////////////
///// Created by: bushido/////////////
//////////////////////////////////////
//////////////////////////////////////
// AdjustPlayerStats()////////////////
// Developed by: Wouter Dhondt////////
// Slightly modified by: bushido//////
//////////////////////////////////////
// Adjust Player Stats function///////
// Edited For Database By Knowj///////
// Made for Persistancy //////////////
// without Database by Milliorn//////
//////////////////////////////////////
void AdjustPlayerStats()
{
    object oDied = GetLastPlayerDied(),
           oKiller = GetLastHostileActor(oDied),
           oRecall = GetItemPossessedBy(oDied, "itm_carp_gem"),
           oRecall2 = GetItemPossessedBy(oKiller, "itm_carp_gem");
    string sArea = GetTag(GetArea(oDied));

//  Check if DM, if not execute code
    if  (!GetIsDM(oKiller) || !GetIsDM(oDied))

//  Check if PC is in area that doesn't reward PvP stats
    if (sArea == "Arena" || sArea == "GladiatorPit")return;

    // Check if oDead is a player
    if (!GetIsPC(oDied)) return;

    // Check if oKiller is a player possessed familiar
    if (GetIsPossessedFamiliar(oKiller))
    {
        oKiller = GetMaster(oKiller);
    }
    // Check if oKiller is a player or
    if (!GetIsPC(oKiller)) return;

    // Increment or set the death variable
    int iDied = GetLocalInt(oRecall, "ACN_DEATH");
    ++iDied;
    SetLocalInt(oRecall, "ACN_DEATH", iDied);

    // Is this object a PC?
    if (GetIsPC(oKiller) == TRUE)
    {
        // Increment or set the killer var
        int iKilled = GetLocalInt(oRecall2, "ACN_KILL");
        ++iKilled;
        SetLocalInt(oRecall2, "ACN_KILL", iKilled);
    }
}

/*void main()
{

}

//  Print the CR of the Creature in the Description
void PrintCRValue(object oCreature);
void PrintCRValue(object oCreature)
{
    string sDescribe = GetDescription(oCreature, TRUE, TRUE);
    float fCR = GetChallengeRating(oCreature);

    string sOutput = "<cóó >CR Value:</c> " + FloatToString(fCR, 0, 2);
    sOutput += "\n";
    sOutput += "\n";
    sOutput += "<cóó >STR: </c>" + IntToString(GetAbilityScore(oCreature, ABILITY_STRENGTH));
    sOutput += "\n";
    sOutput += "<cóó >DEX: </c>" + IntToString(GetAbilityScore(oCreature, ABILITY_DEXTERITY));
    sOutput += "\n";
    sOutput += "<cóó >CON: </c>" + IntToString(GetAbilityScore(oCreature, ABILITY_CONSTITUTION));
    sOutput += "\n";
    sOutput += "<cóó >INT: </c>" + IntToString(GetAbilityScore(oCreature, ABILITY_INTELLIGENCE));
    sOutput += "\n";
    sOutput += "<cóó >WIS: </c>" + IntToString(GetAbilityScore(oCreature, ABILITY_WISDOM));
    sOutput += "\n";
    sOutput += "<cóó >CHA: </c>" + IntToString(GetAbilityScore(oCreature, ABILITY_CHARISMA));
    sOutput += "\n";
    sOutput += "<cóó >AC: </c>" + IntToString(GetAC(oCreature));
    sOutput += "\n";
    sOutput += "<cóó >HP: </c>" + IntToString(GetCurrentHitPoints(oCreature)) + "/" + IntToString(GetMaxHitPoints(oCreature));
    sOutput += "\n";
    sOutput += "<cóó >BAB: </c>" + IntToString(GetBaseAttackBonus(oCreature));
    sOutput += "\n";
    sOutput += "<cóó >Fortitude: </c>" + IntToString(GetFortitudeSavingThrow(oCreature));
    sOutput += "\n";
    sOutput += "<cóó >Reflex: </c>" + IntToString(GetReflexSavingThrow(oCreature));
    sOutput += "\n";
    sOutput += "<cóó >Will: </c>" + IntToString(GetWillSavingThrow(oCreature));
    sOutput += "\n";
    sOutput += "<cóó >SR: </c>" + IntToString(GetSpellResistance(oCreature));
    sOutput += "</c>";
    sOutput += "\n";
    sOutput += "\n";
    sOutput += sDescribe;
    SetDescription(oCreature, sOutput, TRUE);
}

//  Randomize the settings of the npc and set there AI to high
void AIRandomSettings(object oCreature);
void AIRandomSettings(object oCreature)
{
    int iCompassion = d100(),
        iMagic      = d100(),
        iOffense    = d100();

    SetLocalInt(oCreature, "X2_L_BEH_OFFENSE", iOffense);

    if (GetLevelByClass(CLASS_TYPE_ASSASSIN, oCreature) >= 1          ||
        GetLevelByClass(CLASS_TYPE_RANGER, oCreature) >= 1            ||
        GetLevelByClass(CLASS_TYPE_DRAGONDISCIPLE, oCreature) >= 1    ||
        GetLevelByClass(CLASS_TYPE_ROGUE, oCreature) >= 1             ||
        GetLevelByClass(CLASS_TYPE_SHADOWDANCER, oCreature) >= 1)
    {
        SetLocalInt(oCreature, "X2_L_SPAWN_USE_SEARCH", 1);
        SetLocalInt(oCreature, "X2_L_SPAWN_USE_STEALTH", 1);
    }

    if (GetLevelByClass(CLASS_TYPE_BARD, oCreature) >= 1       ||
        GetLevelByClass(CLASS_TYPE_CLERIC, oCreature) >= 1     ||
        GetLevelByClass(CLASS_TYPE_DRUID, oCreature) >= 1      ||
        GetLevelByClass(CLASS_TYPE_PALADIN, oCreature) >= 1    ||
        GetLevelByClass(CLASS_TYPE_RANGER, oCreature) >= 1     ||
        GetLevelByClass(CLASS_TYPE_SORCERER, oCreature) >= 1   ||
        GetLevelByClass(CLASS_TYPE_WIZARD, oCreature) >= 1)
    {
        SetLocalInt(oCreature, "X2_L_BEH_MAGIC", iMagic);
        SetLocalInt(oCreature, "X2_SPELL_RANDOM", 1);
        //SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY);
    }

    if (GetLevelByClass(CLASS_TYPE_BARD, oCreature) >= 1   ||
        GetLevelByClass(CLASS_TYPE_CLERIC, oCreature) >= 1 ||
        GetLevelByClass(CLASS_TYPE_DRUID, oCreature) >= 1  ||
        GetLevelByClass(CLASS_TYPE_PALADIN, oCreature) >= 1 ||
        GetLevelByClass(CLASS_TYPE_RANGER, oCreature) >= 1)
    {
        SetLocalInt(oCreature, "X2_L_BEH_COMPASSION", iCompassion);
    }

    SetAILevel(oCreature, AI_LEVEL_HIGH);
}

//  Display the CR Rating for the Boss script OnDeath
string CheckBossRating(object oDead, object oKiller);
string CheckBossRating(object oDead, object oKiller)
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
    int iPC = FloatToInt(GetChallengeRating(oDead)),
        iKiller = GetHitDice(oKiller),

        iKiller_LL = GetLocalInt(GetItemPossessedBy(oKiller, "plotItemTag"), "nLegendLevel");

    if (iKiller_LL > 40) iKiller = iKiller_LL;

    if (iPC + 6 <= iKiller)                            return " an <cóóó>EFFORTLESS</c> rating";
    else if (iPC + 5 == iKiller || iPC + 4 == iKiller) return " an <c ó >EASY</c> rating";
    else if (iPC + 3 == iKiller || iPC + 2 == iKiller) return " a <c fþ>MODERATE</c> rating";
    else if (iPC + 1 == iKiller || iPC == iKiller)     return " a <cóó >CHALLENGING</c> rating";
    else if (iKiller + 2 == iPC || iKiller + 1 == iPC) return " a <cþf >VERY DIFFICULT</c> rating";
    else if (iKiller + 4 == iPC || iKiller + 3 == iPC) return " an <có  >OVERPOWERING</c> rating";
    else if (iKiller + 5 <= iPC)                       return " an <có ó>IMPOSSIBLE</c> rating";

    // This should never display
    else return "an UNKNOWN rating";
}

//void main(){}

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
/*void main(){}

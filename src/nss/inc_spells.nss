//  HP Stacking Fix
void RemoveTempHP(object oPC);
void RemoveTempHP(object oPC)
{
    int iMaxHP = GetMaxHitPoints(oPC),
        iHP = GetCurrentHitPoints(oPC),
        iHPToTake = iHP - iMaxHP;

    if (iHP > iMaxHP)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iHPToTake, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_ENERGY), oPC);
    }
}


/*void main(){}

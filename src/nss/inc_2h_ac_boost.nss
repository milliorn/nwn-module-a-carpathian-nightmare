//::///////////////////////////////////////////////
//:: 2 Hand AC Boost Script
//:: inc_2h_ac_boost
//:://////////////////////////////////////////////
/*
    This is used to give pc's who wield a weapon one size bigger than the pc's
    creature size a nth amount of Shield AC Bonus.
*/
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2019-08-02
//:://////////////////////////////////////////////


//  How much AC to give?
const int ACBOOST = 5;

//  TRUE if weapon is small
int TwoHandBoostSmallWeapon(object oPC);

//  TRUE if weapon is medium
int TwoHandBoostMediumWeapon(object oPC);

//  TRUE if weapon is large
int TwoHandBoostLargeWeapon(object oPC);

//  Check if oPC has shield equipped
int TwoHandBoostCheckShield(object oPC);

//  Check the size of oPC and stop if we are huge, invalid, or large
int TwoHandBoostCheckCreatureSize(object oPC);

//  Wrapper to check for the tracking variable
int TwoHandBoostHasVariable(object oPC);

//  Wrapper to check for the tracking variable and delete it
void TwoHandBoostRemoveVariable(object oPC);

//  Give +5 AC if they have qualifed weapon and no shield equipped
void TwoHandBoostBuffAdd(object oPC);

//  Remove +5 AC if they have the tracking variable
void TwoHandBoostBuffRemoved(object oPC);

//  Check Creature Size, weapon equipped, and lack of shield to give a bonus to
//  AC if we qualify.
void TwoHandBoost(object oPC);


int TwoHandBoostSmallWeapon(object oPC)
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    switch (GetBaseItemType(oItem))
    {
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_LIGHTMACE:
        case BASE_ITEM_SICKLE:
        case BASE_ITEM_SLING:
        case BASE_ITEM_HANDAXE:
        case BASE_ITEM_LIGHTHAMMER:
        case BASE_ITEM_SHORTSWORD:
        case BASE_ITEM_THROWINGAXE:
        case BASE_ITEM_KAMA:
        case BASE_ITEM_WHIP: return TRUE; break;
    }
    return FALSE;
}

int TwoHandBoostMediumWeapon(object oPC)
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    switch (GetBaseItemType(oItem))
    {
        case BASE_ITEM_CLUB:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_MORNINGSTAR:
        case BASE_ITEM_BATTLEAXE:
        case BASE_ITEM_LIGHTFLAIL:
        case BASE_ITEM_LONGSWORD:
        case BASE_ITEM_RAPIER:
        case BASE_ITEM_SCIMITAR:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_WARHAMMER:
        case BASE_ITEM_BASTARDSWORD:
        case BASE_ITEM_DWARVENWARAXE:
        case BASE_ITEM_MAGICSTAFF:
        case BASE_ITEM_KATANA: return TRUE; break;
    }
    return FALSE;
}

int TwoHandBoostLargeWeapon(object oPC)
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    switch (GetBaseItemType(oItem))
    {
        case BASE_ITEM_QUARTERSTAFF:
        case BASE_ITEM_SHORTSPEAR:
        case BASE_ITEM_GREATAXE:
        case BASE_ITEM_GREATSWORD:
        case BASE_ITEM_HALBERD:
        case BASE_ITEM_HEAVYFLAIL:
        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_TRIDENT:
        case BASE_ITEM_DIREMACE:
        case BASE_ITEM_DOUBLEAXE:
        case BASE_ITEM_SCYTHE:
        case BASE_ITEM_TWOBLADEDSWORD: return TRUE; break;
    }
    return FALSE;
}

int TwoHandBoostCheckShield(object oPC)
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    switch (GetBaseItemType(oItem))
    {
        case BASE_ITEM_LARGESHIELD:
        case BASE_ITEM_SMALLSHIELD:
        case BASE_ITEM_TOWERSHIELD: return TRUE; break;
    }
    return FALSE;
}

int TwoHandBoostCheckCreatureSize(object oPC)
{
    switch(GetCreatureSize(oPC))
    {
        case CREATURE_SIZE_HUGE:
        case CREATURE_SIZE_INVALID:
        case CREATURE_SIZE_LARGE: return TRUE; break;
    }
    return FALSE;
}

int TwoHandBoostHasVariable(object oPC)
{
    if (GetLocalInt(oPC, "2HACBOOST")) return TRUE;
    else return FALSE;
}

void TwoHandBoostRemoveVariable(object oPC)
{
    if (GetLocalInt(oPC, "2HACBOOST")) DeleteLocalInt(oPC, "2HACBOOST");
}

void TwoHandBoostBuffAdd(object oPC)
{
    effect eAC = SupernaturalEffect(EffectACIncrease(ACBOOST, AC_SHIELD_ENCHANTMENT_BONUS));
    effect eVis = EffectVisualEffect(VFX_IMP_AC_BONUS);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAC, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oPC, 1.0);
    SetLocalInt(oPC, "2HACBOOST", TRUE);
}

void TwoHandBoostBuffRemoved(object oPC)
{
    effect eAC = GetFirstEffect(oPC);
    while (GetIsEffectValid(eAC))
    {
        if (GetEffectType(eAC) == EFFECT_TYPE_AC_INCREASE)
        {
            RemoveEffect(oPC, eAC);
        }
        eAC = GetNextEffect(oPC);
    }
}

void TwoHandBoost(object oPC)
{
    if (TwoHandBoostCheckCreatureSize(oPC) || TwoHandBoostCheckShield(oPC))
    {
        return;
    }

    if (!TwoHandBoostHasVariable(oPC))
    {
        if (GetCreatureSize(oPC) == CREATURE_SIZE_MEDIUM && TwoHandBoostLargeWeapon(oPC))
        {
            TwoHandBoostBuffAdd(oPC);
            return;
        }

        else if (GetCreatureSize(oPC) == CREATURE_SIZE_SMALL && TwoHandBoostMediumWeapon(oPC))
        {
            TwoHandBoostBuffAdd(oPC);
            return;
        }

        else if (GetCreatureSize(oPC) == CREATURE_SIZE_TINY && TwoHandBoostSmallWeapon(oPC))
        {
            TwoHandBoostBuffAdd(oPC);
            return;
        }
    }

    if (TwoHandBoostHasVariable(oPC))
    {
        TwoHandBoostBuffRemoved(oPC);
        TwoHandBoostRemoveVariable(oPC);
    }
}

/*
void main()
{

}

//:://////////////////////////////
//:: Created By: Iznoghoud
//:: Last modified: January 19 2004
/*
What this script changes:
- Melee Weapon properties now carry over to the unarmed forms' claws and bite
attacks.
1) Now, items with an AC bonus (or penalty) carry over to the shifted form as
the correct type. This means if you wear an amulet of natural armor +4, and a
cloak of protection +5, and you shift to a form that gets all item properties
carried over, you will have the +4 natural armor bonus from the ammy, as well as
the +5 deflection bonus from the cloak. No longer will the highest one override
all the other AC bonuses even if they are a different type.
2) Other "stackable" item properties, like ability bonuses, skill bonuses and
saving throw bonuses, now correctly add up in shifted form. This means if you
have a ring that gives +2 strength, and a ring with +3 strength, and you shift
into a drow warrior, you get +5 strength in shifted form, where you used to get
only +3. (the highest)


This file contains the code that handles stacking item properties for the improved
Shifter and Druid wildshape scripts.
1 February 2004:
Added an option to allow or disallow AC stacking of different types.
*/
//:://////////////////////////////

//******** Begin Options *********

//***************** GENERAL OPTIONS *********************

// Set this to TRUE to allow differing types of AC bonuses on items to stack.
// (ie armor, deflection, natural) Warning: This can give shifters who multiclass
// with monk a godly AC depending on your module.
// With FALSE, AC will transfer as it did with the default Bioware shifter script.
const int GW_ALLOW_AC_STACKING = FALSE;//TRUE;FALSE

//***************** FOR SHIFTER SHAPES ******************

// Set this to TRUE to merge properties of boots/rings/ammy/cloak/bracers regardless
// of what polymorph.2da indicates.
// FALSE uses the polymorph.2da to decide whether to copy
const int GW_ALWAYS_COPY_ITEM_PROPS = TRUE;//FALSE;

// Set this to TRUE to merge armor/helmet properties regardless of what polymorph.2da indicates.
// FALSE uses the polymorph.2da to decide whether to copy
const int GW_ALWAYS_COPY_ARMOR_PROPS = TRUE;

// - Set this to 1 to copy over weapon properties to claw/bite attacks.
// - Set this to 2 to copy over glove properties to claw/bite attacks.
// - Set this to 3 to copy over from either weapon or gloves depending on whether a
//   weapon was worn at the time of shifting.
// - Set this to any other value ( eg 0 ) to not copy over anything to claw/bite attacks.
const int GW_COPY_WEAPON_PROPS_TO_UNARMED = 3;


//***************** FOR DRUID SHAPES ********************
// These options do nothing if you have not imported the improved Druid wild-
// and elemental shape scripts

// Set this to TRUE to merge properties of boots/rings/ammy/cloak/bracers regardless
// of what polymorph.2da indicates.
// FALSE uses the polymorph.2da to decide whether to copy
const int WS_ALWAYS_COPY_ITEM_PROPS = TRUE;//FALSE;

// Set this to TRUE to merge armor/helmet properties regardless of what polymorph.2da indicates.
// FALSE uses the polymorph.2da to decide whether to copy
const int WS_ALWAYS_COPY_ARMOR_PROPS = TRUE;

// - Set this to 1 to copy over weapon properties to claw/bite attacks.
// - Set this to 2 to copy over glove properties to claw/bite attacks.
// - Set this to 3 to copy over from either weapon or gloves depending on whether a
//   weapon was worn at the time of shifting.
// - Set this to any other value ( eg 0 ) to not copy over anything to claw/bite attacks.
const int WS_COPY_WEAPON_PROPS_TO_UNARMED = 3;

//******** End Options ***********

// Includes for various shifter and item related functions
#include "x2_inc_itemprop"
#include "x2_inc_shifter"

// **** Begin Function prototypes ****
// Copies oOld's Properties to oNew, but only properties that do not stack
// with properties of the same type. If oOld is a weapon, then bWeapon must be TRUE.
void WildshapeCopyNonStackProperties(object oOld, object oNew, int bWeapon = FALSE);
// Returns TRUE if ip is an item property that will stack with other properties
// of the same type: Ability, AC, Saves, Skills.
int GetIsStackingProperty(itemproperty ip);
// Returns the AC bonus type of oItem: AC_*_BONUS
int GetItemACType(object oItem);
// Looks for Stackable Properties on oItem, and sets local variables to count the total bonus.
// Also links any found AC bonuses/penalties to ePoly.
effect ExamineStackableProperties (object oPC, effect ePoly, object oItem );
// if bItems is TRUE, Adds the stackable properties on all the objects given to ePoly.
// if bArmor is TRUE, Adds the stackable properties on armor and helmet to ePoly.
effect AddStackablePropertiesToPoly ( object oPC, effect ePoly, int bWeapon, int bItems, int bArmor, object oArmorOld, object oRing1Old,
                                      object oRing2Old, object oAmuletOld, object oCloakOld, object oBracerOld,
                                      object oBootsOld, object oBeltOld, object oHelmetOld, object oShield, object oWeapon, object oHideOld);
// Returns the spell that applied a Polymorph Effect currently on the player.
// -1 if it was no spell, -2 if no polymorph effect found.
int ScanForPolymorphEffect(object oPC);

// Converts a number from iprp_damagetype.2da to the corresponding
// DAMAGE_TYPE_* constants.
int ConvertNumToDamTypeConstant ( int iItemDamType );

// Converts a number from iprp_immuncost.2da to the corresponding percentage of immunity
int ConvertNumToImmunePercentage ( int iImmuneCost );

// Special function to copy over weapon properties, which deals with copying
// over ranged weapons correctly.
void WildshapeCopyWeaponProperties(object oPC, object oOld, object oNew);

// Returns TRUE if oItem is a creature claw or bite.
int GetIsCreatureWeapon( object oItem );

// **** End Function prototypes ****

// **** Begin Functions, added by Iznoghoud ****
// Copies oOld's Properties to oNew, but only properties that do not stack
// with properties of the same type. If oOld is a weapon, then bWeapon must be TRUE.
void WildshapeCopyNonStackProperties(object oOld, object oNew, int bWeapon = FALSE) {

    if (GetIsObjectValid(oOld) && GetIsObjectValid(oNew))
    {
        itemproperty ip = GetFirstItemProperty(oOld);
        while (GetIsItemPropertyValid(ip)) // Loop through all the item properties.
        {
            if (bWeapon) // If a weapon, then we must make sure not to transfer between ranged and non-ranged weapons!
            {
                if (GetWeaponRanged(oOld) == GetWeaponRanged(oNew) )
                {
                    AddItemProperty(DURATION_TYPE_PERMANENT,ip,oNew);
                }
            }
            else
            {
                // If not a stacking property, copy over the property.
                // Dont copy on hit cast spell property unless the target is a claw/bite.
                if ( !GetIsStackingProperty(ip) && ( !(GetItemPropertyType(ip) == ITEM_PROPERTY_ONHITCASTSPELL) || GetIsCreatureWeapon(oNew) ) )
                    AddItemProperty(DURATION_TYPE_PERMANENT,ip,oNew);
            }
            ip = GetNextItemProperty(oOld); // Get next property
        }
    }
}
// Returns TRUE if ip is an item property that will stack with other properties
// of the same type: Ability, AC, Saves, Skills.
int GetIsStackingProperty(itemproperty ip) {
    int iType = GetItemPropertyType(ip);
    if ( iType == 0 || ( GW_ALLOW_AC_STACKING && (iType == 1) ) ||     // Bonus to Ability, AC
         iType == 27 || ( GW_ALLOW_AC_STACKING && (iType == 28) ) ||   // Penalty to Ability, AC
           iType == 40 || iType == 41 || // Bonus to saves (against element/universal, or fort/reflex/will)
           iType == 49 || iType == 50 || // Penalty to saves (against element/universal, or fort/reflex/will)
           iType == 52 || iType == 29 || // Skill Bonus, Penalty
           iType == 51 ||                // Regeneration
           iType == 20 || iType == 24    // Damage Immunity and Vulnerability
       )
        return TRUE;
    else
        return FALSE;
}
// Returns the AC bonus type of oItem: AC_*_BONUS
int GetItemACType(object oItem) {
    switch(GetBaseItemType(oItem)) {
    case BASE_ITEM_ARMOR: // These item types always get an armor ac bonus
    case BASE_ITEM_BRACER:
        return AC_ARMOUR_ENCHANTMENT_BONUS;
        break;
    case BASE_ITEM_BELT: // These item types always get a deflection ac bonus.
    case BASE_ITEM_CLOAK:
    case BASE_ITEM_GLOVES: // Note that gloves and bracers equip in the same inventory slot,
    case BASE_ITEM_HELMET: // but do not give the same AC bonus type!!!
    case BASE_ITEM_RING:
    case BASE_ITEM_TORCH:
        return AC_DEFLECTION_BONUS;
        break;
    case BASE_ITEM_BOOTS: // Only boots give a dodge ac bonus
        return AC_DODGE_BONUS;
        break;
    case BASE_ITEM_AMULET: // Only amulets give a natural AC bonus
        return AC_NATURAL_BONUS;
        break;
    case BASE_ITEM_LARGESHIELD: // Shields give a shield AC bonus
    case BASE_ITEM_SMALLSHIELD:
    case BASE_ITEM_TOWERSHIELD:
        return AC_SHIELD_ENCHANTMENT_BONUS;
        break;
    default: // It was a weapon, or a non default item, safest to default to deflection
        return AC_DEFLECTION_BONUS;
        break;
    };
    return AC_DEFLECTION_BONUS; // This one would seem unneccesary but it won't compile otherwise.
}
// Looks for Stackable Properties on oItem, and sets local variables to count the total bonus.
// Also links any found AC bonuses/penalties to ePoly.
effect ExamineStackableProperties ( object oPC, effect ePoly, object oItem )
{
    if ( !GetIsObjectValid(oItem) ) // If not valid, dont do any unneccesary work.
        return ePoly;
    itemproperty ip = GetFirstItemProperty(oItem);
    int iSubType;
    effect eTemp;
    while ( GetIsItemPropertyValid(ip) ) // Loop through all the item properties
    {
        if ( GetIsStackingProperty(ip) ) // See if it's a stacking property
        {
            iSubType = GetItemPropertySubType(ip); // Get the item property subtype for later use.
                                            // This contains whether a bonus is str, dex,
                                            // concentration skill, universal saving throws, etc.
            switch ( GetItemPropertyType(ip) ) // Which type of property is it?
            {
                // In the case of AC modifiers, add it directly to the Polymorphing effect.
                // For the other cases, set local variables on the player to
                // make a sum of all the bonuses/penalties. We use local
                // variables here because there are no arrays in NWScript, and
                // declaring a variable for every skill, ability type and saving
                // throw type in here is a little overboard.
                case 0: // Ability Bonus
                    SetLocalInt(oPC, "ws_ability_" + IntToString(iSubType), GetLocalInt(oPC, "ws_ability_" + IntToString(iSubType)) + GetItemPropertyCostTableValue(ip) );
                    break;
                case 1: // AC Bonus
                    ePoly = EffectLinkEffects(EffectACIncrease(GetItemPropertyCostTableValue(ip),GetItemACType(oItem)), ePoly);
                    break;
                case 27: // Ability Penalty
                    SetLocalInt(oPC, "ws_ability_" + IntToString(iSubType), GetLocalInt(oPC, "ws_ability_" + IntToString(iSubType)) - GetItemPropertyCostTableValue(ip) );
                    break;
                case 28: // AC penalty
                    ePoly = EffectLinkEffects(EffectACDecrease(GetItemPropertyCostTableValue(ip)), ePoly);
                    break;
                case 52: // Skill Bonus
                    SetLocalInt(oPC, "ws_skill_" + IntToString(iSubType), GetLocalInt(oPC, "ws_skill_" + IntToString(iSubType)) + GetItemPropertyCostTableValue(ip) );
                    break;
                case 29: // Skill Penalty
                    SetLocalInt(oPC, "ws_skill_" + IntToString(iSubType), GetLocalInt(oPC, "ws_skill_" + IntToString(iSubType)) - GetItemPropertyCostTableValue(ip) );
                    break;
                case 40: // Saving Throw Bonus vs Element(or universal)
                    SetLocalInt(oPC, "ws_save_elem_" + IntToString(iSubType), GetLocalInt(oPC, "ws_save_elem_" + IntToString(iSubType)) + GetItemPropertyCostTableValue(ip) );
                    break;
                case 41: // Saving Throw Bonus specific (fort/reflex/will)
                    SetLocalInt(oPC, "ws_save_spec_" + IntToString(iSubType), GetLocalInt(oPC, "ws_save_spec_" + IntToString(iSubType)) + GetItemPropertyCostTableValue(ip) );
                    break;
                case 49: // Saving Throw Penalty vs Element(or universal)
                    SetLocalInt(oPC, "ws_save_elem_" + IntToString(iSubType), GetLocalInt(oPC, "ws_save_elem_" + IntToString(iSubType)) - GetItemPropertyCostTableValue(ip) );
                    break;
                case 50: // Saving Throw Penalty specific (fort/reflex/will)
                    SetLocalInt(oPC, "ws_save_spec_" + IntToString(iSubType), GetLocalInt(oPC, "ws_save_spec_" + IntToString(iSubType)) - GetItemPropertyCostTableValue(ip) );
                    break;
                case 51: // Regeneration
                    SetLocalInt(oPC, "ws_regen", GetLocalInt(OBJECT_SELF, "ws_regen") + GetItemPropertyCostTableValue(ip) );
                    break;
                case 20: // Damage Immunity
                    SetLocalInt(oPC, "ws_dam_immun_" + IntToString(iSubType), GetLocalInt(oPC, "ws_dam_immun_" + IntToString(iSubType)) + ConvertNumToImmunePercentage(GetItemPropertyCostTableValue(ip)) );
                    break;
                case 24: // Damage Vulnerability
                    SetLocalInt(oPC, "ws_dam_immun_" + IntToString(iSubType), GetLocalInt(oPC, "ws_dam_immun_" + IntToString(iSubType)) - ConvertNumToImmunePercentage(GetItemPropertyCostTableValue(ip)) );
                    break;
            };
        }
        ip = GetNextItemProperty(oItem);
    }
    return ePoly;
}
// if bItems is TRUE, Adds all the stackable properties on all the objects given to ePoly.
// if bItems is FALSE, Adds only the stackable properties on armor and helmet to ePoly.
effect AddStackablePropertiesToPoly ( object oPC, effect ePoly, int bWeapon, int bItems, int bArmor, object oArmorOld, object oRing1Old,
                                      object oRing2Old, object oAmuletOld, object oCloakOld, object oBracerOld,
                                      object oBootsOld, object oBeltOld, object oHelmetOld, object oShield, object oWeapon, object oHideOld)
{
    if (bArmor ) // Armor properties get carried over
    {
        ePoly = ExamineStackableProperties ( oPC, ePoly, oArmorOld );
        ePoly = ExamineStackableProperties ( oPC, ePoly, oHelmetOld );
        ePoly = ExamineStackableProperties ( oPC, ePoly, oShield );
        ePoly = ExamineStackableProperties ( oPC, ePoly, oHideOld );
    }
    if ( bItems ) // Item properties get carried over
    {
        ePoly = ExamineStackableProperties ( oPC, ePoly, oRing1Old );
        ePoly = ExamineStackableProperties ( oPC, ePoly, oRing2Old );
        ePoly = ExamineStackableProperties ( oPC, ePoly, oAmuletOld );
        ePoly = ExamineStackableProperties ( oPC, ePoly, oCloakOld );
        ePoly = ExamineStackableProperties ( oPC, ePoly, oBootsOld );
        ePoly = ExamineStackableProperties ( oPC, ePoly, oBeltOld );
        ePoly = ExamineStackableProperties ( oPC, ePoly, oBracerOld );
    }
    // AC bonuses are attached to ePoly inside ExamineStackableProperties
    int i; // This will loop over all the different ability subtypes (eg str, dex, con, etc)
    int j; // This will contain the sum of the stackable bonus type we're looking at
    for ( i = 0; i <= 5; i++ ) // **** Handle Ability Bonuses ****
    {
        j = GetLocalInt(oPC, "ws_ability_" + IntToString(i));
        // Add the sum of this ability bonus to the polymorph effect.
        if ( j > 0 ) // Sum was Positive
            ePoly = EffectLinkEffects(EffectAbilityIncrease(i, j), ePoly);
        else if ( j < 0 ) // Sum was Negative
            ePoly = EffectLinkEffects(EffectAbilityDecrease(i, -j), ePoly);
        DeleteLocalInt(oPC, "ws_ability_" + IntToString(i));
    }
    for ( i = 0; i <= 26; i++ ) // **** Handle Skill Bonuses ****
    {
        j = GetLocalInt(oPC, "ws_skill_" + IntToString(i));
        // Add the sum of this skill bonus to the polymorph effect.
        if ( j > 0 ) // Sum was Positive
            ePoly = EffectLinkEffects(EffectSkillIncrease(i, j), ePoly);
        else if ( j < 0 ) // Sum was Negative
            ePoly = EffectLinkEffects(EffectSkillDecrease(i, -j), ePoly);
        DeleteLocalInt(oPC, "ws_skill_" + IntToString(i));
    }
    for ( i = 0; i <= 21; i++ ) // **** Handle Saving Throw vs element Bonuses ****
    {
        j = GetLocalInt(oPC, "ws_save_elem_" + IntToString(i));
        // Add the sum of this saving throw bonus to the polymorph effect.
        if ( j > 0 ) // Sum was Positive
            ePoly = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, j, i), ePoly);
        else if ( j < 0 ) // Sum was Negative
            ePoly = EffectLinkEffects(EffectSavingThrowDecrease(SAVING_THROW_ALL, -j, i), ePoly);
        DeleteLocalInt(oPC, "ws_save_elem_" + IntToString(i));
    }
    for ( i = 0; i <= 3; i++ ) // **** Handle Saving Throw specific Bonuses ****
    {
        j = GetLocalInt(oPC, "ws_save_spec_" + IntToString(i));
        // Add the sum of this saving throw bonus to the polymorph effect.
        if ( j > 0 ) // Sum was Positive
            ePoly = EffectLinkEffects(EffectSavingThrowIncrease(i, j), ePoly);
        else if ( j < 0 ) // Sum was Negative
            ePoly = EffectLinkEffects(EffectSavingThrowDecrease(i, -j), ePoly);
        DeleteLocalInt(oPC, "ws_save_spec_" + IntToString(i));
    }
    j = GetLocalInt(oPC, "ws_regen");
    if ( j > 0 )
    {
        ePoly = EffectLinkEffects(EffectRegenerate(j, 6.0), ePoly);
        DeleteLocalInt(oPC, "ws_regen" );
    }
    for ( i = 0; i <= 13; i++ ) // **** Handle Damage Immunity and Vulnerability ****
    {
        j = GetLocalInt(oPC, "ws_dam_immun_" + IntToString(i));
        // Add the sum of this Damage Immunity/Vulnerability to the polymorph effect.
        if ( j > 0 ) // Sum was Positive
            ePoly = EffectLinkEffects(EffectDamageImmunityIncrease(ConvertNumToDamTypeConstant ( i ), j), ePoly);
        else if ( j < 0 ) // Sum was Negative
            ePoly = EffectLinkEffects(EffectDamageImmunityDecrease(ConvertNumToDamTypeConstant ( i ), -j), ePoly);
        DeleteLocalInt(oPC, "ws_dam_immun_" + IntToString(i));
    }

    return ePoly; // Finally, we have the entire (possibly huge :P  ) effect to be applied to the shifter.
}

// Returns the spell that applied a Polymorph Effect currently on the player.
// -1 if it was no spell, -2 if no polymorph effect found.
int ScanForPolymorphEffect(object oPC)
{
    effect eEffect = GetFirstEffect(oPC);
    while ( GetIsEffectValid(eEffect) )
    {
        if ( GetEffectType( eEffect ) == EFFECT_TYPE_POLYMORPH )
        {
            return GetEffectSpellId(eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    return -2;
}

// Converts a number from iprp_damagetype.2da to the corresponding
// DAMAGE_TYPE_* constants.
int ConvertNumToDamTypeConstant ( int iItemDamType )
{
    switch ( iItemDamType )
    {
        case 0:
            return DAMAGE_TYPE_BLUDGEONING;
            break;
        case 1:
            return DAMAGE_TYPE_PIERCING;
            break;
        case 2:
            return DAMAGE_TYPE_SLASHING;
            break;
        case 5:
            return DAMAGE_TYPE_MAGICAL;
            break;
        case 6:
            return DAMAGE_TYPE_ACID;
            break;
        case 7:
            return DAMAGE_TYPE_COLD;
            break;
        case 8:
            return DAMAGE_TYPE_DIVINE;
            break;
        case 9:
            return DAMAGE_TYPE_ELECTRICAL;
            break;
        case 10:
            return DAMAGE_TYPE_FIRE;
            break;
        case 11:
            return DAMAGE_TYPE_NEGATIVE;
            break;
        case 12:
            return DAMAGE_TYPE_POSITIVE;
            break;
        case 13:
            return DAMAGE_TYPE_SONIC;
            break;
        default:
            return DAMAGE_TYPE_POSITIVE;
            break;
    };
    // This one might seem unneccesary but it wont compile otherwise
    return DAMAGE_TYPE_POSITIVE;
}

// Converts a number from iprp_immuncost.2da to the corresponding percentage of immunity
int ConvertNumToImmunePercentage ( int iImmuneCost )
{
    switch ( iImmuneCost )
    {
        case 1:
            return 5;
            break;
        case 2:
            return 10;
            break;
        case 3:
            return 25;
            break;
        case 4:
            return 50;
            break;
        case 5:
            return 75;
            break;
        case 6:
            return 90;
            break;
        case 7:
            return 100;
            break;
        default:
            return 0;
            break;
    };
    return 0;
}

void WildshapeCopyWeaponProperties(object oPC, object oOld, object oNew)
{
    if (GetIsObjectValid(oOld) && GetIsObjectValid(oNew))
    {
        itemproperty ip = GetFirstItemProperty(oOld);
        // If both are Melee Weapons
        if ( !GetWeaponRanged(oOld) && !GetWeaponRanged(oNew) )
        {
            while (GetIsItemPropertyValid(ip))
            {
                AddItemProperty(DURATION_TYPE_PERMANENT,ip,oNew);
                ip = GetNextItemProperty(oOld);
            }// while
        }

        // If both are Ranged Weapons
        else if ( GetWeaponRanged(oOld) && GetWeaponRanged(oNew) )
        {
            int bUnlimitedAmmoFound = FALSE;
            itemproperty ipNew;
            int iOldMightyValue = 0;
            object oAmmo;
            while (GetIsItemPropertyValid(ip))
            {
                if ( GetItemPropertyType(ip) == 61 ) // 61 = Unlimited Ammo
                {
                    // For some reason, when removing/replacing an unlimited
                    // ammo property, the corresponding missile type will get
                    // dropped in the player's inventory, so we have to remove
                    // that missile again to prevent abuse.
                    bUnlimitedAmmoFound = TRUE;
                    oAmmo = GetItemInSlot(INVENTORY_SLOT_ARROWS, oPC);
                    if ( !GetIsObjectValid( oAmmo ) )
                        oAmmo = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
                    if ( !GetIsObjectValid( oAmmo ) )
                        oAmmo = GetItemInSlot(INVENTORY_SLOT_BULLETS, oPC);
                    IPRemoveMatchingItemProperties(oNew, ITEM_PROPERTY_UNLIMITED_AMMUNITION, DURATION_TYPE_PERMANENT );
                    AddItemProperty(DURATION_TYPE_PERMANENT,ip,oNew);
                    DestroyObject(oAmmo);
                }
                else if ( GetItemPropertyType(ip) == 45 ) // 45 = Mighty
                {
                    ipNew = GetFirstItemProperty(oNew);
                    // Find the mighty value of the Polymorph's weapon
                    while ( GetIsItemPropertyValid(ipNew) )
                    {
                        if ( GetItemPropertyType( ipNew ) == 45 )
                        {
                            iOldMightyValue = GetItemPropertyCostTableValue( ipNew );
                            break;
                        }
                        ipNew = GetNextItemProperty(oNew);
                    } // while
                    // If new mighty value bigger, remove old one and add new one.
                    if ( GetItemPropertyCostTableValue(ip) > iOldMightyValue )
                    {
                        RemoveItemProperty(oNew, ipNew);
                        AddItemProperty(DURATION_TYPE_PERMANENT,ip,oNew);
                    }
                }
                else
                    AddItemProperty(DURATION_TYPE_PERMANENT,ip,oNew);

                ip = GetNextItemProperty(oOld);
            } // while
            // Add basic unlimited ammo if neccesary
            if ( bUnlimitedAmmoFound == FALSE && !GetItemHasItemProperty(oNew, ITEM_PROPERTY_UNLIMITED_AMMUNITION ) )
                AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyUnlimitedAmmo(), oNew);
        }
    }
    else if ( GetWeaponRanged(oNew) )
    {
        // Add basic unlimited ammo if neccesary
        if ( !GetItemHasItemProperty(oNew, ITEM_PROPERTY_UNLIMITED_AMMUNITION ) )
            AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyUnlimitedAmmo(), oNew);
    }
}

// Returns TRUE if oItem is a creature claw or bite.
int GetIsCreatureWeapon( object oItem )
{
    int iBaseItemType = GetBaseItemType(oItem);
    switch ( iBaseItemType )
    {
        case BASE_ITEM_CBLUDGWEAPON:
        case BASE_ITEM_CPIERCWEAPON:
        case BASE_ITEM_CSLASHWEAPON:
        case BASE_ITEM_CSLSHPRCWEAP:
            return TRUE;
        default:
            return FALSE;
    };
    return FALSE;
}

// **** End Functions, added by Iznoghoud ****

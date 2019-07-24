//  Common Loot Generator Script
//  Created By: Scott Milliorn
//  Module - A Carpathian Nightmare
//  Date: June 13th, 2018

//  Additional help with donation of code from Dorrian of Trials of Newcastle

//  If any code is used from this script please give credit to both -
//  Milliorn of A Carpathian Nightmare
//  Dorrian of Trials of Newcastle

#include "x2_inc_itemprop"

//  Custom Code to Randomize the Coloring of Weapons.
void ColorWeapon(object oItem, int iBottom, int iMiddle ,int iTop, object oPC);

//  Custom Code from Dorrian, the Creator of Trials of Newcastle Module.  Modified by Milliorn.
void ColorArmor(object oItem, int cloth1, int cloth2, int leather1, int leather2, int meatal1, int meatal2, object oPC);

//  Custom Code to make random weapon appearances.
void ChangeApprWeapon(object oItem, int iBottom, int iMiddle ,int iTop, object oPC);

//  Custom Code to generate common equippable loot and to randomize Item Properties
void GenerateLootBasic();

// Custom Code to generate equippable Boss loot with random Item Properties
void GenerateLootBoss();

//  Custom Code to generate miscellaneous items
void GenerateLootMisc();

// Custom Code to generate random socket items and gems
void GenerateLootSocket();

//  Custom Code to execute Function Prototypes
void GenerateLoot();

// Custom Code to generate treasure in chest
void GenerateLootTreature();

// Custom code to generate Troll Gear
void GenerateLootTroll();

// Custom code to generate Asterius Gear
void GenerateLootMino();

void ColorArmor(object oItem, int cloth1, int cloth2, int leather1, int leather2, int meatal1, int meatal2, object oPC)
{
    object oCopyBox = OBJECT_SELF;

    object oCopy = CopyItem(oItem,oCopyBox, TRUE);
    DestroyObject(oItem); // remove old item
    object oCopy1 = CopyItemAndModify(oCopy, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1, cloth1, TRUE);
    DestroyObject(oCopy); // remove old item
    object oCopy2 = CopyItemAndModify(oCopy1, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2, cloth2, TRUE);
    DestroyObject(oCopy1); // remove old item
    object oCopy3 = CopyItemAndModify(oCopy2, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1, leather1, TRUE);
    DestroyObject(oCopy2); // remove old item
    object oCopy4 = CopyItemAndModify(oCopy3, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2, leather2, TRUE);
    DestroyObject(oCopy3); // remove old item
    object oCopy5 = CopyItemAndModify(oCopy4, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1, meatal1, TRUE);
    DestroyObject(oCopy4); // remove old item
    object oCopy6 = CopyItemAndModify(oCopy5, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2, meatal2, TRUE);
    DestroyObject(oCopy5); // remove old item
    object oCopy7 = CopyItem(oCopy6,oPC, TRUE);
    DestroyObject(oCopy6); // remove old item
}

void ChangeApprWeapon(object oItem, int iBottom, int iMiddle ,int iTop, object oPC)
{
    object oCopyBox = OBJECT_SELF;

    object oCopy = CopyItem(oItem,oCopyBox, TRUE);
    DestroyObject(oItem); // remove old item
    object oCopy1 = CopyItemAndModify(oCopy, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_BOTTOM, iBottom, TRUE);
    DestroyObject(oCopy); // remove old item
    object oCopy2 = CopyItemAndModify(oCopy1, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_MIDDLE, iMiddle, TRUE);
    DestroyObject(oCopy1); // remove old item
    object oCopy3 = CopyItemAndModify(oCopy2, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP, iTop, TRUE);
    DestroyObject(oCopy2); // remove old item
}

void ColorWeapon(object oItem, int iBottom, int iMiddle ,int iTop, object oPC)
{
    object oCopyBox = OBJECT_SELF;

    object oCopy = CopyItem(oItem,oCopyBox, TRUE);
    //DestroyObject(oItem); // remove old item
    object oCopy1 = CopyItemAndModify(oCopy, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_BOTTOM, iBottom, TRUE);
    DestroyObject(oCopy); // remove old item
    object oCopy2 = CopyItemAndModify(oCopy1, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_MIDDLE, iMiddle, TRUE);
    DestroyObject(oCopy1); // remove old item
    object oCopy3 = CopyItemAndModify(oCopy2, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP, iTop, TRUE);
    DestroyObject(oCopy2); // remove old item
}

void GenerateLootBasic()
{
    // Vars
    object oPC = OBJECT_SELF,
           oChest = GetObjectByTag("LOOT_GENERATOR"),
           oItem,
           oCopy;

    int nCount = GetLocalInt(oChest, "itemcount"),
        nPick;

    int nEB             = d12(),
        nAB             = d12(),
        nAC             = d12(),
        nSavingBonus    = d12(),
        nAbilityBonus   = d12(),
        nRollSkill      = d12(),
        nMassCrit       = d12(),
        nMighty         = d12(),
        nVampRegen      = d12(),
        nSpellResist    = d12(),
        nExtraRanged    = d12(),
        nExtraMelee     = d12(),
        nKeen           = d12(),
        nRollDamage     = d20(),
        nDamageResist   = d20(),
        nBonusSpell     = d20();

    int iRandomArmor1 = Random(175),
        iRandomArmor2 = Random(175),
        iRandomArmor3 = Random(175),
        iRandomArmor4 = Random(175),
        iRandomArmor5 = Random(175),
        iRandomArmor6 = Random(175);

    int iRandomWeapon1 = d4(),
        iRandomWeapon2 = d4(),
        iRandomWeapon3 = d4();

    itemproperty    ipAdd1,
                    ipAdd2,
                    ipAdd3,
                    ipAdd4,
                    ipAdd5,
                    ipAdd6,
                    ipAdd7,
                    ipAdd8;

//  Do a numeric count of all items in the placeables inventory
    if (!nCount)
    {
        oItem=GetFirstItemInInventory(oChest);
        do
        {
            nCount++;
            oItem=GetNextItemInInventory(oChest);
        }

        while (GetIsObjectValid(oItem));
        SetLocalInt(oChest, "itemcount", nCount);
    }

//  After we do a count of the placeables inventory we select a random item to copy
    nPick = Random(nCount);
    oItem = GetFirstItemInInventory(oChest);
    while (nPick)
    {
        nPick--;
        oItem=GetNextItemInInventory(oChest);
    }

//  Copy the item to the target inventory
    oCopy = CopyItem(oItem, oPC, TRUE);

//  Remove any Item Properties before creating our own on the item
    IPRemoveAllItemProperties(oCopy, DURATION_TYPE_PERMANENT);

//  Determine what the item is and determine what we want to add to it
    switch (GetBaseItemType(oCopy))
    {
        case BASE_ITEM_AMULET:
        case BASE_ITEM_ARMOR:
        case BASE_ITEM_BELT:
        case BASE_ITEM_BOOTS:
        case BASE_ITEM_BRACER:
        case BASE_ITEM_CLOAK:
        case BASE_ITEM_HELMET:
        case BASE_ITEM_LARGESHIELD:
        case BASE_ITEM_RING:
        case BASE_ITEM_SMALLSHIELD:
        case BASE_ITEM_TOWERSHIELD:
        {
            if (nAC == 1)           ipAdd1 = ItemPropertyACBonus(d2());
            if (nAbilityBonus == 1) ipAdd2 = ItemPropertyAbilityBonus(Random(5), d2());
            if (nRollSkill == 1)    ipAdd3 = ItemPropertySkillBonus(Random(26), 1);
            if (nSavingBonus == 1)  ipAdd4 = ItemPropertyBonusSavingThrow(d3(), d2());
            if (nSpellResist == 1)  ipAdd5 = ItemPropertyBonusSpellResistance(Random(5));

            if (nDamageResist == 1)      ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ACID, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 2) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 3) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ELECTRICAL, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 4) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 5) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_SONIC, IP_CONST_DAMAGERESIST_5);

            if (nBonusSpell == 1)       ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_BARD, Random(7));
            else if (nBonusSpell == 2)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_CLERIC, Random(10));
            else if (nBonusSpell == 3)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_DRUID, Random(10));
            else if (nBonusSpell == 4)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_PALADIN, d4());
            else if (nBonusSpell == 5)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_RANGER, d4());
            else if (nBonusSpell == 6)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_SORCERER, Random(10));
            else if (nBonusSpell == 7)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_WIZARD, Random(10));
            break;
        }

        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_SLING:
        {
            if (nAB == 1)          ipAdd1 = ItemPropertyAttackBonus(d2());
            if (nMassCrit == 1)    ipAdd2 = ItemPropertyMassiveCritical(6 + Random(3));
            if (nMighty == 1)      ipAdd3 = ItemPropertyMaxRangeStrengthMod(d6());
            if (nExtraRanged == 1) ipAdd4 = ItemPropertyExtraRangeDamageType(Random(2));
            break;
        }

        case BASE_ITEM_GLOVES:
        {
            if (nAB == 1)           ipAdd1=ItemPropertyAttackBonus(d2());
            if (nMassCrit == 1)     ipAdd2=ItemPropertyMassiveCritical(6 + Random(3));
            if (nAbilityBonus == 1) ipAdd3 = ItemPropertyAbilityBonus(Random(5), d2());
            if (nRollSkill == 1)    ipAdd4 = ItemPropertySkillBonus(Random(26), 1);
            if (nSavingBonus == 1)  ipAdd5 = ItemPropertyBonusSavingThrow(d3(), d2());
            if (nSpellResist == 1)  ipAdd6 = ItemPropertyBonusSpellResistance(Random(5));
            if (nExtraMelee == 1)   ipAdd7 = ItemPropertyExtraMeleeDamageType(Random(2));

            if (nRollDamage == 1)     ipAdd8 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, 6 + Random(3));
            else if(nRollDamage == 2) ipAdd8 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, 6 + Random(3));
            else if(nRollDamage == 3) ipAdd8 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, 6 + Random(3));
            else if(nRollDamage == 4) ipAdd8 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, 6 + Random(3));
            else if(nRollDamage == 5) ipAdd8 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, 6 + Random(3));
            break;
        }

        case BASE_ITEM_ARROW:
        case BASE_ITEM_BOLT:
        case BASE_ITEM_BULLET:
        {
            if (nVampRegen == 1)    ipAdd1 = ItemPropertyVampiricRegeneration(d2());
            if (nExtraMelee == 1)   ipAdd2 = ItemPropertyExtraRangeDamageType(Random(2));

            if (nRollDamage == 1)     ipAdd3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, 6 + Random(3));
            else if(nRollDamage == 2) ipAdd3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, 6 + Random(3));
            else if(nRollDamage == 3) ipAdd3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, 6 + Random(3));
            else if(nRollDamage == 4) ipAdd3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, 6 + Random(3));
            else if(nRollDamage == 5) ipAdd3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, 6 + Random(3));
            break;
        }

        case BASE_ITEM_THROWINGAXE:
        case BASE_ITEM_DART:
        case BASE_ITEM_SHURIKEN:
        {
            if (nEB == 1)           ipAdd1 = ItemPropertyEnhancementBonus(d2());
            if (nVampRegen == 1)    ipAdd3 = ItemPropertyVampiricRegeneration(d2());
            if (nMassCrit == 1)     ipAdd4 = ItemPropertyMassiveCritical(6 + Random(3));
            if (nExtraMelee == 1)   ipAdd5 = ItemPropertyExtraRangeDamageType(Random(2));

            if (nRollDamage == 1)     ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, 6 + Random(3));
            else if(nRollDamage == 2) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, 6 + Random(3));
            else if(nRollDamage == 3) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, 6 + Random(3));
            else if(nRollDamage == 4) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, 6 + Random(3));
            else if(nRollDamage == 5) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, 6 + Random(3));
            break;
        }

        default:
        {
            if (!IPGetIsMeleeWeapon(oCopy)) return;

            if (nEB == 1)           ipAdd1 = ItemPropertyEnhancementBonus(d2());
            if (nKeen == 1)         ipAdd2 = ItemPropertyKeen();
            if (nVampRegen == 1)    ipAdd3 = ItemPropertyVampiricRegeneration(d2());
            if (nMassCrit == 1)     ipAdd4 = ItemPropertyMassiveCritical(6 + Random(3));
            if (nExtraMelee == 1)   ipAdd5 = ItemPropertyExtraMeleeDamageType(Random(2));

            if (nRollDamage == 1)     ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, 6 + Random(3));
            else if(nRollDamage == 2) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, 6 + Random(3));
            else if(nRollDamage == 3) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, 6 + Random(3));
            else if(nRollDamage == 4) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, 6 + Random(3));
            else if(nRollDamage == 5) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, 6 + Random(3));
            break;
        }
   }

//  Now we will add the Item Properties that were selected to the item
    if (GetIsItemPropertyValid(ipAdd1))
    IPSafeAddItemProperty(oCopy, ipAdd1);

    if (GetIsItemPropertyValid(ipAdd2))
    IPSafeAddItemProperty(oCopy, ipAdd2);

    if (GetIsItemPropertyValid(ipAdd3))
    IPSafeAddItemProperty(oCopy, ipAdd3);

    if (GetIsItemPropertyValid(ipAdd4))
    IPSafeAddItemProperty(oCopy, ipAdd4);

    if (GetIsItemPropertyValid(ipAdd5))
    IPSafeAddItemProperty(oCopy, ipAdd5);

    if (GetIsItemPropertyValid(ipAdd6))
    IPSafeAddItemProperty(oCopy, ipAdd6);

    if (GetIsItemPropertyValid(ipAdd7))
    IPSafeAddItemProperty(oCopy, ipAdd7);

    if (GetIsItemPropertyValid(ipAdd8))
    IPSafeAddItemProperty(oCopy, ipAdd8);

//  We now check to make sure all appropriate flags are set and give it a random name
    SetDroppableFlag(oCopy, TRUE);
    SetItemCursedFlag(oCopy, FALSE);
    SetPickpocketableFlag(oCopy, TRUE);
    SetStolenFlag(oCopy, FALSE);
    SetIdentified(oCopy, TRUE);
    SetName(oCopy, RandomName(Random(22)) + " " + GetName(oCopy, TRUE));

    switch (GetBaseItemType(oCopy))
    {
        case BASE_ITEM_ARMOR:
        case BASE_ITEM_CLOAK:
        case BASE_ITEM_HELMET:
        {
            ColorArmor(oCopy, iRandomArmor1, iRandomArmor2, iRandomArmor3, iRandomArmor4, iRandomArmor5, iRandomArmor6, oPC);
        }
        default: break;
    }

    if (IPGetIsMeleeWeapon(oCopy)   ||
        IPGetIsProjectile(oCopy)    ||
        IPGetIsRangedWeapon(oCopy))
    {
        DelayCommand(0.1 , ColorWeapon(oCopy, iRandomWeapon1, iRandomWeapon2 , iRandomWeapon3, oPC));
    }

    switch (GetBaseItemType(oCopy))
    {
        case BASE_ITEM_ARROW:
        case BASE_ITEM_DOUBLEAXE:
        case BASE_ITEM_TWOBLADEDSWORD:
        case BASE_ITEM_SCYTHE:
        {
            ChangeApprWeapon( oCopy, d3(), d3(), d3(), oPC);
            return;
        }

        case BASE_ITEM_BOLT:
        {
            ChangeApprWeapon( oCopy, d3(), Random(4) + 1, d3(), oPC);
            return;
        }

        case BASE_ITEM_GREATAXE:
        case BASE_ITEM_HANDAXE:
        case BASE_ITEM_KATANA:
        case BASE_ITEM_RAPIER:
        case BASE_ITEM_HEAVYFLAIL:
        case BASE_ITEM_LIGHTHAMMER:
        case BASE_ITEM_LIGHTMACE:
        case BASE_ITEM_MORNINGSTAR:
        case BASE_ITEM_DIREMACE:
        case BASE_ITEM_HALBERD:
        case BASE_ITEM_SHORTSPEAR:
        case BASE_ITEM_TRIDENT:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_THROWINGAXE:
        {
            ChangeApprWeapon( oCopy, d4(), d4(), d4(), oPC);
            return;
        }

        case BASE_ITEM_DWARVENWARAXE:
        case BASE_ITEM_BATTLEAXE:
        {
            ChangeApprWeapon( oCopy, d8(), d6(), d6(), oPC);
            return;
        }

        case BASE_ITEM_BASTARDSWORD:
        case BASE_ITEM_DAGGER:
        case BASE_ITEM_SHORTSWORD:
        case BASE_ITEM_CLUB:
        case BASE_ITEM_SHORTBOW:
        {
            ChangeApprWeapon( oCopy, d6(), d6(), d6(), oPC);
            return;
        }

        case BASE_ITEM_GREATSWORD:
        case BASE_ITEM_WARHAMMER:
        case BASE_ITEM_MAGICSTAFF:
        {
            ChangeApprWeapon( oCopy, Random(6) + 1, Random(6) + 1, Random(6) + 1, oPC);
            return;
        }

        case BASE_ITEM_LONGSWORD:
        case BASE_ITEM_LONGBOW:
        {
            ChangeApprWeapon( oCopy, d8(), d8(), d8(), oPC);
            return;
        }

        case BASE_ITEM_SCIMITAR:
        case BASE_ITEM_LIGHTFLAIL:
        case BASE_ITEM_QUARTERSTAFF:
        {
            ChangeApprWeapon( oCopy, Random(4) + 1, Random(4) + 1, Random(4) + 1, oPC);
            return;
        }

        default: break;
    }
}


void GenerateLootBoss()
{
    // Vars
    object oPC = OBJECT_SELF,
           oChest = GetObjectByTag("LOOT_GENERATOR"),
           oItem,
           oCopy;

    int nCount = GetLocalInt(oChest, "itemcount_boss"),
        nPick;

    int nEB             = d2(),
        nAB             = d2(),
        nAC             = d2(),
        nSavingBonus    = d6(),
        nAbilityBonus   = d6(),
        nRollSkill      = d6(),
        nMassCrit       = d6(),
        nMighty         = d6(),
        nVampRegen      = d6(),
        nSpellResist    = d6(),
        nExtraRanged    = d6(),
        nExtraMelee     = d6(),
        nKeen           = d6(),
        nRollDamage     = d10(),
        nDamageResist   = d10(),
        nBonusSpell     = d10();

    int iRandomArmor1 = Random(175),
        iRandomArmor2 = Random(175),
        iRandomArmor3 = Random(175),
        iRandomArmor4 = Random(175),
        iRandomArmor5 = Random(175),
        iRandomArmor6 = Random(175);

    int iRandomWeapon1 = d4(),
        iRandomWeapon2 = d4(),
        iRandomWeapon3 = d4();

    itemproperty    ipAdd1,
                    ipAdd2,
                    ipAdd3,
                    ipAdd4,
                    ipAdd5,
                    ipAdd6,
                    ipAdd7,
                    ipAdd8;

//  Do a numeric count of all items in the placeables inventory
    if (!nCount)
    {
        oItem=GetFirstItemInInventory(oChest);
        do
        {
            nCount++;
            oItem=GetNextItemInInventory(oChest);
        }

        while (GetIsObjectValid(oItem));
        SetLocalInt(oChest, "itemcount_boss", nCount);
    }

//  After we do a count of the placeables inventory we select a random item to copy
    nPick = Random(nCount);
    oItem = GetFirstItemInInventory(oChest);
    while (nPick)
    {
        nPick--;
        oItem=GetNextItemInInventory(oChest);
    }

//  Copy the item to the target inventory
    oCopy = CopyItem(oItem, oPC, TRUE);

//  Remove any Item Properties before creating our own on the item
    IPRemoveAllItemProperties(oCopy, DURATION_TYPE_PERMANENT);

//  Determine what the item is and determine what we want to add to it
    switch (GetBaseItemType(oCopy))
    {
        case BASE_ITEM_AMULET:
        case BASE_ITEM_ARMOR:
        case BASE_ITEM_BELT:
        case BASE_ITEM_BOOTS:
        case BASE_ITEM_BRACER:
        case BASE_ITEM_CLOAK:
        case BASE_ITEM_HELMET:
        case BASE_ITEM_LARGESHIELD:
        case BASE_ITEM_RING:
        case BASE_ITEM_SMALLSHIELD:
        case BASE_ITEM_TOWERSHIELD:
        {
            if (nAC == 1)           ipAdd1 = ItemPropertyACBonus(d4());
            if (nAbilityBonus == 1) ipAdd2 = ItemPropertyAbilityBonus(Random(5), d2());
            if (nRollSkill == 1)    ipAdd3 = ItemPropertySkillBonus(Random(26), 1);
            if (nSavingBonus == 1)  ipAdd4 = ItemPropertyBonusSavingThrow(d3(), d2());
            if (nSpellResist == 1)  ipAdd5 = ItemPropertyBonusSpellResistance(Random(5));

            if (nDamageResist == 1)      ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ACID, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 2) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 3) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ELECTRICAL, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 4) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 5) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_SONIC, IP_CONST_DAMAGERESIST_5);

            if (nBonusSpell == 1)       ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_BARD, Random(7));
            else if (nBonusSpell == 2)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_CLERIC, Random(10));
            else if (nBonusSpell == 3)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_DRUID, Random(10));
            else if (nBonusSpell == 4)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_PALADIN, d4());
            else if (nBonusSpell == 5)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_RANGER, d4());
            else if (nBonusSpell == 6)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_SORCERER, Random(10));
            else if (nBonusSpell == 7)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_WIZARD, Random(10));
            break;
        }

        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_SLING:
        {
            if (nAB == 1)          ipAdd1 = ItemPropertyAttackBonus(d4());
            if (nMassCrit == 1)    ipAdd2 = ItemPropertyMassiveCritical(6 + Random(10));
            if (nMighty == 1)      ipAdd3 = ItemPropertyMaxRangeStrengthMod(d12());
            if (nExtraRanged == 1) ipAdd4 = ItemPropertyExtraRangeDamageType(Random(2));
            break;
        }

        case BASE_ITEM_GLOVES:
        {
            if (nAB == 1)           ipAdd1=ItemPropertyAttackBonus(d4());
            if (nMassCrit == 1)     ipAdd2=ItemPropertyMassiveCritical(6 + Random(10));
            if (nAbilityBonus == 1) ipAdd3 = ItemPropertyAbilityBonus(Random(5), d2());
            if (nRollSkill == 1)    ipAdd4 = ItemPropertySkillBonus(Random(26), 1);
            if (nSavingBonus == 1)  ipAdd5 = ItemPropertyBonusSavingThrow(d3(), d2());
            if (nSpellResist == 1)  ipAdd6 = ItemPropertyBonusSpellResistance(Random(5));
            if (nExtraMelee == 1)   ipAdd7 = ItemPropertyExtraMeleeDamageType(Random(2));

            if (nRollDamage == 1)     ipAdd8 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, 6 + Random(10));
            else if(nRollDamage == 2) ipAdd8 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, 6 + Random(10));
            else if(nRollDamage == 3) ipAdd8 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, 6 + Random(10));
            else if(nRollDamage == 4) ipAdd8 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, 6 + Random(10));
            else if(nRollDamage == 5) ipAdd8 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, 6 + Random(10));
            break;
        }

        case BASE_ITEM_ARROW:
        case BASE_ITEM_BOLT:
        case BASE_ITEM_BULLET:
        {
            if (nVampRegen == 1)    ipAdd1 = ItemPropertyVampiricRegeneration(d4());
            if (nExtraMelee == 1)   ipAdd2 = ItemPropertyExtraRangeDamageType(Random(2));

            if (nRollDamage == 1)     ipAdd3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, 6 + Random(10));
            else if(nRollDamage == 2) ipAdd3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, 6 + Random(10));
            else if(nRollDamage == 3) ipAdd3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, 6 + Random(10));
            else if(nRollDamage == 4) ipAdd3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, 6 + Random(10));
            else if(nRollDamage == 5) ipAdd3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, 6 + Random(10));
            break;
        }

        case BASE_ITEM_THROWINGAXE:
        {
            if (nEB == 1)           ipAdd1 = ItemPropertyEnhancementBonus(d4());
            if (nVampRegen == 1)    ipAdd3 = ItemPropertyVampiricRegeneration(d4());
            if (nMassCrit == 1)     ipAdd4 = ItemPropertyMassiveCritical(6 + Random(10));
            if (nExtraMelee == 1)   ipAdd5 = ItemPropertyExtraRangeDamageType(Random(2));

            if (nRollDamage == 1)     ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, 6 + Random(10));
            else if(nRollDamage == 2) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, 6 + Random(10));
            else if(nRollDamage == 3) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, 6 + Random(10));
            else if(nRollDamage == 4) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, 6 + Random(10));
            else if(nRollDamage == 5) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, 6 + Random(10));
            break;
        }

        default:
        {
            if (!IPGetIsMeleeWeapon(oCopy)) return;

            if (nEB == 1)           ipAdd1 = ItemPropertyEnhancementBonus(d4());
            if (nKeen == 1)         ipAdd2 = ItemPropertyKeen();
            if (nVampRegen == 1)    ipAdd3 = ItemPropertyVampiricRegeneration(d4());
            if (nMassCrit == 1)     ipAdd4 = ItemPropertyMassiveCritical(6 + Random(10));
            if (nExtraMelee == 1)   ipAdd5 = ItemPropertyExtraMeleeDamageType(Random(2));

            if (nRollDamage == 1)     ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, 6 + Random(10));
            else if(nRollDamage == 2) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, 6 + Random(10));
            else if(nRollDamage == 3) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, 6 + Random(10));
            else if(nRollDamage == 4) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, 6 + Random(10));
            else if(nRollDamage == 5) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, 6 + Random(10));
            break;
        }
   }

//  Now we will add the Item Properties that were selected to the item
    if (GetIsItemPropertyValid(ipAdd1))
    IPSafeAddItemProperty(oCopy, ipAdd1);

    if (GetIsItemPropertyValid(ipAdd2))
    IPSafeAddItemProperty(oCopy, ipAdd2);

    if (GetIsItemPropertyValid(ipAdd3))
    IPSafeAddItemProperty(oCopy, ipAdd3);

    if (GetIsItemPropertyValid(ipAdd4))
    IPSafeAddItemProperty(oCopy, ipAdd4);

    if (GetIsItemPropertyValid(ipAdd5))
    IPSafeAddItemProperty(oCopy, ipAdd5);

    if (GetIsItemPropertyValid(ipAdd6))
    IPSafeAddItemProperty(oCopy, ipAdd6);

    if (GetIsItemPropertyValid(ipAdd7))
    IPSafeAddItemProperty(oCopy, ipAdd7);

    if (GetIsItemPropertyValid(ipAdd8))
    IPSafeAddItemProperty(oCopy, ipAdd8);

//  We now check to make sure all appropriate flags are set and give it a random name
    SetDroppableFlag(oCopy, TRUE);
    SetItemCursedFlag(oCopy, FALSE);
    SetPickpocketableFlag(oCopy, TRUE);
    SetStolenFlag(oCopy, FALSE);
    SetIdentified(oCopy, TRUE);
    SetName(oCopy, RandomName(Random(22)) + " " + GetName(oCopy, TRUE));

    switch (GetBaseItemType(oCopy))
    {
        case BASE_ITEM_ARMOR:
        case BASE_ITEM_CLOAK:
        case BASE_ITEM_HELMET:
        {
            ColorArmor(oCopy, iRandomArmor1, iRandomArmor2, iRandomArmor3, iRandomArmor4, iRandomArmor5, iRandomArmor6, oPC);
        }
        default: break;
    }

    if (IPGetIsMeleeWeapon(oCopy)   ||
        IPGetIsProjectile(oCopy)    ||
        IPGetIsRangedWeapon(oCopy))
    {
        DelayCommand(0.1 , ColorWeapon(oCopy, iRandomWeapon1, iRandomWeapon2 , iRandomWeapon3, oPC));
    }

    switch (GetBaseItemType(oCopy))
    {
        case BASE_ITEM_ARROW:
        case BASE_ITEM_DOUBLEAXE:
        case BASE_ITEM_TWOBLADEDSWORD:
        case BASE_ITEM_SCYTHE:
        {
            ChangeApprWeapon( oCopy, d3(), d3(), d3(), oPC);
            return;
        }

        case BASE_ITEM_BOLT:
        {
            ChangeApprWeapon( oCopy, d3(), Random(4) + 1, d3(), oPC);
            return;
        }

        case BASE_ITEM_GREATAXE:
        case BASE_ITEM_HANDAXE:
        case BASE_ITEM_KATANA:
        case BASE_ITEM_RAPIER:
        case BASE_ITEM_HEAVYFLAIL:
        case BASE_ITEM_LIGHTHAMMER:
        case BASE_ITEM_LIGHTMACE:
        case BASE_ITEM_MORNINGSTAR:
        case BASE_ITEM_DIREMACE:
        case BASE_ITEM_HALBERD:
        case BASE_ITEM_SHORTSPEAR:
        case BASE_ITEM_TRIDENT:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_THROWINGAXE:
        {
            ChangeApprWeapon( oCopy, d4(), d4(), d4(), oPC);
            return;
        }

        case BASE_ITEM_DWARVENWARAXE:
        case BASE_ITEM_BATTLEAXE:
        {
            ChangeApprWeapon( oCopy, d8(), d6(), d6(), oPC);
            return;
        }

        case BASE_ITEM_BASTARDSWORD:
        case BASE_ITEM_DAGGER:
        case BASE_ITEM_SHORTSWORD:
        case BASE_ITEM_CLUB:
        case BASE_ITEM_SHORTBOW:
        {
            ChangeApprWeapon( oCopy, d6(), d6(), d6(), oPC);
            return;
        }

        case BASE_ITEM_GREATSWORD:
        case BASE_ITEM_WARHAMMER:
        case BASE_ITEM_MAGICSTAFF:
        {
            ChangeApprWeapon( oCopy, Random(6) + 1, Random(6) + 1, Random(6) + 1, oPC);
            return;
        }

        case BASE_ITEM_LONGSWORD:
        case BASE_ITEM_LONGBOW:
        {
            ChangeApprWeapon( oCopy, d8(), d8(), d8(), oPC);
            return;
        }

        case BASE_ITEM_SCIMITAR:
        case BASE_ITEM_LIGHTFLAIL:
        case BASE_ITEM_QUARTERSTAFF:
        {
            ChangeApprWeapon( oCopy, Random(4) + 1, Random(4) + 1, Random(4) + 1, oPC);
            return;
        }

        default: break;
    }
}

void GenerateLootSocketGem()
{
    // Vars
    object oPC = OBJECT_SELF,
           oChest = GetObjectByTag("LOOT_SOCKET_GEM_GENERATOR"),
           oItem,
           oCopy;

    int nCount = GetLocalInt(oChest, "itemcount_socket_gem"),
        nPick;


//  Do a numeric count of all items in the placeables inventory
    if (!nCount)
    {
        oItem=GetFirstItemInInventory(oChest);
        do
        {
            nCount++;
            oItem=GetNextItemInInventory(oChest);
        }

        while (GetIsObjectValid(oItem));
        SetLocalInt(oChest, "itemcount_socket_gem", nCount);
    }

//  After we do a count of the placeables inventory we select a random item to copy
    nPick = Random(nCount);
    oItem = GetFirstItemInInventory(oChest);
    while (nPick)
    {
        nPick--;
        oItem=GetNextItemInInventory(oChest);
    }

//  Copy the item to the target inventory
    oCopy = CopyItem(oItem, oPC, TRUE);

//  We now check to make sure all appropriate flags are set and give it a random name
    SetDroppableFlag(oCopy, TRUE);
    SetItemCursedFlag(oCopy, FALSE);
    SetPickpocketableFlag(oCopy, TRUE);
    SetStolenFlag(oCopy, FALSE);
    SetIdentified(oCopy, TRUE);
}

void GenerateLootSocket()
{
    // Vars
    object oPC = OBJECT_SELF,
           oChest = GetObjectByTag("LOOT_SOCKET_GENERATOR"),
           oItem,
           oCopy;

    int nCount = GetLocalInt(oChest, "itemcount_socket"),
        nPick;


//  Do a numeric count of all items in the placeables inventory
    if (!nCount)
    {
        oItem=GetFirstItemInInventory(oChest);
        do
        {
            nCount++;
            oItem=GetNextItemInInventory(oChest);
        }

        while (GetIsObjectValid(oItem));
        SetLocalInt(oChest, "itemcount_socket", nCount);
    }

//  After we do a count of the placeables inventory we select a random item to copy
    nPick = Random(nCount);
    oItem = GetFirstItemInInventory(oChest);
    while (nPick)
    {
        nPick--;
        oItem=GetNextItemInInventory(oChest);
    }

//  Copy the item to the target inventory
    oCopy = CopyItem(oItem, oPC, TRUE);

//  We now check to make sure all appropriate flags are set and give it a random name
    SetDroppableFlag(oCopy, TRUE);
    SetItemCursedFlag(oCopy, FALSE);
    SetPickpocketableFlag(oCopy, TRUE);
    SetStolenFlag(oCopy, FALSE);
    SetIdentified(oCopy, TRUE);
}

void GenerateLootMisc()
{
    // Vars
    object oPC = OBJECT_SELF,
           oChest = GetObjectByTag("LOOT_MISC_GENERATOR"),
           oItem,
           oCopy;

    int nCount = GetLocalInt(oChest, "itemcount_misc"),
        nPick;


//  Do a numeric count of all items in the placeables inventory
    if (!nCount)
    {
        oItem=GetFirstItemInInventory(oChest);
        do
        {
            nCount++;
            oItem=GetNextItemInInventory(oChest);
        }

        while (GetIsObjectValid(oItem));
        SetLocalInt(oChest, "itemcount_misc", nCount);
    }

//  After we do a count of the placeables inventory we select a random item to copy
    nPick = Random(nCount);
    oItem = GetFirstItemInInventory(oChest);
    while (nPick)
    {
        nPick--;
        oItem=GetNextItemInInventory(oChest);
    }

//  Copy the item to the target inventory
    oCopy = CopyItem(oItem, oPC, TRUE);

//  We now check to make sure all appropriate flags are set and give it a random name
    SetDroppableFlag(oCopy, TRUE);
    SetItemCursedFlag(oCopy, FALSE);
    SetPickpocketableFlag(oCopy, TRUE);
    SetStolenFlag(oCopy, FALSE);
    SetIdentified(oCopy, TRUE);
}

void GenerateLootTroll()
{
    // Vars
    object oPC = OBJECT_SELF,
           oChest = GetObjectByTag("LOOT_TROLL_GENERATOR"),
           oItem,
           oCopy;

    int nCount = GetLocalInt(oChest, "itemcount_troll"),
        nPick;


//  Do a numeric count of all items in the placeables inventory
    if (!nCount)
    {
        oItem=GetFirstItemInInventory(oChest);
        do
        {
            nCount++;
            oItem=GetNextItemInInventory(oChest);
        }

        while (GetIsObjectValid(oItem));
        SetLocalInt(oChest, "itemcount_troll", nCount);
    }

//  After we do a count of the placeables inventory we select a random item to copy
    nPick = Random(nCount);
    oItem = GetFirstItemInInventory(oChest);
    while (nPick)
    {
        nPick--;
        oItem=GetNextItemInInventory(oChest);
    }

//  Copy the item to the target inventory
    oCopy = CopyItem(oItem, oPC, TRUE);

//  We now check to make sure all appropriate flags are set and give it a random name
    SetDroppableFlag(oCopy, TRUE);
    SetItemCursedFlag(oCopy, FALSE);
    SetPickpocketableFlag(oCopy, TRUE);
    SetStolenFlag(oCopy, FALSE);
    SetIdentified(oCopy, TRUE);
    SetName(oCopy, "<cóó >Mur-Zhagul</c> " + GetName(oCopy, TRUE));
}

void GenerateLootMino()
{
    // Vars
    object oPC = OBJECT_SELF,
           oChest = GetObjectByTag("LOOT_MINO_GENERATOR"),
           oItem,
           oCopy;

    int nCount = GetLocalInt(oChest, "itemmino"),
        nPick;

    int nEB              = d6(),
        nMassCrit        = d6(),
        nVampRegen       = d6(),
        nExtraMelee      = d6(),
        nRollDamage1     = d6(),
        nRollDamage2     = d6(),
        nRollDamage3     = d6(),
        nRollDamage4     = d6(),
        nRollDamage5     = d6();

    itemproperty    ipAdd1,
                    ipAdd2,
                    ipAdd3,
                    ipAdd4,
                    ipAdd5,
                    ipAdd6,
                    ipAdd7;

//  Do a numeric count of all items in the placeables inventory
    if (!nCount)
    {
        oItem=GetFirstItemInInventory(oChest);
        do
        {
            nCount++;
            oItem=GetNextItemInInventory(oChest);
        }

        while (GetIsObjectValid(oItem));
        SetLocalInt(oChest, "itemmino", nCount);
    }

//  After we do a count of the placeables inventory we select a random item to copy
    nPick = Random(nCount);
    oItem = GetFirstItemInInventory(oChest);
    while (nPick)
    {
        nPick--;
        oItem=GetNextItemInInventory(oChest);
    }

//  Copy the item to the target inventory
    oCopy = CopyItem(oItem, oPC, TRUE);

//  Remove any Item Properties before creating our own on the item
    IPRemoveAllItemProperties(oCopy, DURATION_TYPE_PERMANENT);


    switch (GetBaseItemType(oCopy))
    {

        case BASE_ITEM_ARROW:
        case BASE_ITEM_BOLT:
        case BASE_ITEM_BULLET:
        {
            if (nVampRegen == 1)    ipAdd1 = ItemPropertyVampiricRegeneration(d6());
            if (nExtraMelee == 1)   ipAdd2 = ItemPropertyExtraRangeDamageType(Random(2));

            if (nRollDamage1     == 1) ipAdd3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, 6 + Random(9));
            else if(nRollDamage2 == 1) ipAdd4 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, 6 + Random(9));
            else if(nRollDamage3 == 1) ipAdd5 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, 6 + Random(9));
            else if(nRollDamage4 == 1) ipAdd6 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, 6 + Random(9));
            else if(nRollDamage5 == 1) ipAdd7 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, 6 + Random(9));
            break;
        }

        case BASE_ITEM_THROWINGAXE:
        case BASE_ITEM_DART:
        case BASE_ITEM_SHURIKEN:
        {
            if (nEB == 1)           ipAdd1 = ItemPropertyEnhancementBonus(d2());
            if (nVampRegen == 1)    ipAdd2 = ItemPropertyVampiricRegeneration(d6());
            if (nMassCrit == 1)     ipAdd3 = ItemPropertyMassiveCritical(6 + Random(9));
            if (nExtraMelee == 1)   ipAdd4 = ItemPropertyExtraRangeDamageType(Random(2));

            if (nRollDamage1     == 1)     ipAdd5 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, 6 + Random(9));
            else if(nRollDamage2 == 1) ipAdd5 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, 6 + Random(9));
            else if(nRollDamage3 == 1) ipAdd5 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, 6 + Random(9));
            else if(nRollDamage4 == 1) ipAdd5 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, 6 + Random(9));
            else if(nRollDamage5 == 1) ipAdd5 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, 6 + Random(9));
            break;
        }

        default: break;
    }

//  Now we will add the Item Properties that were selected to the item
    if (GetIsItemPropertyValid(ipAdd1))
    IPSafeAddItemProperty(oCopy, ipAdd1);

    if (GetIsItemPropertyValid(ipAdd2))
    IPSafeAddItemProperty(oCopy, ipAdd2);

    if (GetIsItemPropertyValid(ipAdd3))
    IPSafeAddItemProperty(oCopy, ipAdd3);

    if (GetIsItemPropertyValid(ipAdd4))
    IPSafeAddItemProperty(oCopy, ipAdd4);

    if (GetIsItemPropertyValid(ipAdd5))
    IPSafeAddItemProperty(oCopy, ipAdd5);

    if (GetIsItemPropertyValid(ipAdd6))
    IPSafeAddItemProperty(oCopy, ipAdd6);

    if (GetIsItemPropertyValid(ipAdd7))
    IPSafeAddItemProperty(oCopy, ipAdd7);

//  We now check to make sure all appropriate flags are set and give it a random name
    SetDroppableFlag(oCopy, TRUE);
    SetItemCursedFlag(oCopy, FALSE);
    SetPickpocketableFlag(oCopy, TRUE);
    SetStolenFlag(oCopy, FALSE);
    SetIdentified(oCopy, TRUE);
    SetName(oCopy, "Asterius " + GetName(oCopy, TRUE));

    switch (GetBaseItemType(oCopy))
    {
        case BASE_ITEM_ARROW:
        {
            ChangeApprWeapon( oCopy, d3(), d3(), d3(), oPC);
            return;
        }

        case BASE_ITEM_BOLT:
        {
            ChangeApprWeapon( oCopy, d3(), Random(4) + 1, d3(), oPC);
            return;
        }

        case BASE_ITEM_THROWINGAXE:
        {
            ChangeApprWeapon( oCopy, d4(), d4(), d4(), oPC);
            return;
        }

        default: break;
    }
}

void GenerateLoot()
{
    int iRoll = d20();

    switch (iRoll)
    {
        case 1: GenerateLootMisc();         break;
        case 2: GenerateLootBasic();        break;
        case 3: GenerateLootSocket();       break;
        case 4: GenerateLootSocketGem();    break;
        default: break;
    }
}

void GenerateLootTreature()
{
    int iRoll = d3();

    switch (iRoll)
    {
        case 1: GenerateLootMisc();         break;
        case 2: GenerateLootBasic();        break;
        case 3: GenerateLootSocket();       break;
        case 4: GenerateLootSocketGem();    break;
        default: break;
    }
}

/*void main () {}

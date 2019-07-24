//  Common Loot Generator Script
//  Created By: Scott Milliorn
//  Module - A Carpathian Nightmare
//  Date: June 13th, 2018

//  Additional help with donation of code from Dorrian of Trials of Newcastle

//  If any code is used from this script please give credit to both -
//  Milliorn of A Carpathian Nightmare
//  Dorrian of Trials of Newcastle

//Token Prize Script
#include "x2_inc_itemprop"

void main()
{
    // Vars
    object oPC = GetPCSpeaker(),
           oToken = GetItemPossessedBy(oPC, "gauntlet_token"),
           oChest = GetObjectByTag("Ravana_Loot_Chest"),
           oItem, oCopy;
    int nCount = GetLocalInt(oChest, "item_rav"),
        nPick;

    int nEB             = d2(),
        nAB             = d2(),
        nAC             = d2(),
        nKeen           = d2(),
        nSavingBonus    = d2(),
        nAbilityBonus   = d2(),
        nRollSkill      = d2(),
        nMassCrit       = d2(),
        nMighty         = d2(),
        nVampRegen      = d2(),
        nSpellResist    = d2(),
        nExtraRanged    = d2(),
        nExtraMelee     = d2(),
        nRollDamage     = d10(),
        nDamageResist   = d10(),
        nBonusSpell     = d12();

    int iRandomArmor1 = Random(175),
        iRandomArmor2 = Random(175),
        iRandomArmor3 = Random(175),
        iRandomArmor4 = Random(175),
        iRandomArmor5 = Random(175),
        iRandomArmor6 = Random(175);

    int iRandomWeapon1 = d4(1),
        iRandomWeapon2 = d4(1),
        iRandomWeapon3 = d4(1);

    itemproperty    ipAdd1,
                    ipAdd2,
                    ipAdd3,
                    ipAdd4,
                    ipAdd5,
                    ipAdd6,
                    ipAdd7,
                    ipAdd8;

    // Take Token From Player
    DestroyObject(oToken);

    // Reward Script

    if (!nCount)
    {
        oItem=GetFirstItemInInventory(oChest);
        do
        {
            nCount++;
            oItem=GetNextItemInInventory(oChest);
        }

        while (GetIsObjectValid(oItem));
        SetLocalInt(oChest, "item_rav", nCount);
    }

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
            if (nAC == 1)           ipAdd1 = ItemPropertyACBonus(d2() +d2() + 1 );
            if (nAbilityBonus == 1) ipAdd2 = ItemPropertyAbilityBonus(Random(5), d2());
            if (nRollSkill == 1)    ipAdd3 = ItemPropertySkillBonus(Random(26), d2());
            if (nSavingBonus == 1)  ipAdd4 = ItemPropertyBonusSavingThrow(d3(), d2());
            if (nSpellResist == 1)  ipAdd5 = ItemPropertyBonusSpellResistance(Random(5));

            if (nDamageResist == 1)      ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ACID, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 2) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 3) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ELECTRICAL, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 4) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 5) ipAdd6 = ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_SONIC, IP_CONST_DAMAGERESIST_5);

            if (nBonusSpell == 1)       ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_BARD, Random(6));
            else if (nBonusSpell == 2)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_CLERIC, Random(9));
            else if (nBonusSpell == 3)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_DRUID, Random(9));
            else if (nBonusSpell == 4)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_PALADIN, d4());
            else if (nBonusSpell == 5)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_RANGER, d4());
            else if (nBonusSpell == 6)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_SORCERER, Random(9));
            else if (nBonusSpell == 7)  ipAdd7 = ItemPropertyBonusLevelSpell(IP_CONST_CLASS_WIZARD, Random(9));
            break;
        }

        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_SLING:
        {
            if (nAB == 1)          ipAdd1 = ItemPropertyAttackBonus(d2() + d2() + 1);
            if (nMassCrit == 1)    ipAdd2 = ItemPropertyMassiveCritical(6 + Random(3));
            if (nMighty == 1)      ipAdd3 = ItemPropertyMaxRangeStrengthMod(d6());
            if (nExtraRanged == 1) ipAdd4 = ItemPropertyExtraRangeDamageType(Random(2));
            break;
        }

        case BASE_ITEM_GLOVES:
        {
            if (nAB == 1)           ipAdd1=ItemPropertyAttackBonus(d2() + d2()+ 1);
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
            if (nEB == 1)           ipAdd1 = ItemPropertyEnhancementBonus(d2() + d2() + 1 );
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

            if (nEB == 1)           ipAdd1 = ItemPropertyEnhancementBonus(d2() + d2() + 1);
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
    SetName(oCopy, "<có  >Ravana</c> " + GetName(oCopy, TRUE));
}

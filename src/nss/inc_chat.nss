//::///////////////////////////////////////////////
//:: Name Scarface's Chat Tools - Beta
//:: FileName include_chat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Scarface
//:: Modified By: Milliorn
//:: Created On: 26th August 2008
//:: Modified On: 3rd October 2018
//:://////////////////////////////////////////////


#include "x2_inc_itemprop"
//#include "x3_inc_string"

int SF_GetIsShoutBanned (object oSender)
{
    if (GetLocalInt(GetModule(), "shout_disabled"))
    {
        return TRUE;
    }

    else return FALSE;
}

//  Boot all clients
void ChatBootAllPC(object oPC);
void ChatBootAllPC(object oPC)
{
   object oPC = GetFirstPC();
   while (GetIsObjectValid(oPC) == TRUE)
   {
      BootPC(oPC, "SERVER RESET.  You may log back in now.");
      oPC = GetNextPC();
   }
}

// Created Arm - Bone
void ChatArmBone(object oPC);
void ChatArmBone(object oPC)
{
    SetCreatureBodyPart(CREATURE_PART_LEFT_BICEP, CREATURE_MODEL_TYPE_UNDEAD, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_FOREARM, CREATURE_MODEL_TYPE_UNDEAD, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_HAND, CREATURE_MODEL_TYPE_UNDEAD, oPC);
}

// Created Arm - Normal
void ChatArmNormal(object oPC);
void ChatArmNormal(object oPC)
{
    SetCreatureBodyPart(CREATURE_PART_LEFT_BICEP, CREATURE_MODEL_TYPE_SKIN, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_FOREARM, CREATURE_MODEL_TYPE_SKIN, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_HAND, CREATURE_MODEL_TYPE_SKIN, oPC);
}

// Create Head - Next
void ChatHeadNext(object oPC);
void ChatHeadNext(object oPC)
{
    int iPartNum = GetCreatureBodyPart(CREATURE_PART_HEAD, oPC) + 1;
    if (iPartNum > 34) iPartNum = 1;
    SetCreatureBodyPart(CREATURE_PART_HEAD,  iPartNum, oPC);
}

// Create Head - Previous
void ChatHeadPrevious(object oPC);
void ChatHeadPrevious(object oPC)
{
    int iPartNum = GetCreatureBodyPart(CREATURE_PART_HEAD, oPC) - 1;
    if (iPartNum < 1) iPartNum = 34;
    SetCreatureBodyPart(CREATURE_PART_HEAD,  iPartNum, oPC);
}

//  Create Cyan Eyes
void ChatEyesCyan(object oPC);
void ChatEyesCyan(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch(GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_CYN_DWARF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_CYN_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_CYN_ELF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_CYN_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_CYN_GNOME_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_CYN_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_CYN_TROGLODYTE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_CYN_TROGLODYTE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

//  Create Green Eyes
void ChatEyesGreen(object oPC);
void ChatEyesGreen(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch(GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_DWARF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_ELF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_GNOME_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFELF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

// Remove Eye VFX
void ChatEyesNone(object oPC);
void ChatEyesNone(object oPC)
{
    effect eEffect = GetFirstEffect(oPC);
    int iType, iSub;

    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
}

// Create Orange eyes
void ChatEyesOrange(object oPC);
void ChatEyesOrange(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch(GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_ORG_DWARF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_ORG_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_ORG_ELF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_ORG_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_ORG_GNOME_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_ORG_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_ORG_TROGLODYTE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_ORG_TROGLODYTE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HALFLING_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HALFORC_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HUMAN_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

// Create Purple eyes
void ChatEyesPurple(object oPC);
void ChatEyesPurple(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch(GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_PUR_DWARF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_PUR_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_PUR_ELF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_PUR_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_PUR_GNOME_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_PUR_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_PUR_TROGLODYTE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_PUR_TROGLODYTE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HALFLING_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HALFORC_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HUMAN_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

// Create Red Flame Eyes
void ChatEyesRed(object oPC);
void ChatEyesRed(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch(GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_DWARF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_ELF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_GNOME_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFELF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFLING_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFORC_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HUMAN_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

// Create White Eyes
void ChatEyesWhite(object oPC);
void ChatEyesWhite(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch(GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_WHT_DWARF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_WHT_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_WHT_ELF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_WHT_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_WHT_GNOME_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_WHT_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_WHT_TROGLODYTE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_WHT_TROGLODYTE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HALFLING_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HALFORC_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HUMAN_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

// Create Yellow Eyes
void ChatEyesYellow(object oPC);
void ChatEyesYellow(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch(GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_YEL_DWARF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_YEL_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_YEL_ELF_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_YEL_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_YEL_GNOME_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_YEL_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_YEL_TROGLODYTE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_YEL_TROGLODYTE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HALFLING_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HALFORC_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE) eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HUMAN_MALE);
            else eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

void ApplyWeaponEffects ( object oPC, int nEffect )
{
    object oItem = GetItemInSlot ( INVENTORY_SLOT_RIGHTHAND, oPC );
    if ( GetIsObjectValid ( oItem ) )
    {
        IPRemoveMatchingItemProperties(oItem, ITEM_PROPERTY_VISUALEFFECT, -1);
        AddItemProperty ( DURATION_TYPE_PERMANENT, ItemPropertyVisualEffect ( nEffect ), oItem );
        ApplyEffectToObject ( DURATION_TYPE_INSTANT, EffectVisualEffect ( VFX_IMP_SUPER_HEROISM ), oPC );
    }
    //else
        //FloatingTextStringOnCreature ( MSG_WEAPON_1, oPC, FALSE );
}

void ChatReEquipItem(object oPC)
{
    {
        object oArms    = GetItemInSlot(INVENTORY_SLOT_ARMS, oPC),
               oBelt    = GetItemInSlot(INVENTORY_SLOT_BELT, oPC),
               oBoots   = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC),
               oChest   = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC),
               oCloak   = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC),
               oHead    = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC),
               oLeftH   = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC),
               oLeftR   = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC),
               oNeck    = GetItemInSlot(INVENTORY_SLOT_NECK, oPC),
               oRightH  = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC),
               oRightR  = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

        if (GetIsObjectValid(oArms))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oArms));
            AssignCommand(oPC, ActionEquipItem(oArms, INVENTORY_SLOT_ARMS));
        }

        if (GetIsObjectValid(oBelt))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oBelt));
            DelayCommand(0.1, AssignCommand(oPC, ActionEquipItem(oBelt, INVENTORY_SLOT_BELT)));
        }
        if (GetIsObjectValid(oBoots))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oBoots));
            DelayCommand(0.2, AssignCommand(oPC, ActionEquipItem(oBoots, INVENTORY_SLOT_BOOTS)));
        }
        if (GetIsObjectValid(oChest))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oChest));
            DelayCommand(0.3, AssignCommand(oPC, ActionEquipItem(oChest, INVENTORY_SLOT_CHEST)));
        }
        if (GetIsObjectValid(oCloak))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oCloak));
            DelayCommand(0.4, AssignCommand(oPC, ActionEquipItem(oCloak, INVENTORY_SLOT_CLOAK)));
        }
        if (GetIsObjectValid(oHead))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oHead));
            DelayCommand(0.5, AssignCommand(oPC, ActionEquipItem(oHead, INVENTORY_SLOT_HEAD)));
        }
        if (GetIsObjectValid(oLeftH))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oLeftH));
            DelayCommand(0.6, AssignCommand(oPC, ActionEquipItem(oLeftH, INVENTORY_SLOT_LEFTHAND)));
        }
        if (GetIsObjectValid(oLeftR))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oLeftR));
            DelayCommand(0.7, AssignCommand(oPC, ActionEquipItem(oLeftR, INVENTORY_SLOT_LEFTRING)));
        }
        if (GetIsObjectValid(oNeck))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oNeck));
            DelayCommand(0.8, AssignCommand(oPC, ActionEquipItem(oNeck, INVENTORY_SLOT_NECK)));
        }
        if (GetIsObjectValid(oRightH))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oRightH));
            DelayCommand(0.9, AssignCommand(oPC, ActionEquipItem(oRightH, INVENTORY_SLOT_RIGHTHAND)));
        }
        if (GetIsObjectValid(oRightR))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionUnequipItem(oRightR));
            DelayCommand(1.0, AssignCommand(oPC, ActionEquipItem(oRightR, INVENTORY_SLOT_RIGHTRING)));
        }

        DelayCommand(1.1, FloatingTextStringOnCreature("<c ó >All Items have been re-equipped.</c>", oPC, FALSE));
        DelayCommand(1.2, ExportSingleCharacter(oPC));
        DelayCommand(1.3, FloatingTextStringOnCreature("<c ó >Character Saved</c>", oPC, FALSE));
        DelayCommand(1.4, ExecuteScript("ws_saveall_sub", oPC));
        return;
    }
}

void ChatServer()
{
    object oUser = GetPCChatSpeaker();
    string sName = GetName(oUser);
    int iPCTot = 0,  /* total PC's */
        iPCVis = 0,  /* total non-anon (visible) PC's */
        iDM = 0,     // Anonymous DM's online
        iLvl = 0;    // Allows for Legendary Levels
    string sPCName,
           sPCLevel,
           sDM,
           sMessage;

    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        iPCTot++;
        /* skip anonymous PC's*/
        if (GetLocalInt(oPC, "PCL_ANON") != 1)
        {
            iPCVis++;
            sPCName = "<có  >"+ GetName(oPC) + " ";
            iLvl = GetLocalInt(GetItemPossessedBy(oPC, "hgll_check_level"), "nLegendLevel");;

            if (iLvl<41) iLvl = GetHitDice(oPC);
            sPCLevel = "<cóóó>Lvl: <c fþ>" + IntToString(iLvl) + " ";

            if (GetIsDM(oPC))
            {
                sDM = "<cÌwþ>[DM] ";
            }

            else
            {
                sDM = "";
            }

            sMessage = sPCName + sPCLevel + sDM + "</c> " + GetName(GetArea(oPC));
            SendMessageToPC(oUser, sMessage);

        }

        else if (GetIsDM(oPC)) iDM++;  // Count anonymous DM's online
        oPC = GetNextPC();
    }

    sMessage = "<có ó>[ <cóóó>" + IntToString(iPCVis) + "<có ó> players online! ]";
    SendMessageToPC(oUser, sMessage);
    return;
}

void ChatSaveCharacter(object oPC)
{
    SetPCChatMessage("");
    ExportSingleCharacter(oPC);
    FloatingTextStringOnCreature("<c ó >Character Saved</c>", oPC, FALSE);
    ExecuteScript("ws_saveall_sub", oPC);
    return;
}

void ChatRelevelPC(object oPC)
{
    int nXP = GetXP(oPC);
    int nHD = GetHitDice(oPC);
    SetXP(oPC, (((nHD*(nHD-1))/2*1000)-1));
    DelayCommand(1.0, SetXP(oPC, nXP));
    ExportSingleCharacter(oPC);
    FloatingTextStringOnCreature("<c ó >Level re-roll activated.</c>", oPC, FALSE);
    ExecuteScript("ws_saveall_sub", oPC);
}

void ChatPvP(object oPC)
{
    object  oRecall = GetItemPossessedBy(oPC, "itm_carp_gem");
    int     nVictims = GetLocalInt(oRecall, "ACN_KILL"),
            nDeaths = GetLocalInt(oRecall, "ACN_DEATH"),
            nScore = (nVictims - nDeaths);
    string  sVictims = IntToString(nVictims),
            sDeaths =  IntToString(nDeaths),
            sScore = IntToString(nScore);

    if (nScore < 0) nScore = 0;

    FloatingTextStringOnCreature("<cÌwþ>PVP STATS!", oPC, FALSE);
    DelayCommand(1.0, FloatingTextStringOnCreature("<c ó >VICTORIES: <cóóó>" +sVictims, oPC, FALSE));
    DelayCommand(2.0, FloatingTextStringOnCreature("<có  >DEFEATS: <cóóó>" +sDeaths, oPC, FALSE));
    DelayCommand(3.0, FloatingTextStringOnCreature("<cfÌþ>SCORE: <cóóó>" +sScore, oPC, FALSE));
}

void ChatBounties(object oPC)
{
    object oPlayer = GetFirstPC(),
    oRecall;
    int iBounty;
    string sName = GetName(oPC);

    SetPCChatMessage("");
    FloatingTextStringOnCreature("<c þ >Bounties:", oPC, FALSE);

    while (GetIsObjectValid(oPlayer))
    {
        oRecall = GetItemPossessedBy(oPlayer, "itm_carp_gem");
        iBounty = GetLocalInt(oRecall, "BOUNTY");

        if (iBounty >= 1)
        {
            FloatingTextStringOnCreature("<c fþ>"+GetName(oPlayer)+
            "<c°°°> - <cfÌþ>"+IntToString(iBounty)+"<có  > PK's</c> <cóóó>" +
            GetName(GetArea(oPlayer)), oPC, FALSE);
        }

        oPlayer = GetNextPC();
    }

    return;
}

/*void main () {}

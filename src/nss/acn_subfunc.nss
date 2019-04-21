/*
Probably made by Ynnead for A Carpathian Nightmare
If you didn't get this from Ynnead or Milliorn you've probably done something bad...
*/


/*
//Includes
*/
#include "acn_subconst"

/*
//Function Declarations
*/

//Public Function
//This function applies the subrace to the Character if it meets the requirements
//oPC - the object of the PC
void ACN_SubRace_OnEnter(object oPC);

//Public Function
//This function applies scaling effects and item changes if it meets the requirements
//oPC - the object of the PC
void ACN_SubRace_OnLevel(object oPC);

//Public Function
//This function applies scaling effects and reapplies items
//This can be called OnRest or on an item/placeable to fix subrace errors
//that involve items or scaling effects
//oPC - the object of the PC
void ACN_SubRace_ReapplySubRace(object oPC);

//This function is used to create the strings that will be called to set a SubRace's
//Appearance on first login
//This is a SubRace Creation function and should be used when the module loads
//for each SubRace that has a custom appearance
//nSubName - The Name of the SubRace
//nPortM - Male Portrait ID from Portrait.2da (-1 for no change)
//nPortF - Female Portrait ID from Portrait.2da (-1 for no change)
//nAppM - Male APPEARANCE_TYPE_ Constant (-1 for no change)
//nAppF - Female APPEARANCE_TYPE_ Constant (-1 for no change)
//nHead - head ID number in editor (-1 for no change)
//nVoiceM - Voice ID from SoundSet.2da(-1 for no change) Male Voice
//nVoiceF - Voice ID from SoundSet.2da(-1 for no change) Female Voice
//nHair - hair color ID (-1 for no change)
//nSkin - Skin color ID (-1 for no change)
//nWing - CREATURE_WING_TYPE_ Constant (CREATURE_WING_TYPE_NONE for no wings)
//nTail - CREATURE_TAIL_TYPE_ Constant (CREATURE_TAIL_TYPE_NONE for no tail)
void ACN_SubRace_CreateAppearance(string nSubName, int nPortM, int nPortF, int nAppM, int nAppF, int nHead, int nVoiceM, int nVoiceF, int nHair, int nSkin, int nWing, int nTail);

//This function is used to create the strings that will be called to set a SubRace's
//Attributes on first login
//This is a SubRace Creation function and should be used when the module loads
//for each SubRace that has custom attributues
//nSubName - The Name of the SubRace
//nSTR - The amount to modify Strength
//nDEX - The amount to modify Dexterity
//nCON - The amount to modify Constitution
//nINT - The amount to modify Inteligence
//nWIS - The amount to modify Wisdom
//nCHA - The amount to modify Charisma
void ACN_SubRace_CreateAttributes(string nSubName, int nSTR, int nDEX, int nCON, int nINT, int nWIS, int nCHA);

//This function is used to create the strings that will be called to set a SubRace's
//Misc Data on first login
//This is a SubRace Creation function and should be used when the module loads
//for each SubRace that has a custom racial type, speed, or size
//Require Half-Elf Race and set isFullRace to true to create a character with no
//Base Race stats
//nSubName - The Name of the SubRace
//isFullRace - if True removes half-elf feats from the pc
//nRaceType - RACIAL_TYPE_ Constant (-1 for no change)
//nSpeed - NWNX_CREATURE_MOVEMENT_TYPE_ Constant (-1 for no change)
//nSize - CREATURE_SIZE_ Constant (-1 for no change)
void ACN_SubRace_CreateMisc(string nSubName, int isFullRace, int nRaceType, int nSpeed, int nSize);

//This function is used to create the strings that will be called to set a SubRace's
//feats on first login use it multiple times to create more feats
//This is a SubRace Creation function and should be used when the module loads
//for each SubRace that has custom feats
//This function does not support Great_Attribute Feats use ACN_SubRace_CreateAttributes
//to set the Attributes of a subrace
//nSubName - The Name of the SubRace
//nFeat - FEAT_ constant
void ACN_SubRace_CreateFeat(string nSubName, int nFeat);

//This function is used to create the strings that will be called to set a SubRace's
//permanent effects that will be scaled based on level (1-40)
//Use this multiple times to create more effects
//This is a SubRace Creation function and should be used when the module loads
//for each SubRace that has custom effects
//See the Function Definition of ACN_SubRace_GetEffect for supported effect types
//nSubName - The Name of the SubRace
//nEffectType - EFFECT_TYPE_ Constant
//nMinSR - The effect value at level 1 (-1 if not applicable)
//nMaxSR - The effect value at level 40 (-1 if not applicable)
void ACN_SubRace_CreateEffect(string nSubName, int nEffectType, int nMin, int nMax);

//This function is used to create the strings that will be called to set a SubRace's
//items and the level that they get the hide item
//This is a SubRace Creation function and should be used when the module loads
//for each SubRace that has custom items
//nSubName - The Name of the SubRace
//nHideResRef - the ResRef of the subraces custom hide
//nClawResRef - the ResRef of the subraces custom claws
//nItemResRef - the ResRef of the subraces custom item
//nHideGetLevel - the level that the hide will be applied
void ACN_SubRace_CreateItems(string nSubName, string nHideResRef, string nClawResRef, string nItemResRef, int nHideGetLevel);

//This function is used to create the strings that will be called to set a SubRace's
//allowed classes, races, and alignments
//This is a SubRace Creation function and should be used when the module loads
//for each SubRace
//nSubName - The Name of the SubRace
//nRestrictLevel - The level to restrict the players class
//nValidClasses - the or (|) combination of allowed CLASS_RESTRICT_ Constants
//nValidRaces - the or (|) combination of allowed RACE_RESTRICT_ Constants
//nValidAlignments - the or (|) combination of allowed ALIGN_RESTRICT_ Constants
void ACN_SubRace_CreateAllowed(string nSubName, int nRestrictLevel, int nValidClasses, int nValidRaces, int nValidAlignments);

//Private Function
//This function is called by ACN_SubRace_OnEnter to apply
//the subrace appearance for first time login
//sSubName - the name of the subrace
//oPC - the object of the PC
void ACN_SubRace_ApplyAppearance(string sSubName, object oPC);

//Private Function
//This function is called by ACN_SubRace_OnEnter to apply
//the subrace attributes for first time login
//sSubName - the name of the subrace
//oPC - the object of the PC
void ACN_SubRace_ApplyAttributes(string sSubName, object oPC);

//Private Function
//This function is called by ACN_SubRace_OnEnter to apply
//the subrace misc features for first time login
//sSubName - the name of the subrace
//oPC - the object of the PC
void ACN_SubRace_ApplyMisc(string sSubName, object oPC);

//Private Function
//This function is called by ACN_SubRace_OnEnter to apply
//the subrace scaling effects for first time login
//It is also called by ACN_SubRace_OnLevel and ACN_SubRace_ReapplySubRace
//to apply the subraces scaling effects
//See the Function Definition of ACN_SubRace_GetEffect for supported effect types
//sSubName - the name of the subrace
//oPC - the object of the PC
void ACN_SubRace_ApplyEffects(string sSubName, object oPC);

//Private Function
//This function is called by ACN_SubRace_OnEnter to apply
//the subrace feats for first time login
//sSubName - the name of the subrace
//oPC - the object of the PC
void ACN_SubRace_ApplyFeats(string sSubName, object oPC);

//Private Function
//This function is called by ACN_SubRace_OnEnter to apply
//the subrace items for first time login
//It is also called by ACN_SubRace_OnLevel and ACN_SubRace_ReapplySubRace
//to apply the subraces items
//sSubName - the name of the subrace
//oPC - the object of the PC
void ACN_SubRace_ApplyItems(string sSubName, object oPC);

//Private Function
//This function is called by ACN_SubRace_CheckValid to ensure the
//character meets the subrace requirements for first time login
//It is also called by ACN_SubRace_CheckClassAlignValid
//to ensure it still meets the requirements
//sSubName - the name of the subrace
//oPC - the object of the PC
int ACN_SubRace_CheckAlignment(string sSubName, object oPC);

//Private Function
//This function is called by ACN_SubRace_CheckValid to ensure the
//character meets the class requirements for first time login
//It is also called by ACN_SubRace_CheckClassAlignValid
//to ensure it still meets the requirements
//sSubName - the name of the subrace
//oPC - the object of the PC
int ACN_SubRace_CheckClass(string sSubName, object oPC);

//Private Function
//This function is called by ACN_SubRace_CheckValid to ensure the
//character meets the race requirements for first time login
//sSubName - the name of the subrace
//oPC - the object of the PC
int ACN_SubRace_CheckRace(string sSubName, object oPC);

//Private Function
//This function checks if the race, class, and alignment of the subrace is valid
//sSubName - the name of the subrace
//oPC - the object of the PC
int ACN_SubRace_CheckValid(string sSubName, object oPC);

//Private Function
//This function is used by ACN_SubRace_ApplyEffects to
//create an effect of the correct type
//See the Function Definition for supported effect types
//nEffectType - EFFECT_TYPE_ constant
//nAmount - the value of the effect to be applied
effect ACN_SubRace_GetEffect(int nEffectType, int nAmount);

//Private Function
//This function is called by ACN_SubRace_ReapplySubRace to
//remove the effects before putting the new effects on
//sSubName - the name of the subrace
//oPC - the object of the PC
void ACN_SubRace_RemoveEffects(string sSubName, object oPC);

//Private Function
//This function is called by ACN_SubRace_ReapplySubRace to
//remove neccessary items before equiping the new items
//Mainly used incase the creature items were unequipped
//sSubName - the name of the subrace
//oPC - the object of the PC
void ACN_SubRace_RemoveItems(string sSubName, object oPC);

//Private Function
//This function is used to get the Restrict bit of the class type
//passed into this function
//nClassType - CLASS_TYPE_ constant
int ACN_SubRace_GetClassRestrict(int nClassType);

//Private Function
//This function checks if the class and alignment of the subrace is valid
//sSubName - the name of the subrace
//oPC - the object of the PC
int ACN_SubRace_CheckClassAlignValid(string sSubName, object oPC);

//Private Function
//This function is used to remove the half elf feats so a race can have
//a blank slate for its stats
//oPC - the object of the PC
void ACN_SubRace_RemoveHalfElf(object oPC);

/*
//Function Definitions
*/

void ACN_SubRace_OnEnter(object oPC)
{
    string sSubRace = GetSubRace(oPC);

    //The player didn't input a subrace so stop here
    if(sSubRace == "")
        return;

    //If Valid Subrace proceed else tell player subrace is not valid
    if(GetLocalInt(oMod, "ACNSub" + sSubRace))
    {
        //if New Character apply everything otherwise reapply subrace
        if(GetXP(oPC) == FIRST_LOG_IN_XP)
        {
            //if subrace name is not valid stop here
            if(!ACN_SubRace_CheckValid(sSubRace, oPC))
                return;

            ACN_SubRace_ApplyAttributes(sSubRace, oPC);
            ACN_SubRace_ApplyAppearance(sSubRace, oPC);
            ACN_SubRace_ApplyMisc(sSubRace, oPC);
            ACN_SubRace_ApplyFeats(sSubRace, oPC);
            ACN_SubRace_ApplyItems(sSubRace, oPC);
            ACN_SubRace_ApplyEffects(sSubRace, oPC);

            //Remove half elf feats if it is marked Race instead of Subrace
            if(GetLocalInt(oMod, "ACNSub" + sSubRace + "isFullRace"))
                ACN_SubRace_RemoveHalfElf(oPC);

            //Give 1 XP so it can't give the subrace again
            SetXP(oPC, FIRST_LOG_IN_XP + 1);
        }
        else
        {
            //if subrace name is not valid stop here
            if(!ACN_SubRace_CheckClassAlignValid(sSubRace, oPC))
                return;

            ACN_SubRace_ReapplySubRace(oPC);
        }
    }
    else
        SendMessageToPC(oPC, INVALID_SUBRACE);
}

void ACN_SubRace_OnLevel(object oPC)
{
    string sSubRace = GetSubRace(oPC);

    //The player didn't input a subrace so stop here
    if(sSubRace == "")
        return;

    //If Valid Subrace name proceed else tell player subrace is not valid
    if(GetLocalInt(oMod, "ACNSub" + sSubRace))
    {

        //if subrace is not valid tell player to relevel the character
        if(!ACN_SubRace_CheckClassAlignValid(sSubRace, oPC))
        {
            //relevel the character
            int nHD = GetHitDice(oPC);
            int oldXP = GetXP(oPC);
            int tempXP = (nHD * (nHD - 1) * 500) - 1;
            SetXP(oPC, tempXP);
            DelayCommand(0.5, GiveXPToCreature(oPC, 1));
            DelayCommand(1.0, SetXP(oPC, oldXP));

            SendMessageToPC(oPC, RELEVEL_CHARACTER);

            return;
        }
        else
            ACN_SubRace_ReapplySubRace(oPC);
    }
    else
        SendMessageToPC(oPC, INVALID_SUBRACE);
}

void ACN_SubRace_ReapplySubRace(object oPC)
{
    string sSubRace = GetSubRace(oPC);

    //The player didn't input a subrace so stop here
    if(sSubRace == "")
        return;

    //if the subrace exists reapply it
    if(GetLocalInt(oMod, "ACNSub" + sSubRace))
    {
        ACN_SubRace_RemoveEffects(sSubRace, oPC);
        ACN_SubRace_RemoveItems(sSubRace, oPC);

        ACN_SubRace_ApplyEffects(sSubRace, oPC);
        ACN_SubRace_ApplyItems(sSubRace, oPC);
    }
}

void ACN_SubRace_CreateAppearance(string nSubName, int nPortM, int nPortF, int nAppM, int nAppF, int nHead, int nVoiceM, int nVoiceF, int nHair, int nSkin, int nWing, int nTail)
{
    string sSubString = "ACNSub" + nSubName;

    //Portraits
    SetLocalInt(oMod, sSubString + "PortM", nPortM);
    SetLocalInt(oMod, sSubString + "PortF", nPortF);

    //Appearance
    SetLocalInt(oMod, sSubString + "AppM", nAppM);
    SetLocalInt(oMod, sSubString + "AppF", nAppF);
    SetLocalInt(oMod, sSubString + "Head", nHead);

    //Voice
    SetLocalInt(oMod, sSubString + "VoiceM", nVoiceM);
    SetLocalInt(oMod, sSubString + "VoiceF", nVoiceF);

    //Colors
    SetLocalInt(oMod, sSubString + "Hair", nHair);
    SetLocalInt(oMod, sSubString + "Skin", nSkin);

    //Appendeges
    SetLocalInt(oMod, sSubString + "Wing", nWing);
    SetLocalInt(oMod, sSubString + "Tail", nTail);
}

void ACN_SubRace_CreateAttributes(string nSubName, int nSTR, int nDEX, int nCON, int nINT, int nWIS, int nCHA)
{
    string sSubString = "ACNSub" + nSubName;

    //save the attribute data for the subrace
    SetLocalInt(oMod, sSubString + "STR", nSTR);
    SetLocalInt(oMod, sSubString + "DEX", nDEX);
    SetLocalInt(oMod, sSubString + "CON", nCON);
    SetLocalInt(oMod, sSubString + "INT", nINT);
    SetLocalInt(oMod, sSubString + "WIS", nWIS);
    SetLocalInt(oMod, sSubString + "CHA", nCHA);
}

void ACN_SubRace_CreateMisc(string nSubName, int isFullRace, int nRaceType, int nSpeed, int nSize)
{
    string sSubString = "ACNSub" + nSubName;

    SetLocalInt(oMod, sSubString + "isFullRace", isFullRace);

    //save the misc data for the subrace
    SetLocalInt(oMod, sSubString + "RaceType", nRaceType);
    SetLocalInt(oMod, sSubString + "Speed", nSpeed);
    SetLocalInt(oMod, sSubString + "Size", nSize);
}

void ACN_SubRace_CreateAllowed(string nSubName, int nRestrictLevel, int nValidClasses, int nValidRaces, int nValidAlignments)
{
    string sSubString = "ACNSub" + nSubName;

    //create bool to indicate it is a valid subrace
    SetLocalInt(oMod, sSubString, TRUE);

    //save the combined restrictions for the subrace
    SetLocalInt(oMod, sSubString + "RestrictLevel", nRestrictLevel);
    SetLocalInt(oMod, sSubString + "ValidClasses", nValidClasses);
    SetLocalInt(oMod, sSubString + "ValidRaces", nValidRaces);
    SetLocalInt(oMod, sSubString + "ValidAlignments", nValidAlignments);
}

void ACN_SubRace_CreateFeat(string nSubName, int nFeat)
{
    string sSubString = "ACNSub" + nSubName;

    //adjust the counter for how many feats the subrace has
    int iNumFeats = GetLocalInt(oMod, sSubString + "NumFeats");
    iNumFeats++;
    SetLocalInt(oMod, sSubString + "NumFeats", iNumFeats);

    //save the information needed to add the feat
    SetLocalInt(oMod, sSubString + "Feat" + IntToString(iNumFeats), nFeat);
}

void ACN_SubRace_CreateEffect(string nSubName, int nEffectType, int nMin, int nMax)
{
    string sSubString = "ACNSub" + nSubName;

    //adjust counter for how many effects the subrace has
    int iNumEffects = GetLocalInt(oMod, sSubString + "NumEffects");
    iNumEffects++;
    SetLocalInt(oMod, sSubString + "NumEffects", iNumEffects);

    //save the information needed to create the effect
    SetLocalInt(oMod, sSubString + "Effect" + IntToString(iNumEffects), nEffectType);
    SetLocalInt(oMod, sSubString + "EffectMin" + IntToString(iNumEffects), nMin);
    SetLocalInt(oMod, sSubString + "EffectMax" + IntToString(iNumEffects), nMax);
}

void ACN_SubRace_CreateItems(string nSubName, string nHideResRef, string nClawResRef, string nItemResRef, int nHideGetLevel)
{
    string sSubString = "ACNSub" + nSubName;

    //save level that subrace gets the hide
    SetLocalInt(oMod, sSubString + "HideLevel", nHideGetLevel);

    //save the strings for the items res ref
    SetLocalString(oMod, sSubString + "HideID", nHideResRef);
    SetLocalString(oMod, sSubString + "ClawID", nClawResRef);
    SetLocalString(oMod, sSubString + "ItemID", nItemResRef);
}

void ACN_SubRace_ApplyAppearance(string sSubName, object oPC)
{
    string sSubString = "ACNSub" + sSubName;

    //Set Appearance, portrait, and voice based on gender
    if(GetGender(oPC) == GENDER_MALE)
    {
        //if subrace has a different portrait change to it
        if(GetLocalInt(oMod, sSubString + "PortM") != -1)
            SetPortraitId(oPC, GetLocalInt(oMod, sSubString + "PortM"));

        //if subrace has a different appearance change to it
        if(GetLocalInt(oMod, sSubString + "AppM") != -1)
            SetCreatureAppearanceType(oPC, GetLocalInt(oMod, sSubString + "AppM"));

        //if subrace has a different voice set change to it
        if(GetLocalInt(oMod, sSubString + "VoiceM") != -1)
            NWNX_Creature_SetSoundset(oPC, GetLocalInt(oMod, sSubString + "VoiceM"));
    }
    else
    {
        //if subrace has a different portrait change to it
        if(GetLocalInt(oMod, sSubString + "PortF") != -1)
            SetPortraitId(oPC, GetLocalInt(oMod, sSubString + "PortF"));

        //if subrace has a different appearance change to it
        if(GetLocalInt(oMod, sSubString + "AppF") != -1)
            SetCreatureAppearanceType(oPC, GetLocalInt(oMod, sSubString + "AppF"));

        //if subrace has a different voice set change to it
        if(GetLocalInt(oMod, sSubString + "VoiceF") != -1)
            NWNX_Creature_SetSoundset(oPC, GetLocalInt(oMod, sSubString + "VoiceF"));
    }

    //if subrace has a specific head change to it
    if(GetLocalInt(oMod, sSubString + "Head") != -1)
        SetCreatureBodyPart(CREATURE_PART_HEAD, GetLocalInt(oMod, sSubString + "Head"), oPC);

    //if subrace has a specific hair color change to it
    if(GetLocalInt(oMod, sSubString + "Hair") != -1)
        SetColor(oPC, COLOR_CHANNEL_HAIR, GetLocalInt(oMod, sSubString + "Hair"));

    //if subrace has a specific skin color change to it
    if(GetLocalInt(oMod, sSubString + "Skin") != -1)
        SetColor(oPC, COLOR_CHANNEL_SKIN, GetLocalInt(oMod, sSubString + "Skin"));

    //set wings and tail
    SetCreatureWingType(GetLocalInt(oMod, sSubString + "Wing"), oPC);
    SetCreatureTailType(GetLocalInt(oMod, sSubString + "Tail"), oPC);

}

void ACN_SubRace_ApplyAttributes(string sSubName, object oPC)
{
    string sSubString = "ACNSub" + sSubName;

    //Apply attribute changes if there are any
    if(GetLocalInt(oMod, sSubString + "STR") != 0)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_STRENGTH, GetLocalInt(oMod, sSubString + "STR"));
    if(GetLocalInt(oMod, sSubString + "DEX") != 0)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, GetLocalInt(oMod, sSubString + "DEX"));
    if(GetLocalInt(oMod, sSubString + "CON") != 0)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CONSTITUTION, GetLocalInt(oMod, sSubString + "CON"));
    if(GetLocalInt(oMod, sSubString + "INT") != 0)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_INTELLIGENCE, GetLocalInt(oMod, sSubString + "INT"));
    if(GetLocalInt(oMod, sSubString + "WIS") != 0)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_WISDOM, GetLocalInt(oMod, sSubString + "WIS"));
    if(GetLocalInt(oMod, sSubString + "CHA") != 0)
        NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CHARISMA, GetLocalInt(oMod, sSubString + "CHA"));

}

void ACN_SubRace_ApplyMisc(string sSubName, object oPC)
{
    string sSubString = "ACNSub" + sSubName;

    //if racial type is different change it
    if(GetLocalInt(oMod, sSubString + "RaceType") != -1)
        NWNX_Creature_SetRacialType(oPC, GetLocalInt(oMod, sSubString + "RaceType"));

    //if movement speed is different change it
    if(GetLocalInt(oMod, sSubString + "Speed") != -1)
        NWNX_Creature_SetMovementRate(oPC, GetLocalInt(oMod, sSubString + "Speed"));

    //if creature size is different change it
    if(GetLocalInt(oMod, sSubString + "Size") != -1)
        NWNX_Creature_SetSize(oPC, GetLocalInt(oMod, sSubString + "Size"));

}

void ACN_SubRace_ApplyFeats(string sSubName, object oPC)
{
    string sSubString = "ACNSub" + sSubName;

    //Get the number of feats created for the subrace
    int iNumFeats = GetLocalInt(oMod, sSubString + "NumFeats");

    //apply each feat for the subrace
    for(; iNumFeats > 0; iNumFeats--)
        NWNX_Creature_AddFeat(oPC, GetLocalInt(oMod, sSubString + "Feat" + IntToString(iNumFeats)));
}

void ACN_SubRace_ApplyEffects(string sSubName, object oPC)
{
    string sSubString = "ACNSub" + sSubName;

    //Get the number of feats created for the subrace
    int iNumEffects = GetLocalInt(oMod, sSubString + "NumEffects");

    //apply each effect for the subrace
    for(; iNumEffects > 0; iNumEffects--)
    {
        //get the level scaled amount for the effect
        int iMin = GetLocalInt(oMod, sSubString + "EffectMin" + IntToString(iNumEffects));
        int iMax = GetLocalInt(oMod, sSubString + "EffectMax" + IntToString(iNumEffects));
        int iAmount = ((iMax - iMin) / 40) * GetHitDice(oPC) + iMin;

        //get the type of effect to be applied
        effect eScaledEffect = ACN_SubRace_GetEffect(GetLocalInt(oMod, sSubString + "Effect" + IntToString(iNumEffects)), iAmount);

        //if effect type is not supported move on to the next effect
        if(GetEffectType(eScaledEffect) == EFFECT_TYPE_INVALIDEFFECT)
            continue;

        //apply the effect so it cant be dispelled
        eScaledEffect = SupernaturalEffect(eScaledEffect);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eScaledEffect, oPC);
    }
}

void ACN_SubRace_ApplyItems(string sSubName, object oPC)
{
    string sSubString = "ACNSub" + sSubName;

    //stop the player from doing anything while items are being equipped
    AssignCommand(oPC, ClearAllActions());

    //remove the creature subrace items
    object hide = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC);
    if(GetIsObjectValid(hide))
        DestroyObject(hide);

    object claw1 = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC);
    if(GetIsObjectValid(claw1))
        DestroyObject(claw1);

    object claw2 = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oPC);
    if(GetIsObjectValid(claw2))
        DestroyObject(claw2);

    //give the player the subrace hide
    if ((GetHitDice(oPC) >= GetLocalInt(oMod, sSubString + "HideLevel")) && (GetLocalString(oMod, sSubString + "HideID") != ""))
    {
        SendMessageToPC(oPC, APPLYING_SUBRACE_SKIN);

        object oHide = CreateItemOnObject(GetLocalString(oMod, sSubString + "HideID"), oPC);
        AssignCommand(oPC, ActionEquipItem(oHide, INVENTORY_SLOT_CARMOUR));
    }

    //give the player the subrace claws
    if (GetLocalString(oMod, sSubString + "HideID") != "")
    {
        SendMessageToPC(oPC, APPLYING_SUBRACE_CLAW);

        object oClaw1 = CreateItemOnObject(GetLocalString(oMod, sSubString + "ClawID"), oPC);
        object oClaw2 = CreateItemOnObject(GetLocalString(oMod, sSubString + "ClawID"), oPC);
        AssignCommand(oPC, ActionEquipItem(oClaw1, INVENTORY_SLOT_CWEAPON_L));
        AssignCommand(oPC, ActionEquipItem(oClaw2, INVENTORY_SLOT_CWEAPON_R));
    }

    //If the player lost the subrace item and it exists give it back to them
    string sItemID = GetLocalString(oMod, sSubString + "ItemID");
    if (sItemID != "" && !GetIsObjectValid(GetItemPossessedBy(oPC, sItemID)))
        CreateItemOnObject(GetLocalString(oMod, sSubString + "ItemID"), oPC);

    //finished
    SendMessageToPC(oPC, SUBRACE_ITEMS_APPLIED);
}

int ACN_SubRace_CheckAlignment(string sSubName, object oPC)
{
    string sSubString = "ACNSub" + sSubName;

    int isValid = TRUE;

    int nRestrictedAlignments = GetLocalInt(oMod, sSubString + "ValidAlignments");
    int nValidG_E;
    int nValidL_C;

    //Get Good / Evil Restrict bit
    switch( GetAlignmentGoodEvil(oPC))
    {
      case ALIGNMENT_GOOD:
      {
          nValidG_E = ALIGN_RESTRICT_GOOD;
          break;
      }
      case ALIGNMENT_EVIL:
      {
          nValidG_E = ALIGN_RESTRICT_EVIL;
          break;
      }
      default:
      {
          nValidG_E = ALIGN_RESTRICT_NEUTRAL1;
          break;
      }
    }

    //Get Law / Chaos Restrict bit
    switch(GetAlignmentLawChaos(oPC))
    {
        case ALIGNMENT_LAWFUL:
        {
            nValidL_C = ALIGN_RESTRICT_LAWFUL;
            break;
        }
        case ALIGNMENT_CHAOTIC:
        {
            nValidL_C = ALIGN_RESTRICT_CHAOTIC;
            break;
        }
        default:
        {
            nValidL_C = ALIGN_RESTRICT_NEUTRAL2;
            break;
        }
    }

    //combine Good/Evil and Law/Chaos restrict bits and check if they
    //are valid
    if(!((nValidG_E | nValidL_C) & nRestrictedAlignments))
        isValid = FALSE;

    return isValid;
}

int ACN_SubRace_CheckClass(string sSubName, object oPC)
{
    string sSubString = "ACNSub" + sSubName;
    int isValid = TRUE;

    //If the player is above the restrict level stop the class check
    if(GetHitDice(oPC) > GetLocalInt(oMod, sSubString + "RestrictLevel"))
        return isValid;

    //for each possible class
    int i = 1;
    for(; i <= 3; i++)
    {
        int iClassType = GetClassByPosition(i, oPC);
        if(iClassType != CLASS_TYPE_INVALID)
        {
            int iClassRestrict = ACN_SubRace_GetClassRestrict(iClassType);

            //check if it is a valid class
            if(iClassRestrict & GetLocalInt(oMod, sSubString + "ValidClasses"))
                continue;
            else
                isValid = FALSE;
        }
    }

    return isValid;
}

int ACN_SubRace_CheckRace(string sSubName, object oPC)
{
    string sSubString = "ACNSub" + sSubName;
    int isValid = TRUE;

    int iRaceType = GetRacialType(oPC);
    //Get the race restrict bit
    switch(iRaceType)
    {
        case RACIAL_TYPE_DWARF:
        {   iRaceType = RACE_RESTRICT_DWARF;    break;  }
        case RACIAL_TYPE_ELF:
        {   iRaceType = RACE_RESTRICT_ELF;  break;  }
        case RACIAL_TYPE_GNOME:
        {   iRaceType = RACE_RESTRICT_GNOME;    break;  }
        case RACIAL_TYPE_HALFELF:
        {   iRaceType = RACE_RESTRICT_HALFELF;  break;  }
        case RACIAL_TYPE_HALFLING:
        {   iRaceType = RACE_RESTRICT_HALFLING; break;  }
        case RACIAL_TYPE_HALFORC:
        {   iRaceType = RACE_RESTRICT_HALFORC;  break;  }
        case RACIAL_TYPE_HUMAN:
        {   iRaceType = RACE_RESTRICT_HUMAN;    break;  }
    }

    if(!(iRaceType & GetLocalInt(oMod, sSubString + "ValidRaces")))
        isValid = FALSE;

    return isValid;
}

int ACN_SubRace_CheckValid(string sSubName, object oPC)
{
    int isValid = TRUE;

    //race check
    if(!ACN_SubRace_CheckRace(sSubName, oPC))
    {
        isValid = FALSE;
        SendMessageToPC(oPC, INVALID_RACE);
    }

    //class check
    if(!ACN_SubRace_CheckClass(sSubName, oPC))
    {
        isValid = FALSE;
        SendMessageToPC(oPC, INVALID_CLASS);
    }

    //alignement check
    if(!ACN_SubRace_CheckAlignment(sSubName, oPC))
    {
        isValid = FALSE;
        SendMessageToPC(oPC, INVALID_ALIGNMENT);
    }

    return isValid;
}

int ACN_SubRace_CheckClassAlignValid(string sSubName, object oPC)
{
    int isValid = TRUE;

    //class check
    if(!ACN_SubRace_CheckClass(sSubName, oPC))
    {
        isValid = FALSE;
        SendMessageToPC(oPC, INVALID_CLASS);
    }

    //alignment check
    if(!ACN_SubRace_CheckAlignment(sSubName, oPC))
    {
        isValid = FALSE;
        SendMessageToPC(oPC, INVALID_ALIGNMENT);
    }

    return isValid;

}

effect ACN_SubRace_GetEffect(int nEffectType, int nAmount)
{
    effect scaledEffect;

    //create the correct effect with the input amount
    switch(nEffectType)
    {
        case EFFECT_TYPE_AC_INCREASE:
        {
            scaledEffect = EffectACIncrease(nAmount);
            break;
        }
        case EFFECT_TYPE_SPELL_RESISTANCE_INCREASE:
        {
            scaledEffect = EffectSpellResistanceIncrease(nAmount);
            break;
        }
        case EFFECT_TYPE_TURN_RESISTANCE_INCREASE:
        {
            scaledEffect = EffectTurnResistanceIncrease(nAmount);
            break;
        }
        case EFFECT_TYPE_SPELL_FAILURE:
        {
            scaledEffect = EffectSpellFailure(nAmount);
            break;
        }
        case EFFECT_TYPE_CONCEALMENT:
        {
            scaledEffect = EffectConcealment(nAmount);
            break;
        }
        case EFFECT_TYPE_REGENERATE:
        {
            scaledEffect = EffectRegenerate(nAmount, RoundsToSeconds(1));
            break;
        }
        default:
        {
            break;
        }
    }

    return scaledEffect;
}

void ACN_SubRace_RemoveEffects(string sSubName, object oPC)
{
    string sSubString = "ACNSub" + sSubName;

    //Get the number of feats created for the subrace
    int iNumEffects = GetLocalInt(oMod, sSubString + "NumEffects");

    //for the number of effects
    for(; iNumEffects > 0; iNumEffects--)
    {
        //look for the effect and remove it when found
        effect eEffect = GetFirstEffect(oPC);
        while (GetIsEffectValid(eEffect))
        {
            //SendMessageToPC(oPC, "Remove Effect " + IntToString(iNumEffects) + ": " + IntToString(GetLocalInt(oMod, sSubString + "Effect" + IntToString(iNumEffects))));

            if (GetEffectType(eEffect) == GetLocalInt(oMod, sSubString + "Effect" + IntToString(iNumEffects)))
            {
                //SendMessageToPC(oPC, "Removing Effect: " + IntToString(GetEffectType(eEffect)));
                RemoveEffect(oPC, eEffect);
                break;
            }
            eEffect = GetNextEffect(oPC);
        }
    }

    //The code above doesn't work so remove all effects
    /*effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }*/
}

void ACN_SubRace_RemoveItems(string sSubName, object oPC)
{
    string sSubString = "ACNSub" + sSubName;

    object oHide = GetItemPossessedBy(oPC, GetLocalString(oMod, sSubString + "HideID"));
    object oClaw1 = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC);
    object oClaw2 = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oPC);

    //if the subrace item exists and was found remove it
    if (GetLocalString(oMod, sSubString + "HideID") != "" && !GetIsObjectValid(oHide))
        DestroyObject(oHide);
    if (GetLocalString(oMod, sSubString + "ClawID") != "" && !GetIsObjectValid(oClaw1))
        DestroyObject(oClaw1);
    if (GetLocalString(oMod, sSubString + "ClawID") != "" && !GetIsObjectValid(oClaw2))
        DestroyObject(oClaw2);
}

int ACN_SubRace_GetClassRestrict(int nClassType)
{
    switch(nClassType)
    {
        case CLASS_TYPE_BARBARIAN:
        {   nClassType = CLASS_RESTRICT_BARBARIAN;  break;  }
        case CLASS_TYPE_BARD:
        {   nClassType = CLASS_RESTRICT_BARD;   break;  }
        case CLASS_TYPE_CLERIC:
        {   nClassType = CLASS_RESTRICT_CLERIC; break;  }
        case CLASS_TYPE_DRUID:
        {   nClassType = CLASS_RESTRICT_DRUID;  break;  }
        case CLASS_TYPE_FIGHTER:
        {   nClassType = CLASS_RESTRICT_FIGHTER;    break;  }
        case CLASS_TYPE_MONK:
        {   nClassType = CLASS_RESTRICT_MONK;   break;  }
        case CLASS_TYPE_PALADIN:
        {   nClassType = CLASS_RESTRICT_PALADIN;    break;  }
        case CLASS_TYPE_RANGER:
        {   nClassType = CLASS_RESTRICT_RANGER; break;  }
        case CLASS_TYPE_ROGUE:
        {   nClassType = CLASS_RESTRICT_ROGUE;  break;  }
        case CLASS_TYPE_SORCERER:
        {   nClassType = CLASS_RESTRICT_SORCERER;   break;  }
        case CLASS_TYPE_WIZARD:
        {   nClassType = CLASS_RESTRICT_WIZARD; break;  }
        case CLASS_TYPE_ARCANE_ARCHER:
        {   nClassType = CLASS_RESTRICT_ARCANE_ARCHER;  break;  }
        case CLASS_TYPE_ASSASSIN:
        {   nClassType = CLASS_RESTRICT_ASSASSIN;   break;  }
        case CLASS_TYPE_BLACKGUARD:
        {   nClassType = CLASS_RESTRICT_BLACKGUARD; break;  }
        case CLASS_TYPE_DIVINE_CHAMPION:
        {   nClassType = CLASS_RESTRICT_DIVINE_CHAMPION;    break;  }
        case CLASS_TYPE_DRAGON_DISCIPLE:
        {   nClassType = CLASS_RESTRICT_DRAGON_DISCIPLE;    break;  }
        case CLASS_TYPE_DWARVEN_DEFENDER:
        {   nClassType = CLASS_RESTRICT_DWARVEN_DEFENDER;   break;  }
        case CLASS_TYPE_HARPER:
        {   nClassType = CLASS_RESTRICT_HARPER; break;}
        case CLASS_TYPE_PALE_MASTER:
        {   nClassType = CLASS_RESTRICT_PALE_MASTER;   break;  }
        case CLASS_TYPE_PURPLE_DRAGON_KNIGHT:
        {   nClassType = CLASS_RESTRICT_PURPLE_DRAGON_KNIGHT;   break;  }
        case CLASS_TYPE_SHADOWDANCER:
        {   nClassType = CLASS_RESTRICT_SHADOWDANCER;   break;  }
        case CLASS_TYPE_SHIFTER:
        {   nClassType = CLASS_RESTRICT_SHIFTER;    break;  }
        case CLASS_TYPE_WEAPON_MASTER:
        {   nClassType = CLASS_RESTRICT_WEAPON_MASTER;  break;  }
    }

    return nClassType;
}

void ACN_SubRace_RemoveHalfElf(object oPC)
{
    SendMessageToPC(oPC, "<cþ>Removing Half-Elf Feas.</c>");
    NWNX_Creature_RemoveFeat(oPC, FEAT_IMMUNITY_TO_SLEEP);
    NWNX_Creature_RemoveFeat(oPC, FEAT_HARDINESS_VERSUS_ENCHANTMENTS);
    NWNX_Creature_RemoveFeat(oPC, FEAT_PARTIAL_SKILL_AFFINITY_LISTEN);
    NWNX_Creature_RemoveFeat(oPC, FEAT_PARTIAL_SKILL_AFFINITY_SEARCH);
    NWNX_Creature_RemoveFeat(oPC, FEAT_PARTIAL_SKILL_AFFINITY_SPOT);
    NWNX_Creature_RemoveFeat(oPC, FEAT_LOWLIGHTVISION);
}

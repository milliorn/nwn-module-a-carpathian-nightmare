//::///////////////////////////////////////////////
//:: Associate: On Spawn In
//:: NW_CH_AC9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 19, 2001
//:://////////////////////////////////////////////
//
//   Edits by Cheetah (Katherine Taylor)
//
//   Added the bonus stat generation here due to errors.
//
//   NOTE: GetMaster() is somewhat buggy so I delayed it, is ok now.
//   Edit 23/3/08 - Added bad summon check (Gate)

#include "X0_INC_HENAI"
#include "ch_inc_summon"
#include "x2_inc_switches"

void main()
{
    // Do the summoning bonuses...
    // Only applies to summons for the moment...
    string sTag = GetTag(OBJECT_SELF);
    string sLeft = GetStringLeft(sTag, 2);

    // Is this a bad summon? We should skip this if we are.
    if (!GetLocalInt(OBJECT_SELF, "BAD_SUMMON"))
    {
        if (sLeft == "SU")
        // GetMaster is buggy!!! Must delay the function when the creature is summoned!
        DelayCommand(3.0, ApplyBonusSummonEffects(GetMaster(OBJECT_SELF)));
    }
    // Now.. some summons have a duration visual effect... check if we have the
    // variable and then apply it!
    int nLocal = GetLocalInt(OBJECT_SELF, "SPAWN_VFX");

    if (nLocal != 0)
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(nLocal), OBJECT_SELF);

    // Below this comment is the Bioware tripe script.

    //SetTripeCookingPatterns(nlol, oEnter);

    SetAssociateListenPatterns();//Sets up the special henchmen listening patterns

    bkSetListeningPatterns();      // Goes through and sets up which shouts the NPC will listen to.

    SetAssociateState(NW_ASC_AGGRESSIVE_BUFF);
    //SetAssociateState(NW_ASC_AGGRESSIVE_SEARCH);
    //SetAssociateState(NW_ASC_AGGRESSIVE_STEALTH);
    SetAssociateState(NW_ASC_OVERKIll_CASTING);
    SetAssociateState(NW_ASC_HEAL_AT_75);
    SetAssociateState(NW_ASC_RETRY_OPEN_LOCKS);
    SetAssociateState(NW_ASC_DISARM_TRAPS);
    SetAssociateState(NW_ASC_MODE_DEFEND_MASTER, FALSE);
    SetAssociateState(NW_ASC_USE_RANGED_WEAPON, FALSE); //User ranged weapons by default if true.
    //SetAssociateState(NW_ASC_DISTANCE_2_METERS);

    // April 2002: Summoned monsters, associates and familiars need to stay
    // further back due to their size.
    int nType = GetAssociateType(OBJECT_SELF);
    switch (nType)
    {
        case ASSOCIATE_TYPE_ANIMALCOMPANION:
        case ASSOCIATE_TYPE_DOMINATED:
        case ASSOCIATE_TYPE_FAMILIAR:
        case ASSOCIATE_TYPE_SUMMONED:
            SetAssociateState(NW_ASC_DISTANCE_2_METERS);
            break;

    }

/*    if (GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, GetMaster()) == OBJECT_SELF  ||
        GetAssociate(ASSOCIATE_TYPE_DOMINATED, GetMaster()) == OBJECT_SELF  ||
        GetAssociate(ASSOCIATE_TYPE_FAMILIAR, GetMaster()) == OBJECT_SELF  ||
        GetAssociate(ASSOCIATE_TYPE_SUMMONED, GetMaster()) == OBJECT_SELF)
    {
            SetAssociateState(NW_ASC_DISTANCE_4_METERS);
    }
*/
    // * Feb 2003: Set official campaign henchmen to have no inventory
    SetLocalInt(OBJECT_SELF, "X0_L_NOTALLOWEDTOHAVEINVENTORY", 10) ;

    //SetAssociateState(NW_ASC_MODE_DEFEND_MASTER);

    SetAssociateStartLocation();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), OBJECT_SELF);
    DelayCommand(1.0, SetName(OBJECT_SELF, "Summoned " + GetName(OBJECT_SELF, TRUE) + " (" + GetName(GetMaster()) + ")"));

    // * If Incorporeal, apply changes
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_IS_INCORPOREAL) == TRUE)
    {
        effect eConceal = EffectConcealment(50, MISS_CHANCE_TYPE_NORMAL);
        eConceal = ExtraordinaryEffect(eConceal);
        effect eGhost = EffectCutsceneGhost();
        eGhost = ExtraordinaryEffect(eGhost);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eConceal, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, OBJECT_SELF);

    }
}



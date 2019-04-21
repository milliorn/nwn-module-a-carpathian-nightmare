/*
HOTU UMD/SPELLCRAFT SCRIPT
Created By:  Demetrious
December 6th, 2003


Version 1.04:  Update February 23rd, 2004.
------------------------------------------

Fixed a bug with some spells not being shared correctly.

Note to Administrators:
-----------------------

If players have either a UMD or Spellcraft skill level
of 5 or higher and they have both skills, they recieve
a synergy bonus.  This will result in the player (or you)
seeing a skill level 2 higher than on the character sheet
because BW does not account for this synergy even though
it is a standard 3E rule.  The code then appropriately decides
which skill to use (either craft or UMD) after this synergy
adjustment is made.


Description:
------------
This script implements UMD / Spellcraft and a ShareSpell feature.

The UMD system is by the book so to speak.

This system will allow you to cast a spell from a scroll or item if:

    - The item tag begins with UMD.
    - You can regularly cast that level spell due to innate abilities.
    - You pass either a UMD or Spellcraft check for that level spell.

There are many configuration options below to allow you to set this thing up
how you want to.

ShareSpell - Simply cast a known spell using your innate ability upon yourself and it will
be transfered to your familiar.  Mage Armor or Resistance are good ones to see the effect
(light and some spells don't have one).

Failure to cast counts as a use and per BW default, may result in the destruction of the item.

Why is this needed?  BW wrote a UMD code.
-----------------------------------------
It is by their design very basic.  It addresses ONE misuse of the UMD prior system
and that is a rogue using UMD to cast really high level spells.  Other abuses, like
a RDD build with one level of sorc will pass ALL BW UMD checks.  So if they find
a Wand of Timestop - there is no difference between the "true" caster and this
"wanna be" :)  I like casters and I like the classes to be different.  This system
helps create that significant difference that can be lost with UMD abuses.

Installation:
-------------
Save this code as: "x2_pc_umdcheck".  Hit yes to overwrite the file.

Uninstall:
----------
Delete this script from your module.


Implementation Reminders:
-------------------------
If you look at the debug results remember that there are several things that affect
the UMD and or spellcraft skill totals.  These are all accounted for, I just didn't
break them down for the debug so remember ability modifiers, feats, and synergy.

IF you make an item - ie armor, amulet, staff - with a number of uses, rather than uses
per day, when the uses are up the item is destroyed.  So either make the item properties
per day or a neat idea would be nice armor with a terrific spell and they can have one OR
the other.


PERFORMANCE:
------------
Version 1.01 and higher now caches results of any 2da pull that is performed.  So for PW, there
will be only one pull for a wizard casting a Mage Armor scroll ever per module.
Samething for a sorc using a wand of fireball - one 2da pull on the first use.
After that, the information is stored on an module level variable and that is
checked rather than accessing the 2da data which should make it that much more efficient.

Persistent worlds are strongly urged to test or warn players before implementing
this code but you should probably do this for all big coding changes anyway.
*/


//*********************************CUSTOMIZE OPTIONS BEGIN HERE ********************************************
//CUSTOMIZE SECTION 1 of 2

//Change these to FALSE to turn off either system.

const int SHARE_SPELL = TRUE;
const int UMD_ON = TRUE;
const int UMD_OTHER = TRUE;//should the system check spells on armor or weapons?

//Even if UMD_OTHER is TRUE - you can change the tag of the item to begin
//with "UMD" and the item will BYPASS the system.  If this is FALSE then the system
//will only check scrolls, wands, rods, staves and will pass armor or weapons etc.


const int UMD_PASS_ABILITIES = TRUE;

//should Blackguards autopass Bullstrength on a scroll if they have this innate
//ability.  I think this can be interpreted both ways but the default is now YES


//*******************************CUSTOMIZE STRING OPTIONS END HERE******************************************




//Function calls DO NOT CHANGE
void ApplyPenalty(object oCaster, string sDC);
void ApplyRandomEffect(object oCaster, string sDC);
void CreateCreature(int iType, string sName, location lTarget);
void PHBF_ShareSpell(object oTarget);

//Constants DO NOT CHANGE
const int INVALID = 999;
const int NO_SKILL = -99;
const int DAMAGE_EFFECT          = 0;
const int DAMAGE_BY_LEVEL_EFFECT = 1;
const int RANDOM_EFFECT          = 2;

//Globals DO NOT CHANGE
string sDC;




//*********************************CUSTOMIZE OPTIONS BEGIN HERE ********************************************
//CUSTOMIZE SECTION 2 of 2

const int DEBUG = FALSE;   //Set this to TRUE to see more feedback from the system.

const int CRAFT_DC = 25;  //This is the spellcraft DC
const int UMD_DC = 20;    //This is the base UMD Scroll DC - assumes you are using a scroll - items will be 5 less per PHB
const int SPELLCRAFT_PENALTY_DC = 10;     //If you fail a check by more than this amount - you are penalized.
const int UMD_PENALTY_DC = 5;
const int PENALTY_TYPE = RANDOM_EFFECT;
//OPTIONS:  DAMAGE_EFFECT, DAMAGE_BY_LEVEL_EFFECT, RANDOM_EFFECT
//Damage effect and damage by level effect apply the damage amount (below) to the caster.
//By level will multiply the damage by the level of the spell.
//Random effect applies one of 20 Special effects to the caster.

//This is ONLY used if you set the penalty type to Damage or Damage By Level.
int DAMAGE_AMOUNT = d20();

//Set this to true to have messages duplicated on the DM channel.
const int DM_ALERT = FALSE;

//CUSTOMIZE STRING OPTIONS BEGIN HERE
string ITEM_CASTING()
{
    string sMsg = "<cÆàÈ>Inherent Item Ability used:</c><c|àÈ>  No UMD check.</c>";
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string INNATE_FAILURE()
{
    string sMsg = "<c|àÈ>UMD Check:</c> <cÆ?Q> Innate Casting Failure.</c>";
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string NO_VALID_SKILL()
{
    string sMsg = "<c|àÈ>UMD Check:</c>  <cÆ?Q>No valid skills.</c>";
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string PHBF_ShareSpellString (object oMaster, object oFam)
{
    string sMsg = "<c|àÈ>Master has initiated Share Spell with</c> "+GetName(oFam);
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string UMD_ScrollSuccessString (int iUMDSkillLevel, int ROLL, int iDC_CRAFT)
{
    string sMsg = "<cÆàÈ>SUCCESS Scroll: </c><c|àÈ>UMD skill total + roll = </c>" +IntToString (iUMDSkillLevel) + "<c|àÈ> + </c>" + IntToString (ROLL) + "<c|àÈ> = </c>" +IntToString (iUMDSkillLevel+ROLL) + "  <c|àÈ> Against DC:</c> " + IntToString (iDC_CRAFT);
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string UMD_ScrollCriticalFailureString (int iUMDSkillLevel, int ROLL, int iDC_CRAFT)
{
    string sMsg = "<cÆ?Q>CRITICAL FAILURE Scroll: </c><c|àÈ>UMD skill total + roll = </c>" +IntToString (iUMDSkillLevel) + "<c|àÈ> + </c>" + IntToString (ROLL) + "<c|àÈ> = </c>" +IntToString (iUMDSkillLevel+ROLL) + " <c|àÈ>  Against DC: </c>" + IntToString (iDC_CRAFT);
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string UMD_ScrollFailureString (int iUMDSkillLevel, int ROLL, int iDC_CRAFT)
{
    string sMsg = "<cÆ?Q>FAILURE Scroll:</c> <c|àÈ>UMD skill total + roll = </c>" +IntToString (iUMDSkillLevel) + "<c|àÈ> + </c>" + IntToString (ROLL) + "<c|àÈ> = </c>" +IntToString (iUMDSkillLevel+ROLL) + " <c|àÈ>  Against DC:</c> " + IntToString (iDC_CRAFT);
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string UMD_ItemSuccessString (int iUMDSkillLevel, int ROLL, int iDC_CRAFT)
{
    string sMsg = "<cÆàÈ>SUCCESS Item: </c><c|àÈ>UMD skill total + roll =</c> " +IntToString (iUMDSkillLevel) + "<c|àÈ> +</c> " + IntToString (ROLL) + " <c|àÈ>= </c>" +IntToString (iUMDSkillLevel+ROLL) + " <c|àÈ>  Against DC:</c> " + IntToString (iDC_CRAFT);
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string UMD_ItemCriticalFailureString (int iUMDSkillLevel, int ROLL, int iDC_CRAFT)
{
    string sMsg = "<cÆ?Q>CRITICAL FAILURE Item: </c><c|àÈ>UMD skill total + roll = </c>" +IntToString (iUMDSkillLevel) + " <c|àÈ>+ </c>" + IntToString (ROLL) + "<c|àÈ> = </c>" +IntToString (iUMDSkillLevel+ROLL) + " <c|àÈ>  Against DC: </c>" + IntToString (iDC_CRAFT);
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string UMD_ItemFailureString (int iUMDSkillLevel, int ROLL, int iDC_CRAFT)
{
    string sMsg = "<cÆ?Q>FAILURE Item:</c> <c|àÈ>UMD skill total + roll =</c> " +IntToString (iUMDSkillLevel) + " <c|àÈ>+ </c>" + IntToString (ROLL) + " <c|àÈ>= </c>" +IntToString (iUMDSkillLevel+ROLL) + "<c|àÈ>   Against DC: </c>" + IntToString (iDC_CRAFT);
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string UMD_SpellcraftSuccessString (int iUMDSkillLevel, int ROLL, int iDC_CRAFT)
{
    string sMsg = "<cÆàÈ>SUCCESS: </c><c|àÈ>Spellcraft skill total + roll =</c> " +IntToString (iUMDSkillLevel) + "<c|àÈ> + </c>" + IntToString (ROLL) + " <c|àÈ>= </c>" +IntToString (iUMDSkillLevel+ROLL) + "<c|àÈ>   Against DC:</c> " + IntToString (iDC_CRAFT);
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string UMD_SpellcraftCriticalFailureString (int iUMDSkillLevel, int ROLL, int iDC_CRAFT)
{
    string sMsg = "<cÆ?Q>CRITICAL FAILURE: </c><c|àÈ>Spellcraft skill total + roll =</c> " +IntToString (iUMDSkillLevel) + " <c|àÈ>+ </c>" + IntToString (ROLL) + "<c|àÈ> = </c>" +IntToString (iUMDSkillLevel+ROLL) + " <c|àÈ>  Against DC: </c>" + IntToString (iDC_CRAFT);
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

string UMD_SpellcraftFailureString (int iUMDSkillLevel, int ROLL, int iDC_CRAFT)
{
    string sMsg = "<cÆ?Q>FAILURE:</c><c|àÈ> Spellcraft skill total + roll =</c> " +IntToString (iUMDSkillLevel) + "<c|àÈ> +</c> " + IntToString (ROLL) + "<c|àÈ> = </c>" +IntToString (iUMDSkillLevel+ROLL) + " <c|àÈ>  Against DC: </c>" + IntToString (iDC_CRAFT);
    if (DM_ALERT) SendMessageToAllDMs(sMsg);
    return sMsg;
}

//*******************************CUSTOMIZE STRING OPTIONS END HERE******************************************


//////////SCRIPT OPTIONS END////////////------------------------------------------------------------------------------
#include "x2_inc_switches"
#include "x2_inc_itemprop"

//void CreateCreature(string sName, location lTarget)
//This is a wrapper function to wrap around CreateObject
void CreateCreature(int iType, string sName, location lTarget)
{
     CreateObject(iType, sName, lTarget);
}


//void ApplyPenalty(object oCaster)
//Applies failure penalty to the caster
//BOOKMARK_PENALTY
void ApplyPenalty(object oCaster, string sDC)
{
    if(PENALTY_TYPE == DAMAGE_EFFECT)
    {
        effect eDamage = EffectDamage(DAMAGE_AMOUNT);
        effect eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
        effect eApply = EffectLinkEffects(eDamage, eVis);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eApply, oCaster);
    } //end if
    else if(PENALTY_TYPE == DAMAGE_BY_LEVEL_EFFECT)
    {
        //eDamage determines how much damage to apply for each spell level.
        //Change d6 to some other die or variable for different damage.
        effect eDamage = EffectDamage(d6(StringToInt(sDC)));
        effect eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
        effect eApply = EffectLinkEffects(eDamage, eVis);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eApply, oCaster);
    } //end else if
    else if(PENALTY_TYPE == RANDOM_EFFECT)
    {
        ApplyRandomEffect(oCaster, sDC);
    } //end else if
} //end void ApplyPenalty()

//**************************************Apply Random Effect Function************************

//void ApplyRandomEffect(object oCaster)
//Applies random effect to oCaster
//BOOKMARK_RANDOM_EFFECT
void ApplyRandomEffect(object oCaster, string sDC)
{
    //iEffect This determines which random effect to use.  If you have more than
    //twenty random effects, change this to a higher number.  For example: if
    //you have total of 25 effects, change this to (d20() + d6() - 1)
    int iEffect = d20();

    if(DEBUG)
    {
        SendMessageToPC(OBJECT_SELF, "UMDDebug: Penalty effect roll: " +
                        IntToString(iEffect) + " Spell level: " + sDC);
    } //end if(DEBUG)

    //fDuration This is the duration for random temporary effects.  Adjust the
    //number inside RoundsToSeconds if you wish to change.
    //Default is 3
    float fDuration = RoundsToSeconds(3);
    location lCaster = GetLocation(oCaster);
    vector vCaster = GetPosition(oCaster);
    effect e1, e2, e3, e4, eApply;
    object oTemp;
    location lTemp;
    int iTemp;

    //switch(iEffect)  This is where random effects are stored.  If you wish to
    //add more effects, just continue on to the next case.  "default" catches
    //all the unassigned cases and reroll the random effect till the roll is a
    //valid case.
    switch(iEffect)
    {
        case 1: //Lightning strikes the caster with (d6 * Spell Level) damage
            e1 = EffectDamage(d6(StringToInt(sDC)));
            e2 = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
            eApply = EffectLinkEffects(e1, e2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eApply, oCaster);
            break;
        case 2: //Scroll explodes with (d6 * Spell Level) damage to the caster
                //and knocks the caster to the ground
            e1 = EffectDamage(d6(StringToInt(sDC)));
            e2 = EffectVisualEffect(VFX_FNF_FIREBALL);
            e3 = EffectKnockdown();
            eApply = EffectLinkEffects(e1, e2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eApply, oCaster);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e3, oCaster, 6.0);
            break;
        case 3: //Polymorphs caster into a confused penguin for the duration
            e1 = EffectPolymorph(POLYMORPH_TYPE_PENGUIN);
            e2 = EffectVisualEffect(VFX_IMP_POLYMORPH);
            e3 = EffectConfused();
            e4 = EffectLinkEffects(e1, e2);
            eApply = EffectLinkEffects(e3, e4);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oCaster,
                                fDuration);
            break;
        case 4: //Polymorphs caster into a confused cow for the duration
            e1 = EffectPolymorph(POLYMORPH_TYPE_COW);
            e2 = EffectVisualEffect(VFX_IMP_POLYMORPH);
            e3 = EffectConfused();
            e4 = EffectLinkEffects(e1, e2);
            eApply = EffectLinkEffects(e3, e4);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oCaster,
                                fDuration);
            switch(d2())
            {
                case 1:
                    PlaySound("as_an_cow1");
                    break;
                case 2:
                    PlaySound("as_an_cow2");
                    break;
                default:
                    PlaySound("as_an_cow1");
                    break;
            } //end switch(d2())
            break;
        case 5: //Renders caster blind and deaf for the duration
            e1 = EffectBlindness();
            e2 = EffectDeaf();
            e3 = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
            e4 = EffectLinkEffects(e1, e2);
            eApply = EffectLinkEffects(e3, e4);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oCaster,
                                fDuration);
            break;
        case 6: //Creates a wall of fire under the caster for the duration
            eApply = EffectAreaOfEffect(AOE_PER_WALLFIRE);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eApply, lCaster,
                                fDuration);
            break;
        case 7: //Renders the caster confused for the duration
            e1 = EffectConfused();
            e2 = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
            eApply = EffectLinkEffects(e1, e2);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oCaster,
                                fDuration);
            break;
        case 8: //Lowers all of caster's ability score 1 point for every 3 level
                //of Spell Level for the duration
            iTemp = (StringToInt(sDC) + 2) / 3;
            e1 = EffectCurse(iTemp, iTemp, iTemp, iTemp, iTemp, iTemp);
            e2 = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
            eApply = EffectLinkEffects(e1, e2);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oCaster,
                                fDuration);
            break;
        case 9: //Summons a hostile imp for Spell Levels 0-4.
                //Summons a hostile balor for Spell Levels 5 and above.
            vCaster = vCaster + Vector(IntToFloat(Random(21) - 10),
                                       IntToFloat(Random(21) - 10));
            lTemp = Location(GetArea(oCaster), vCaster, GetFacingFromLocation(
                             lCaster));
            if(StringToInt(sDC) < 5)
            {
                CreateCreature(OBJECT_TYPE_CREATURE, "nw_imp", lTemp);
                eApply = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eApply, lTemp);
            } //end if
            else
            {
                eApply = EffectVisualEffect(VFX_FNF_SUMMON_GATE);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eApply, lTemp);
                DelayCommand(3.0, CreateCreature(OBJECT_TYPE_CREATURE,
                             "NW_S_BALOR_EVIL", lTemp));

            } //end else
            break;
        case 10:  //Render the caster feared for the duration
            e1 = EffectFrightened();
            e2 = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR );
            eApply = EffectLinkEffects(e1, e2);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oCaster,
                                fDuration);
            break;
        case 11: //Entangles the caster for the duration
            e1 = EffectEntangle();
            e2 = EffectVisualEffect(VFX_DUR_ENTANGLE);
            eApply = EffectLinkEffects(e1, e2);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oCaster,
                                fDuration);
            break;
        case 12: //Casts Dispel Magic at the caster
            e1 = EffectDispelMagicAll(20);
            e2 = EffectVisualEffect(VFX_FNF_DISPEL_GREATER);
            eApply = EffectLinkEffects(e1, e2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eApply, oCaster);
            break;
        case 13: //Renders the caster slowed for the duration
            e1 = EffectSlow();
            e2 = EffectVisualEffect(VFX_IMP_SLOW);
            eApply = EffectLinkEffects(e1, e2);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oCaster,
                                fDuration);
            break;
        case 14: //Creates a web under the caster for the duration
            eApply = EffectAreaOfEffect(AOE_PER_WEB);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eApply, lCaster,
                                fDuration);
            break;
        case 15: //Creates an stinking fog under the caster for the duration
            eApply = EffectAreaOfEffect(AOE_PER_FOGSTINK);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eApply, lCaster,
                                fDuration);
            break;
        case 16: //Creates darkness at the caster for the duration
            eApply = EffectAreaOfEffect(AOE_PER_DARKNESS);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eApply, lCaster,
                                fDuration);
            break;
        case 17: //Increases one random stat of the caster by (1d4 + 1) for the
                 //duration
            switch(d6())
            {
                case 1:
                    iTemp = ABILITY_CHARISMA;
                    break;
                case 2:
                    iTemp = ABILITY_CONSTITUTION;
                    break;
                case 3:
                    iTemp = ABILITY_DEXTERITY;
                    break;
                case 4:
                    iTemp = ABILITY_INTELLIGENCE;
                    break;
                case 5:
                    iTemp = ABILITY_STRENGTH;
                    break;
                case 6:
                    iTemp = ABILITY_WISDOM;
                    break;
                default:
                    iTemp = ABILITY_STRENGTH;
                    break;
            } //end switch(d6())
            e1 = EffectAbilityIncrease(iTemp, d4() + 1);
            e2 = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
            eApply = EffectLinkEffects(e1, e2);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oCaster,
                                fDuration);
            break;
        case 18: //The caster and the surrounding area hears a dragon roar
            switch(d3())
            {
                case 1:
                    PlaySound("as_an_dragonror1");
                    break;
                case 2:
                    PlaySound("as_an_dragonror2");
                    break;
                case 3:
                    PlaySound("as_an_dragonror3");
                    break;
                default:
                    PlaySound("as_an_dragonror1");
                    break;
            } //end switch(d3())
            break;
        case 19: //Casts invisiblity on the caster for the duration
            e1 = EffectInvisibility(INVISIBILITY_TYPE_NORMAL);
            e2 = EffectVisualEffect(VFX_DUR_SANCTUARY);
            eApply = EffectLinkEffects(e1, e2);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oCaster,
                                fDuration);
            break;
        case 20: //Teleports the caster to a random location within 10 meters
            vCaster = vCaster + Vector(IntToFloat(Random(21) - 10),
                                       IntToFloat(Random(21) - 10));
            lTemp = Location(GetArea(oCaster), vCaster, GetFacingFromLocation(
                             lCaster));
            eApply = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eApply, oCaster);
            ActionJumpToLocation(lTemp);
            break;
        default: //Reroll
            ApplyRandomEffect(oCaster, sDC);
            break;
    } //end switch(iEffect)
} //end void ApplyRandomEffect(object oCaster)


//**************************************ACTUAL UMD CODE IS HERE*********************************************
int X2_UMD()
{
    /*
    if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_UMD_SCROLLS) == FALSE)
    {
        return TRUE;
    }*/
//declarations
    int iUMD_CRAFT = INVALID;
    int bUSE_UMD = TRUE;
    int bUSE_CRAFT = TRUE;
    int bIS_SCROLL = FALSE;
    int bINNATE = FALSE; // Should we use the innate column?
    int bSUCCESS = FALSE;
    int iFINAL_ROLL;
    int iROLL;
    int nTag;
    string sTag;
    string s2DAColumn;
    float fLevel;
    string sMessage;
    object oTarget = GetSpellTargetObject();
    int iSpellId = GetSpellId();
    int nOther = FALSE;
    int Destroy;
    int nAbility = FALSE;
    int nBase_Class;

    int nSpellID = GetSpellId();

    // -------------------------------------------------------------------------
    // if we knew that spell we could also cast it from an item (may be redundant)
    // -------------------------------------------------------------------------
    if(GetHasSpell(nSpellID) > 0)
    {
        SendMessageToPC(OBJECT_SELF, "UMD Bypassed: Spell Memorized.");
        bSUCCESS = TRUE;
    }

    if(GetSpellId() == 566)
    {
        SendMessageToPC(OBJECT_SELF, "On-Hit Evil Blight");
        bSUCCESS = TRUE;
    }

    //This code allows DM controlled NPCs and Monsters to cast
    //without a UMD check - Spell Like abilities will now work.
    //as well as potions and the share spell feature to bypass
    //a second UMD check.
    sTag = GetSubString(GetTag(GetSpellCastItem()),0,3);
    if (DEBUG) SendMessageToPC(OBJECT_SELF, sTag);
    if (sTag == "UMD" || sTag == "itm")
            {
            nOther = TRUE;  //if the tag begins with UMD - autopass the spell.
            SendMessageToPC(OBJECT_SELF, ITEM_CASTING());
            }

    if (!UMD_OTHER)   //do not UMD things other than scrolls and wands...
        {
        if ((GetBaseItemType(GetSpellCastItem())!= BASE_ITEM_SCROLL) &&
           (GetBaseItemType(GetSpellCastItem())!= BASE_ITEM_SPELLSCROLL) &&
           (GetBaseItemType(GetSpellCastItem())!= BASE_ITEM_ENCHANTED_SCROLL) &&
           (GetBaseItemType(GetSpellCastItem())!= BASE_ITEM_MAGICROD) &&
           (GetBaseItemType(GetSpellCastItem())!= BASE_ITEM_MAGICSTAFF) &&
           (GetBaseItemType(GetSpellCastItem())!= BASE_ITEM_MAGICWAND))
                {
                nOther = TRUE;
                //SendMessageToPC(OBJECT_SELF, ITEM_CASTING());
                }
         }

    if (UMD_PASS_ABILITIES)
        {
        //Assasin ability exception
        if (GetLevelByClass(CLASS_TYPE_ASSASSIN, OBJECT_SELF)>1)
            {
            if (GetSpellId()== SPELL_GHOSTLY_VISAGE) nAbility = TRUE;
            }
        if (GetLevelByClass(CLASS_TYPE_ASSASSIN, OBJECT_SELF)>4)
            {
            if (GetSpellId()== SPELL_DARKNESS) nAbility = TRUE;
            }
        if (GetLevelByClass(CLASS_TYPE_ASSASSIN, OBJECT_SELF)>8)
            {
            if (GetSpellId()== SPELL_IMPROVED_INVISIBILITY) nAbility = TRUE;
            }
        //Blackguard ability exceptions
        if (GetLevelByClass(CLASS_TYPE_BLACKGUARD, OBJECT_SELF)>1)
            {
            if (GetSpellId()== SPELL_BULLS_STRENGTH) nAbility = TRUE;
            }
        if (GetLevelByClass(CLASS_TYPE_BLACKGUARD, OBJECT_SELF)>2)
            {
            if (GetSpellId()== SPELL_CREATE_UNDEAD) nAbility = TRUE;
            }
        if (GetLevelByClass(CLASS_TYPE_BLACKGUARD, OBJECT_SELF)>5)
            {
            if (GetSpellId()== SPELL_INFLICT_SERIOUS_WOUNDS) nAbility = TRUE;
            }
        if (GetLevelByClass(CLASS_TYPE_BLACKGUARD, OBJECT_SELF)>6)
            {
            if (GetSpellId()== SPELL_CONTAGION) nAbility = TRUE;
            }
        if (GetLevelByClass(CLASS_TYPE_BLACKGUARD, OBJECT_SELF)>7)
            {
            if (GetSpellId()== SPELL_INFLICT_CRITICAL_WOUNDS) nAbility = TRUE;
            }
        //Harper exceptions
        if (GetLevelByClass(CLASS_TYPE_HARPER, OBJECT_SELF)>1)
            {
            if (GetSpellId()== SPELL_SLEEP) nAbility = TRUE;
            }
        if (GetLevelByClass(CLASS_TYPE_HARPER, OBJECT_SELF)>2)
            {
            if (GetSpellId()== SPELL_CATS_GRACE) nAbility = TRUE;
            }
        if (GetLevelByClass(CLASS_TYPE_HARPER, OBJECT_SELF)>3)
            {
            if (GetSpellId()== SPELL_EAGLE_SPLEDOR) nAbility = TRUE;
            }
        if (GetLevelByClass(CLASS_TYPE_HARPER, OBJECT_SELF)>4)
            {
            if (GetSpellId()== SPELL_INVISIBILITY) nAbility = TRUE;
            }
        //Palemaster exceptions
        if (GetLevelByClass(CLASS_TYPE_PALEMASTER, OBJECT_SELF)>0)
            {
            if (GetSpellId()== SPELL_STONE_BONES) nAbility = TRUE;
            }
        if (GetLevelByClass(CLASS_TYPE_PALEMASTER, OBJECT_SELF)>1)
            {
            if (GetSpellId()== SPELL_ANIMATE_DEAD) nAbility = TRUE;
            }
        if (GetLevelByClass(CLASS_TYPE_PALEMASTER, OBJECT_SELF)>2)
            {
            if (GetSpellId()== SPELL_DARKVISION) nAbility = TRUE;
            }

        }


    if (
        (!UMD_ON) || // do not run if UMD is turned off
        (!GetIsPC(OBJECT_SELF)) ||  // do not run for NPCs/DMs
        (GetIsPC(GetMaster(OBJECT_SELF))) || // do not run for DM possessed NPCs
        (!GetIsObjectValid(GetSpellCastItem())) || // do not run for spells cast by the character
        (GetBaseItemType(GetSpellCastItem())==BASE_ITEM_POTIONS)||// do not run for potions
        (nOther)|| //will exclude "other" items like armor, helmets based on configuration.
        (nAbility)
        )
        {
            bSUCCESS=TRUE;
        }

    else
        {

        int iHIGH_SP = 0; // highest spell the character can cast
        int iPosition = 1;
        int iSpellcraftLevel = 0;
        int iUMDSkillLevel = 0;

        //Raise Scroll Pass
            if(iSpellId == SPELL_RAISE_DEAD)
            {
              bSUCCESS = TRUE;
            }

        // check for everything - items and wands with a DC of 20
        // and scrolls with a DC of 25.
        if(
           (GetBaseItemType(GetSpellCastItem()) == BASE_ITEM_SCROLL) ||
           (GetBaseItemType(GetSpellCastItem()) == BASE_ITEM_ENCHANTED_SCROLL) ||
           (GetBaseItemType(GetSpellCastItem()) == BASE_ITEM_SPELLSCROLL)
           )
           {
                bIS_SCROLL=TRUE;
           }

        int nClass = GetClassByPosition(iPosition);
        int nLevel = GetLevelByPosition(iPosition);
        int nPM;

        if  ((nClass == CLASS_TYPE_WIZARD) ||
            (nClass == CLASS_TYPE_SORCERER) ||
            (nClass == CLASS_TYPE_BARD))
                {
                nPM = 1 + GetLevelByClass(CLASS_TYPE_PALEMASTER, OBJECT_SELF);
                nLevel = nLevel + FloatToInt(nPM/2.0);
                if (DEBUG) SendMessageToPC(OBJECT_SELF, "PaleMaster Adjust: " + IntToString( FloatToInt(nPM/2.0)) + "Final Level: " + IntToString(nLevel));
                }

        while ((nClass!=CLASS_TYPE_INVALID) && (iPosition <= 3) && (!bSUCCESS))

        {
        s2DAColumn = "NOT_VALID";
        nBase_Class = ABILITY_INTELLIGENCE;

        if ((nClass == CLASS_TYPE_WIZARD) || (nClass == CLASS_TYPE_SORCERER))
            {
            s2DAColumn = "Wiz_Sorc";
            if (nClass ==  CLASS_TYPE_WIZARD)
                {
                fLevel = (IntToFloat(nLevel)/2)+0.5;
                iHIGH_SP = FloatToInt(fLevel);
                //ability override
                nBase_Class = ABILITY_INTELLIGENCE;
                }
            //begin sorc
            else
                {
                if (nLevel==1) nLevel = 2;  //special exception for level 1
                iHIGH_SP = nLevel/2;
                //ability override
                nBase_Class = ABILITY_CHARISMA;
                }
            }//end wiz_sorc
        else{
        if (nClass == CLASS_TYPE_CLERIC)
            {
            s2DAColumn = "Cleric";
            fLevel = (IntToFloat(nLevel)/2)+0.5;
            iHIGH_SP = FloatToInt(fLevel);
            //ability override
            nBase_Class = ABILITY_WISDOM;
            }   //end cleric
        else{
        if (nClass == CLASS_TYPE_BARD)
            {
            s2DAColumn = "Bard";
            iHIGH_SP = (nLevel+2)/3;
            if (nLevel==1) iHIGH_SP = 0;
            nBase_Class = ABILITY_CHARISMA;
            }   //end bard
        else{
        if (nClass == CLASS_TYPE_DRUID)
            {
            s2DAColumn = "Druid";
            fLevel = (IntToFloat(nLevel)/2)+0.5;
            iHIGH_SP = FloatToInt(fLevel);
            nBase_Class = ABILITY_WISDOM;
            } // end druid
        else{
        if (nClass == CLASS_TYPE_PALADIN)
            {
            s2DAColumn = "Paladin";
            if (nLevel>=4) iHIGH_SP = 1;
            if (nLevel>=8) iHIGH_SP = 2;
            if (nLevel>=11)iHIGH_SP = 3;
            if (nLevel>=14)iHIGH_SP = 4;
            nBase_Class = ABILITY_WISDOM;
            } //end Paladin
        else{
        if (nClass == CLASS_TYPE_RANGER)
            {
            s2DAColumn = "Ranger";
            if (nLevel>=4) iHIGH_SP = 1;
            if (nLevel>=8) iHIGH_SP = 2;
            if (nLevel>=11)iHIGH_SP = 3;
            if (nLevel>=14)iHIGH_SP = 4;
            nBase_Class = ABILITY_WISDOM;
            if ((GetAbilityScore(OBJECT_SELF, ABILITY_WISDOM)-10)<iHIGH_SP)
                iHIGH_SP = (GetAbilityScore(OBJECT_SELF, ABILITY_WISDOM)-10);
            if (DEBUG) SendMessageToPC(OBJECT_SELF, "UMDDebug: Highest Spell Level Available: "+ IntToString(iHIGH_SP));
            }
            }}}}}


            //ability base adjustment
            if ((GetAbilityScore(OBJECT_SELF, nBase_Class)-10)<iHIGH_SP)
                iHIGH_SP = (GetAbilityScore(OBJECT_SELF, nBase_Class)-10);
            if (DEBUG) SendMessageToPC(OBJECT_SELF, "UMDDebug: Highest Spell Level Available: " + IntToString(iHIGH_SP));



            //cache system to decrease 2da pulls
            //first check a variable to see if that state has been cached before.
            //this extra step is to avoid confusion with a default of 0 versus
            //actually pulling a zero from the 2da file.
            if (s2DAColumn != "NOT_VALID")
            {
            string Cache2DA;
            int CacheD = GetLocalInt(GetModule(), "Cached_"+s2DAColumn + IntToString(iSpellId));
            if (CacheD!=1)
                {
                Cache2DA = Get2DAString("spells", s2DAColumn, iSpellId);
                SetLocalString(GetModule(), "2DA_"+s2DAColumn+IntToString(iSpellId), Cache2DA);
                SetLocalInt(GetModule(), "Cached_"+s2DAColumn + IntToString(iSpellId),1);
                if (DEBUG) SendMessageToPC(OBJECT_SELF, "Set Cached Result");
                }
                else
                {
                Cache2DA = GetLocalString(GetModule(), "2DA_"+ s2DAColumn + IntToString(iSpellId));
                if (DEBUG) SendMessageToPC(OBJECT_SELF, "Pulled Cached Result");
                }

            sDC = Cache2DA;

            //Protection from alignment fix - Sir Elric
            if(iSpellId == 138 || iSpellId == 139)
            {
              sDC = "1";
            }



            if (sDC=="") sDC = "20";


            if (iHIGH_SP >= (StringToInt(sDC)))
                    {
                    bSUCCESS = TRUE;
                    }

            if (bINNATE) iUMD_CRAFT = StringToInt(sDC);

            //DEBUG MESSAGES
            if (DEBUG) SendMessageToPC(OBJECT_SELF, "UMDDebug: Above Class iPosition: " + IntToString(iPosition) + " Class: " + s2DAColumn);
            if (DEBUG) SendMessageToPC(OBJECT_SELF, "UMDDebug: DC of Attempted Spell: " + sDC);
            if ((DEBUG)&&(bSUCCESS)) SendMessageToPC(OBJECT_SELF, "UMDDebug: Class Casting Success");
            //now repeat for 2nd class and 3rd class....
            }
            else
            {
            if (DEBUG) SendMessageToPC(OBJECT_SELF, "Non-Casting Class: Position: " + IntToString(iPosition));
            }

        iPosition = iPosition + 1;
        nClass = GetClassByPosition(iPosition);
        nLevel = GetLevelByPosition(iPosition);
        nLevel = nLevel + FloatToInt(nPM/2.0);
        } //end the while statement - 1 open bracket

       if (!bSUCCESS)
        {
        SendMessageToPC(OBJECT_SELF, INNATE_FAILURE());

        //SO RIGHT NOW IF bSUCCESS IS STILL FALSE THEN THEY MUST PASS
        //EITHER A SPELLCRAFT ATTEMPT OR A UMD ATTEMPT
        iROLL = d20();

        s2DAColumn = "Innate";
        //cache system to decrease 2da pulls
        //first check a variable to see if that state has been cached before.
        //this extra step is to avoid confusion with a default of 0 versus
        //actually pulling a zero from the 2da file.
        string Cache2DA;
            int CacheD = GetLocalInt(GetModule(), "Cached_"+s2DAColumn + IntToString(iSpellId));
            if (CacheD!=1)
                {
                Cache2DA = Get2DAString("spells", s2DAColumn, iSpellId);
                SetLocalString(GetModule(), "2DA_"+s2DAColumn+IntToString(iSpellId), Cache2DA);
                SetLocalInt(GetModule(), "Cached_"+s2DAColumn + IntToString(iSpellId),1);
                if (DEBUG) SendMessageToPC(OBJECT_SELF, "Set Cached Result");
                }
                else
                {
                Cache2DA = GetLocalString(GetModule(), "2DA_"+ s2DAColumn + IntToString(iSpellId));
                if (DEBUG) SendMessageToPC(OBJECT_SELF, "Pulled Cached Result");
                }

        sDC = Cache2DA;

        if (DEBUG) SendMessageToPC(OBJECT_SELF, "UMDDebug: Innate level: " +sDC);
        if (sDC=="")  SendMessageToPC(OBJECT_SELF, "ERROR: 2DA LOOKUP ERROR - ALERT spell_hak SCRIPT CREATOR - sDC should never be empty string");
        iUMD_CRAFT = StringToInt(sDC);

        iSpellcraftLevel = GetSkillRank(SKILL_SPELLCRAFT);
        if (iSpellcraftLevel<1) bUSE_CRAFT = FALSE;
        //Per PHB add 2 if use Magic device 5 or higher (synergy)
        if  ((GetSkillRank(SKILL_USE_MAGIC_DEVICE)>4) && (GetSkillRank(SKILL_SPELLCRAFT)>0))
            {
            iSpellcraftLevel = iSpellcraftLevel+2;
            }

        iUMDSkillLevel = GetSkillRank(SKILL_USE_MAGIC_DEVICE);
        if (iUMDSkillLevel<1) bUSE_UMD = FALSE;
        //Per PHB add 2 if spellcraft 5 or higher (synergy)
        if  ((GetSkillRank(SKILL_SPELLCRAFT)>4) && (GetSkillRank(SKILL_USE_MAGIC_DEVICE)>0))
            {
            iUMDSkillLevel = iUMDSkillLevel+2;
            }
        //Compare these two and see which is better - for scrolls the DC
        //for UMD is 5 points higher.

        if ((bUSE_CRAFT) &&(bUSE_UMD))
        {
        if (bIS_SCROLL)
            {
            if  ((iUMDSkillLevel - 5) >= iSpellcraftLevel)
                {
                if (DEBUG) SendMessageToPC(OBJECT_SELF, "UMDDebug: Use UMD for Scroll");
                bUSE_CRAFT = FALSE;
                }
                else
                {
                bUSE_UMD = FALSE;
                if (DEBUG) SendMessageToPC(OBJECT_SELF, "UMDDebug: Use Craft for Scroll");
                }
            }
            else
            {
            if  ((iUMDSkillLevel) >= iSpellcraftLevel)
                {
                if (DEBUG) SendMessageToPC(OBJECT_SELF, "UMDDebug: Use UMD for NON-Scroll");
                bUSE_CRAFT = FALSE;
                }
                else
                {
                if (DEBUG) SendMessageToPC(OBJECT_SELF, "UMDDebug: Use Craft for NON-Scroll");
                bUSE_UMD = FALSE;
                }
            }
         }

        //We have decided which to use now check for success or penalty
        if (bUSE_UMD)
            {
            iFINAL_ROLL = iUMDSkillLevel + iROLL;

            if (bIS_SCROLL)
                {
                if (iFINAL_ROLL >= (UMD_DC + iUMD_CRAFT))
                    {
                    bSUCCESS = TRUE;
                    SendMessageToPC(OBJECT_SELF, UMD_ScrollSuccessString(iUMDSkillLevel, iROLL, UMD_DC + iUMD_CRAFT));
                    }
                    else
                    {
                    if ((iFINAL_ROLL + UMD_PENALTY_DC) >= (UMD_DC + iUMD_CRAFT))
                        {
                        SendMessageToPC(OBJECT_SELF, UMD_ScrollFailureString(iUMDSkillLevel, iROLL, UMD_DC + iUMD_CRAFT));
                        FloatingTextStringOnCreature("<cÆ?Q>*Failure*</c>", OBJECT_SELF, FALSE);
                        }
                        else
                        {
                        ApplyPenalty (OBJECT_SELF, sDC);
                        SendMessageToPC(OBJECT_SELF, UMD_ScrollCriticalFailureString(iUMDSkillLevel, iROLL, UMD_DC + iUMD_CRAFT));
                        FloatingTextStringOnCreature("<cÆ?Q>*Critical Failure*</c>", OBJECT_SELF, FALSE);
                        }
                    }
                 }
                 else
                 {
                 if (iFINAL_ROLL >= (UMD_DC + iUMD_CRAFT - 5))//easier for items
                    {
                    bSUCCESS = TRUE;
                    SendMessageToPC(OBJECT_SELF, UMD_ItemSuccessString(iUMDSkillLevel, iROLL, UMD_DC + iUMD_CRAFT - 5));
                    }
                    else
                    {
                    if ((iFINAL_ROLL + UMD_PENALTY_DC) >= (UMD_DC + iUMD_CRAFT - 5))
                        {
                        SendMessageToPC(OBJECT_SELF, UMD_ItemFailureString(iUMDSkillLevel, iROLL, UMD_DC + iUMD_CRAFT - 5));
                        FloatingTextStringOnCreature("<cÆ?Q>*Failure*</c>", OBJECT_SELF, FALSE);
                        }
                        else
                        {
                        ApplyPenalty (OBJECT_SELF, sDC);
                        SendMessageToPC(OBJECT_SELF, UMD_ItemCriticalFailureString(iUMDSkillLevel, iROLL, UMD_DC + iUMD_CRAFT - 5));
                        FloatingTextStringOnCreature("<cÆ?Q>*Critical Failure*</c>", OBJECT_SELF, FALSE);
                        }
                    }
                 }
            }//end of bUSE_UMD
            else
            {
            if (bUSE_CRAFT)
            {
            iFINAL_ROLL = iSpellcraftLevel + iROLL;
            if ((iFINAL_ROLL) >= (CRAFT_DC + iUMD_CRAFT))
                {
                bSUCCESS = TRUE;
                SendMessageToPC(OBJECT_SELF, UMD_SpellcraftSuccessString(iSpellcraftLevel, iROLL, CRAFT_DC + iUMD_CRAFT));
                }
                    else
                    {
                    if ((iFINAL_ROLL + SPELLCRAFT_PENALTY_DC) >= (CRAFT_DC + iUMD_CRAFT))
                        {
                        SendMessageToPC(OBJECT_SELF, UMD_SpellcraftFailureString(iSpellcraftLevel, iROLL, CRAFT_DC + iUMD_CRAFT));
                        FloatingTextStringOnCreature("<cÆ?Q>*Failure*</c>", OBJECT_SELF, FALSE);
                        }
                    else
                        {
                        ApplyPenalty (OBJECT_SELF, sDC);
                        SendMessageToPC(OBJECT_SELF, UMD_SpellcraftCriticalFailureString(iSpellcraftLevel, iROLL, CRAFT_DC + iUMD_CRAFT));
                        FloatingTextStringOnCreature("<cÆ?Q>*Critical Failure*</c>", OBJECT_SELF, FALSE);
                        }
                    }
            }
            else
                {
                SendMessageToPC(OBJECT_SELF, NO_VALID_SKILL());
                FloatingTextStringOnCreature("<cÆ?Q>*Failure*</c>", OBJECT_SELF, FALSE);
                }
            }

        }//close !Success
    }//close the player only code.

    // Run the ShareSpell code to duplicate the spell on the familiar
    if (SHARE_SPELL)
   {
    object oFam = GetAssociate (ASSOCIATE_TYPE_FAMILIAR);
    object oSummoned = GetAssociate (ASSOCIATE_TYPE_SUMMONED);

    // spell has to be cast on self to be shared
    if ((oTarget == OBJECT_SELF) &&
    // spell can't be from item to share
    //(!GetIsObjectValid(GetSpellCastItem())) &&
    (GetIsObjectValid(GetSpellCastItem())) &&

    (GetSpellId()!=SPELL_SHAPECHANGE) &&
    (GetSpellId()!=SPELL_POLYMORPH_SELF) &&
    // familiar has to be summoned to share
    (GetIsObjectValid(oFam)))

    {
        SendMessageToPC (OBJECT_SELF, PHBF_ShareSpellString(OBJECT_SELF, oFam));
        AssignCommand(oFam, ActionCastSpellAtObject (iSpellId, oFam, GetMetaMagicFeat(), TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    }
     if ((oTarget == OBJECT_SELF) &&
    // spell can't be from item to share
    //(!GetIsObjectValid(GetSpellCastItem())) &&
    (GetIsObjectValid(GetSpellCastItem())) &&

    (GetSpellId()!=SPELL_SHAPECHANGE) &&
    (GetSpellId()!=SPELL_POLYMORPH_SELF) &&
    // familiar has to be summoned to share
    (GetIsObjectValid(oSummoned)))

    {
        SendMessageToPC (OBJECT_SELF, PHBF_ShareSpellString(OBJECT_SELF, oSummoned));
        AssignCommand(oSummoned, ActionCastSpellAtObject (iSpellId, oSummoned, GetMetaMagicFeat(), TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    }

    }

    if (bSUCCESS)
        {
        return TRUE;
        }
        else
        {
        effect ePuff =  EffectVisualEffect(VFX_IMP_MAGIC_RESISTANCE_USE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,ePuff,OBJECT_SELF);
        return FALSE;
        }
}

void main()
{
    //--------------------------------------------------------------------------
    // Reset
    //--------------------------------------------------------------------------
    if (GetLocalInt(GetModule(),"X2_L_STOP_EXPERTISE_ABUSE") == TRUE)
    {
         SetActionMode(OBJECT_SELF,ACTION_MODE_EXPERTISE,FALSE);
         SetActionMode(OBJECT_SELF,ACTION_MODE_IMPROVED_EXPERTISE,FALSE);
    }

    //--------------------------------------------------------------------------
    // Do use magic device check
    //--------------------------------------------------------------------------
    int nRet = X2_UMD();
    SetExecutedScriptReturnValue (nRet);
    if (DEBUG) SendMessageToPC(OBJECT_SELF, "Checked: " + IntToString(nRet));
}


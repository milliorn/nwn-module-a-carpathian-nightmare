//::///////////////////////////////////////////////
//:: Elemental Swarm
//:: NW_S0_EleSwarm.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This spell creates a conduit from the caster
    to the elemental planes.  The first elemental
    summoned is a 24 HD Air elemental.  Whenever an
    elemental dies it is replaced by the next
    elemental in the chain Air, Earth, Water, Fire
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 12, 2001
//:://////////////////////////////////////////////
//:: Update Pass By: Preston W, On: July 30, 2001
//
// Edits by Cheetah, uses new summons, 1 in 20 chance of spawning a special elemental.
//                                     falls to 1 in 6 with epic focus: conjuration.
#include "nw_i0_plot"
#include "x2_inc_spellhook"

void main()
{

/*
  Spellcast Hook Code
  Added 2003-06-23 by GeorgZ
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook

    if(!HasItem(OBJECT_SELF, "book_of_summons") && GetIsPC(OBJECT_SELF))
    {
        CreateItemOnObject("book_of_summons", OBJECT_SELF);
    }

    //Declare major variables
    int nMetaMagic = GetMetaMagicFeat();
    int nCasterLevel = GetCasterLevel(OBJECT_SELF);
    int nDuration = GetCasterLevel(OBJECT_SELF);
    nDuration = 24;
    effect eSummon;
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    //Check for metamagic duration
    if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration * 2;  //Duration is +100%
    }
    int nRandom;
    string sResRef1;
    string sResRef2;
    string sResRef3;
    string sResRef4;

    nRandom = d3();
    switch (nRandom)
    {
    case 1: sResRef1 = "su_hfireelem"; break;
    case 2: sResRef1 = "su_hairelem"; break;
    case 3: sResRef1 = "su_hearthelem"; break;
    }
    if (GetHasFeat(FEAT_EPIC_SPELL_FOCUS_CONJURATION))
    nRandom = d6();
    else
    nRandom = d20();
        if (nRandom)
        sResRef2 = "su_runeelem";
        else
        sResRef2 = "su_gairelem";
    if (GetHasFeat(FEAT_EPIC_SPELL_FOCUS_CONJURATION))
    nRandom = d6();
    else
    nRandom = d20();
        if (nRandom)
        sResRef3 = "su_negelem";
        else
        sResRef3 = "su_gearthelem";
    if (GetHasFeat(FEAT_EPIC_SPELL_FOCUS_CONJURATION))
    nRandom = d6();
    else
    nRandom = d20();
        if (nRandom)
        sResRef4 = "su_poselem";
        else
        sResRef4 = "su_gfireelem";

    //Set the summoning effect
    eSummon = EffectSwarm(FALSE, sResRef1, sResRef2, sResRef3, sResRef4);
    //Apply the summon effect
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSummon, OBJECT_SELF, HoursToSeconds(nDuration));
}


//::///////////////////////////////////////////////
//:: Animate Dead
//:: NW_S0_AnimDead.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Summons a powerful skeleton or zombie depending
    on caster level.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 11, 2001
//:://////////////////////////////////////////////

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


    //Declare major variables
    int nMetaMagic = GetMetaMagicFeat();
    int nCasterLevel = GetCasterLevel(OBJECT_SELF);
    int nDuration = GetCasterLevel(OBJECT_SELF);
    nDuration = 24;
    //effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
    effect eSummon;
    //Metamagic extension if needed
    if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration * 2;  //Duration is +100%
    }
    //Summon the appropriate creature based on the summoner level
    if (nCasterLevel <= 5)
    {
        //Tyrant Fog Zombie
        eSummon = EffectSwarm(TRUE, "NW_S_ZOMBTYRANT");
    }
    else if ((nCasterLevel >= 6) && (nCasterLevel <= 9))
    {
        //Skeleton Warrior
        eSummon = EffectSwarm(TRUE, "NW_S_SKELWARR");
    }
    else if ((nCasterLevel >= 10) && (nCasterLevel <= 14))
    {
        //Skeleton Chief
        eSummon = EffectSwarm(TRUE, "NW_S_SKELCHIEF");
    }
    else
    {
        //Epic Skeleton Chieftain
        eSummon = EffectSwarm(TRUE, "pm_skelchief");
    }
    //Apply the summon visual and summon the two undead.
    //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetSpellTargetLocation());
    //ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, GetSpellTargetLocation(), HoursToSeconds(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSummon, OBJECT_SELF, HoursToSeconds(nDuration));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), GetSpellTargetLocation());
}

//::///////////////////////////////////////////////
//:: Planar Binding
//:: NW_S0_Planar.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Summons an outsider dependant on alignment, or
    holds an outsider if the creature fails a save.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 12, 2001
//:://////////////////////////////////////////////
//
// Cheetah - New summons, Outsider paralyse taken out.
#include "NW_I0_SPELLS"
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
    object oTarget = GetSpellTargetObject();
    int nMetaMagic = GetMetaMagicFeat();
    int nCasterLevel = GetCasterLevel(OBJECT_SELF);
    int nDuration = GetCasterLevel(OBJECT_SELF);
    effect eSummon;
    effect eGate;
//    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
//    effect eDur2 = EffectVisualEffect(VFX_DUR_PARALYZED);
//    effect eDur3 = EffectVisualEffect(VFX_DUR_PARALYZE_HOLD);
//    effect eLink = EffectLinkEffects(eDur, EffectParalyze());
//    eLink = EffectLinkEffects(eLink, eDur2);
//    eLink = EffectLinkEffects(eLink, eDur3);

    int nRacial = GetRacialType(oTarget);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    if(nDuration == 0)
    {
        nDuration == 1;
    }
    //Check for metamagic extend
    if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration *2;   //Duration is +100%
    }

        //Set the summon effect based on the alignment of the caster
        float fDelay = 3.0;
        switch (nAlign)
        {
            case ALIGNMENT_EVIL:
                eSummon = EffectSummonCreature("su_succubus",VFX_FNF_SUMMON_GATE, fDelay);
                //eGate = EffectVisualEffect(VFX_FNF_SUMMON_GATE);
            break;
            case ALIGNMENT_GOOD:
                eSummon = EffectSummonCreature("su_hound", VFX_FNF_SUMMON_CELESTIAL, fDelay);
                //eGate = EffectVisualEffect(219);
            break;
            case ALIGNMENT_NEUTRAL:
                eSummon = EffectSummonCreature("su_greenslaad", VFX_FNF_SUMMON_MONSTER_3, 1.0);
                //eGate = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
                //fDelay = 1.0;
            break;
        }
        //Apply the summon effect and VFX impact
        //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eGate, GetSpellTargetLocation());
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, GetSpellTargetLocation(), HoursToSeconds(nDuration));
}


//::///////////////////////////////////////////////
//:: Summon Creature Series
//:: NW_S0_Summon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Carries out the summoning of the appropriate
    creature for the Summon Monster Series of spells
    1 to 9
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 8, 2002
//:://////////////////////////////////////////////
//
//  COMPLETELY!!! Overhauled by Cheetah (Katherine Taylor)
//
//  Summons are different now.
//  Summons obtained depends on these factors:
//  Animal Domain / Epic Spell Focus: Conjuration Feat / Alignment
//
//  EDIT: Moved stat bonus generation to "nw_ch_ac9"
//
//  NOTE: Sometimes if I summon... says something about Sequencer Activated...
//        dunno why it says that... probably your fault Scotty... lol.

effect SetSummonEffect(int nSpellID);

#include "nw_i0_plot"
#include "x2_inc_spellhook"
//#include "ch_inc_summon"

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

/*  if (!GetIsPC(OBJECT_SELF))
  {
      WriteTimestampedLogEntry(GetName(OBJECT_SELF, TRUE) + "[" + GetTag (OBJECT_SELF) +"] tried to cast Summons. Bad! Remove that spell from the creature");
      return;
  }
*/// End of Spell Cast Hook

    if(!HasItem(OBJECT_SELF, "book_of_summons") && GetIsPC(OBJECT_SELF))
    {
        CreateItemOnObject("book_of_summons", OBJECT_SELF);
    }

    //Declare major variables
    int nSpellID = GetSpellId();
    int nDuration = GetCasterLevel(OBJECT_SELF);
    nDuration = 24;
    if(nDuration == 1)
    {
        nDuration = 2;
    }
    effect eSummon = SetSummonEffect(nSpellID);

    //Make metamagic check for extend
    int nMetaMagic = GetMetaMagicFeat();
    if (nMetaMagic == METAMAGIC_EXTEND)
    {
        nDuration = nDuration *2;   //Duration is +100%
    }
    //Apply the VFX impact and summon effect

    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, GetSpellTargetLocation(), HoursToSeconds(nDuration));
}


effect SetSummonEffect(int nSpellID)
{
    int nFNF_Effect;
    int nRoll = d3();
    int nAlignment = GetAlignmentGoodEvil(OBJECT_SELF);
    string sSummon;
    if(GetHasFeat(FEAT_ANIMAL_DOMAIN_POWER)) //WITH THE ANIMAL DOMAIN
    {
        switch (nSpellID)
        {

        case SPELL_SUMMON_CREATURE_I:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_1;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_direboar"; break;
            case ALIGNMENT_EVIL: sSummon = "su_harpy"; break;
            case ALIGNMENT_GOOD: sSummon = "su_pixie"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_II:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_1;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_direwolf"; break;
            case ALIGNMENT_EVIL: sSummon = "su_malar"; break;
            case ALIGNMENT_GOOD: sSummon = "su_leopard"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_III:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_1;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_direspider"; break;
            case ALIGNMENT_EVIL: sSummon = "su_swordspider"; break;
            case ALIGNMENT_GOOD: sSummon = "su_nymph"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_IV:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_2;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_direbear"; break;
            case ALIGNMENT_EVIL: sSummon = "su_gargoyle"; break;
            case ALIGNMENT_GOOD: sSummon = "su_sphinx"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_V:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_2;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_diretiger"; break;
            case ALIGNMENT_EVIL: sSummon = "su_horror"; break;
            case ALIGNMENT_GOOD: sSummon = "su_halfcelest"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_VI:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_3;
            switch (nRoll)
            {
            case 1:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_hfireelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_wererat"; break;
                case ALIGNMENT_GOOD: sSummon = "su_astralelem"; break;
                }
            break;
            case 2:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_hairelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_werecat"; break;
                case ALIGNMENT_GOOD: sSummon = "su_astralelem"; break;
                }
            break;
            case 3:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_hearthelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_werewolf"; break;
                case ALIGNMENT_GOOD: sSummon = "su_miselem"; break;
                }
            break;
            }
        break;

        case SPELL_SUMMON_CREATURE_VII:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_3;
            switch (nRoll)
            {
            case 1:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_gfireelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_sdevourer"; break;
                case ALIGNMENT_GOOD: sSummon = "su_celestcleric"; break;
                }
            break;
            case 2:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_gairelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_idevourer"; break;
                case ALIGNMENT_GOOD: sSummon = "su_celestpaladin"; break;
                }
            break;
            case 3:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_gearthelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_bdevourer"; break;
                case ALIGNMENT_GOOD: sSummon = "su_celestarcher"; break;
                }
            break;
            }
        break;

        case SPELL_SUMMON_CREATURE_VIII:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_3;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_render"; break;
            case ALIGNMENT_EVIL: sSummon = "su_demonflesh"; break;
            case ALIGNMENT_GOOD: sSummon = "su_astraldeva"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_IX:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_3;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_runeelem"; break;
            case ALIGNMENT_EVIL: sSummon = "su_negelem"; break;
            case ALIGNMENT_GOOD: sSummon = "su_poselem"; break;
            }
        break;
        }
    }
    else  //WITOUT THE ANIMAL DOMAIN
    {
        switch (nSpellID)
        {

        case SPELL_SUMMON_CREATURE_I:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_1;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_direbadger"; break;
            case ALIGNMENT_EVIL: sSummon = "su_direrat"; break;
            case ALIGNMENT_GOOD: sSummon = "su_dove"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_II:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_1;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_direboar"; break;
            case ALIGNMENT_EVIL: sSummon = "su_harpy"; break;
            case ALIGNMENT_GOOD: sSummon = "su_pixie"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_III:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_1;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_direwolf"; break;
            case ALIGNMENT_EVIL: sSummon = "su_malar"; break;
            case ALIGNMENT_GOOD: sSummon = "su_leopard"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_IV:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_2;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_direspider"; break;
            case ALIGNMENT_EVIL: sSummon = "su_swordspider"; break;
            case ALIGNMENT_GOOD: sSummon = "su_nymph"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_V:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_2;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_direbear"; break;
            case ALIGNMENT_EVIL: sSummon = "su_gargoyle"; break;
            case ALIGNMENT_GOOD: sSummon = "su_sphinx"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_VI:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_3;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_diretiger"; break;
            case ALIGNMENT_EVIL: sSummon = "su_horror"; break;
            case ALIGNMENT_GOOD: sSummon = "su_halfcelest"; break;
            }
        break;

        case SPELL_SUMMON_CREATURE_VII:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_3;
            switch (nRoll)
            {
            case 1:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_hfireelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_wererat"; break;
                case ALIGNMENT_GOOD: sSummon = "su_astralelem"; break;
                }
            break;
            case 2:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_hairelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_werewolf"; break;
                case ALIGNMENT_GOOD: sSummon = "su_mistelem"; break;
                }
            break;
            case 3:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_hearthelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_werecat"; break;
                case ALIGNMENT_GOOD: sSummon = "su_mistelem"; break;
                }
            break;
            }
        break;

        case SPELL_SUMMON_CREATURE_VIII:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_3;
            switch (nRoll)
            {
            case 1:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_gfireelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_idevourer"; break;
                case ALIGNMENT_GOOD: sSummon = "su_celestcleric"; break;
                }
            break;
            case 2:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_gairelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_sdevourer"; break;
                case ALIGNMENT_GOOD: sSummon = "su_celestpaladin"; break;
                }
            break;
            case 3:
                switch (nAlignment)
                {
                case ALIGNMENT_NEUTRAL: sSummon = "su_gearthelem"; break;
                case ALIGNMENT_EVIL: sSummon = "su_bdevourer"; break;
                case ALIGNMENT_GOOD: sSummon = "su_celestarcher"; break;
                }
            break;
            }
        break;

        case SPELL_SUMMON_CREATURE_IX:
        nFNF_Effect = VFX_FNF_SUMMON_MONSTER_3;
            switch (nAlignment)
            {
            case ALIGNMENT_NEUTRAL: sSummon = "su_render"; break;
            case ALIGNMENT_EVIL: sSummon = "su_demonflesh"; break;
            case ALIGNMENT_GOOD: sSummon = "su_astraldeva"; break;
            }
        break;
        }
    }

// Last minute check to change the summon string if we have the appropiate feat.

    if (nSpellID == SPELL_SUMMON_CREATURE_IX && GetHasFeat(FEAT_EPIC_SPELL_FOCUS_CONJURATION))
    {
        switch (nAlignment)
        {
        case ALIGNMENT_NEUTRAL: sSummon = "su_runeelem"; break;
        case ALIGNMENT_EVIL: sSummon = "su_negelem"; break;
        case ALIGNMENT_GOOD: sSummon = "su_poselem"; break;
        }

    }

    effect eSummonedMonster = EffectSummonCreature(sSummon, nFNF_Effect);
    return eSummonedMonster;
}


//::///////////////////////////////////////////////
//:: Gate
//:: NW_S0_Gate.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:: Summons a Balor to fight for the caster.
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 12, 2001
//:://////////////////////////////////////////////

/*
    Modified By Scarface For Scarface's No PVP Exploit Fixes

    Modified By Cheetah, new alignment based gate system.
    Good or neutral creatures need protection from good.
    Added variable which the onspawn will check to avoid bad summon errors.
    (In otherwords, to make sure it doesn't try to get it's master when it dont have one)
*/

void CreateBad(string sResRef);
#include "x2_inc_spellhook"
void main()
{
/*
  Spellcast Hook Code
  Added 2003-06-20 by Georg
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
  object oCaster = OBJECT_SELF;
  int nMetaMagic = GetMetaMagicFeat();
  int nCasterLevel = GetCasterLevel(oCaster);
  int nDuration = GetCasterLevel(oCaster);
  int nAlignment = GetAlignmentGoodEvil(OBJECT_SELF);
  effect eSummon;

  //Make metamagic extend check
  if (nMetaMagic == METAMAGIC_EXTEND)
  {
    nDuration = nDuration *2;   //Duration is +100%
  }
  //Summon the Balor and apply the VFX impact
  //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetSpellTargetLocation());
  location lSpellTargetLOC = GetSpellTargetLocation();
  if (!GetLocalInt(GetArea(oCaster), "NO_PVP"))
  {
    switch (nAlignment)
    {
    case ALIGNMENT_NEUTRAL:
      if(GetHasSpellEffect(SPELL_PROTECTION_FROM_EVIL) ||
         GetHasSpellEffect(SPELL_PROTECTION_FROM_GOOD) ||
         GetHasSpellEffect(SPELL_MAGIC_CIRCLE_AGAINST_EVIL) ||
         GetHasSpellEffect(SPELL_MAGIC_CIRCLE_AGAINST_GOOD) ||
         GetHasSpellEffect(SPELL_HOLY_AURA) ||
         GetHasFeat(FEAT_EPIC_SPELL_FOCUS_CONJURATION))
      {
          eSummon = EffectSummonCreature("su_pitfiend", VFX_FNF_SUMMON_GATE, 3.0);
          float fSeconds = RoundsToSeconds(nDuration);
          DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, lSpellTargetLOC, fSeconds));
      }
      else
      {
          ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), lSpellTargetLOC);
          DelayCommand(3.0, CreateBad("su_pitfiend"));
      }
    break;
    case ALIGNMENT_EVIL:
      if(GetHasSpellEffect(SPELL_PROTECTION_FROM_EVIL) ||
         GetHasSpellEffect(SPELL_MAGIC_CIRCLE_AGAINST_EVIL) ||
         GetHasSpellEffect(SPELL_HOLY_AURA) ||
         GetHasFeat(FEAT_EPIC_SPELL_FOCUS_CONJURATION))
      {
          eSummon = EffectSummonCreature("su_balor", VFX_FNF_SUMMON_GATE, 3.0);
          float fSeconds = RoundsToSeconds(nDuration);
          DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, lSpellTargetLOC, fSeconds));
      }
      else
      {
          ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), lSpellTargetLOC);
          DelayCommand(3.0, CreateBad("su_balor"));
      }
    break;
    case ALIGNMENT_GOOD:
      if(GetHasSpellEffect(SPELL_PROTECTION_FROM_GOOD) ||
         GetHasSpellEffect(SPELL_MAGIC_CIRCLE_AGAINST_GOOD) ||
         GetHasSpellEffect(SPELL_HOLY_AURA) ||
         GetHasFeat(FEAT_EPIC_SPELL_FOCUS_CONJURATION))
      {
          eSummon = EffectSummonCreature("su_catapalon", VFX_FNF_SUMMON_GATE, 3.0);
          float fSeconds = RoundsToSeconds(nDuration);
          DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, lSpellTargetLOC, fSeconds));
      }
      else
      {
          ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), lSpellTargetLOC);
          DelayCommand(3.0, CreateBad("su_catapalon"));
      }
    break;
    }
   }
   else
   {
       FloatingTextStringOnCreature("This spell is disabled in this area!!", OBJECT_SELF, FALSE);
   }
}
void CreateBad(string sResRef)
{
object oCreature = CreateObject(OBJECT_TYPE_CREATURE, sResRef, GetSpellTargetLocation());

// Make sure we tell the OnSpawn that we are bad...
SetLocalInt(oCreature, "BAD_SUMMON", TRUE);
}

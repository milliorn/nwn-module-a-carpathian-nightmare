#include "inc_mod_events"
void main()
{
    object  oRespawner  = GetLastRespawnButtonPresser(),
            oRecall     = GetItemPossessedBy(oRespawner, "itm_carp_gem");
    int     iPMLevel    = GetLevelByClass(CLASS_TYPE_PALEMASTER, oRespawner);
    string  sKey        = GetPCPublicCDKey(oRespawner, TRUE);

    Raise(oRespawner);
    ApplyPenalty(oRespawner);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), GetLocation(oRespawner));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oRespawner));
    //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetLocation(oRespawner));
    ApplyBountyFlag(oRespawner);
    DelayCommand(0.1, AssignCommand(oRespawner, ClearAllActions()));
    DelayCommand(0.2, AssignCommand(oRespawner, JumpToLocation(GetLocation(GetWaypointByTag("NW_DEATH_TEMPLE")))));
    ExportSingleCharacter(oRespawner);
    FloatingTextStringOnCreature("<c ó >Character Saved</c>", oRespawner, FALSE);
    ExecuteScript("ws_saveall_sub", oRespawner);
}

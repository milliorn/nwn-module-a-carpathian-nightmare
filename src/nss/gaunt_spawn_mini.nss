/************************ [On Spawn] *******************************************
    Filename: j_ai_onspawn or nw_c2_default9
*/
//#include "x2_inc_switches"
#include "x0_i0_anims"
void main()
{
    SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    SetListeningPatterns();
    ActionCastSpellAtObject(SPELL_TRUE_SEEING, OBJECT_SELF, METAMAGIC_MAXIMIZE, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
    effect eSwarm = EffectSwarm(TRUE, "vampiremage", "vampiremaster", "vampirepriestgau", "vampirerogue");
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eSwarm, OBJECT_SELF);
    SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY);

}

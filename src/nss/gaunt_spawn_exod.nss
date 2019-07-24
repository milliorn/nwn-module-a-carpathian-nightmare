//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT9
#include "x0_i0_anims"
// #include "x0_i0_walkway" - in x0_i0_anims
//#include "x0_i0_treasure"
#include "x2_inc_switches"
#include "inc_ai"

void main()
{
    SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    //SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY);
    SetListeningPatterns();
    CreateObject(OBJECT_TYPE_CREATURE, "gatekeeperal", GetLocation(OBJECT_SELF), TRUE);
    effect eSwarm = EffectSwarm(TRUE, "vampiremage", "vampiremaster", "vampirepriestgau", "vampirerogue");
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eSwarm, OBJECT_SELF);
    SetAILevel(OBJECT_SELF, AI_LEVEL_HIGH);
    PrintCRValue(OBJECT_SELF);
}




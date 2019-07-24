//::///////////////////////////////////////////////
//:: Random Destination Script
//:: infinite_
//:: Copyright (c) 2006 Milliorn
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Milliorn
//:: Created On: September 19, 2006
//:://////////////////////////////////////////////

void main()
{

    object oPC = GetClickingObject(); //GetEnteringObject();
    location iTarget1 = GetLocation(GetWaypointByTag("MAP_K")),
             iTarget2 = GetLocation(GetWaypointByTag("MAP_B")),
             iTarget3 = GetLocation(GetWaypointByTag("MAP_C")),
             iTarget4 = GetLocation(GetWaypointByTag("MAP_D")),
             iTarget5 = GetLocation(GetWaypointByTag("MAP_E")),
             iTarget6 = GetLocation(GetWaypointByTag("MAP_F")),
             iTarget7 = GetLocation(GetWaypointByTag("MAP_G")),
             iTarget8 = GetLocation(GetWaypointByTag("MAP_H")),
             iTarget9 = GetLocation(GetWaypointByTag("MAP_I")),
             iTarget10 = GetLocation(GetWaypointByTag("MAP_J"));

    if (GetIsInCombat(oPC))
    {
        SendMessageToPC(oPC, "CANNOT EXIT WHILE IN COMBAT.");
        FloatingTextStringOnCreature("CANNOT EXIT WHILE IN COMBAT.", oPC);
        AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_SPASM));
        DelayCommand(1.7, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 3.5)));
        DelayCommand(2.5, AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DEMON_HAND), oPC)));
        DelayCommand(0.1,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_CRT_RED), GetLocation(oPC)));
        DelayCommand(0.3,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_LRG_RED), GetLocation(oPC)));
        DelayCommand(0.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_REG_RED), GetLocation(oPC)));
        DelayCommand(0.7,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_BONE_MEDIUM), GetLocation(oPC)));
        DelayCommand(0.9,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE), GetLocation(oPC)));
        DelayCommand(1.1,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_BALLISTA), GetLocation(oPC)));
        DelayCommand(1.3,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_STONE_MEDIUM), GetLocation(oPC)));
        DelayCommand(1.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DESTRUCTION), GetLocation(oPC)));
        return;
    }

    //  On every 20th transistion port oPC to boss.
    if (!GetLocalInt(oPC, "RAVANA_TRANSISTION")) SetLocalInt(oPC, "RAVANA_TRANSISTION", 1);

    if (GetLocalInt(oPC, "RAVANA_TRANSISTION") == 20)
    {
        SetLocalInt(oPC, "RAVANA_TRANSISTION", 0);
        AssignCommand(oPC, JumpToLocation(iTarget10));
        return;
    }

    else
    {
        SetLocalInt(oPC, "RAVANA_TRANSISTION", GetLocalInt(oPC, "RAVANA_TRANSISTION") + 1);
        switch (d10())
        {
            case  1:  AssignCommand(oPC, JumpToLocation(iTarget1)); break;
            case  2:  AssignCommand(oPC, JumpToLocation(iTarget2)); break;
            case  3:  AssignCommand(oPC, JumpToLocation(iTarget3)); break;
            case  4:  AssignCommand(oPC, JumpToLocation(iTarget4)); break;
            case  5:  AssignCommand(oPC, JumpToLocation(iTarget5)); break;
            case  6:  AssignCommand(oPC, JumpToLocation(iTarget6)); break;
            case  7:  AssignCommand(oPC, JumpToLocation(iTarget7)); break;
            case  8:  AssignCommand(oPC, JumpToLocation(iTarget8)); break;
            case  9:  AssignCommand(oPC, JumpToLocation(iTarget9)); break;
            case  10: AssignCommand(oPC, JumpToLocation(iTarget10)); break;
        }
    }
}

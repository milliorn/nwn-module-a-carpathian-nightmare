//::///////////////////////////////////////////////
//:: Associate: On Dialogue
//:: NW_CH_AC4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    by the generic script after dialogue or a
    shout is initiated.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 24, 2001
//:://////////////////////////////////////////////

// Optimized: 07-23-2019

#include "x0_inc_henai"

void main()
{
    object oMaster = GetMaster();
    int nMatch = GetListenPatternNumber();
    object oShouter = GetLastSpeaker();

    // listening pattern matched
    if (GetIsObjectValid(oShouter) && oMaster == oShouter)
    {
        SetCommandable(TRUE);
        bkRespondToHenchmenShout(oShouter, nMatch);
    }

    // Signal user-defined event
    if(GetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT)) {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_DIALOGUE));
    }
}

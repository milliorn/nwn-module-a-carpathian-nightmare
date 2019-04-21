//Play Belch Sound
void DoBelch(object oPC);
void DoBelch(object oPC)
{
    SetPCChatMessage ("");
    int nGender = GetGender(oPC);
    if (nGender == GENDER_MALE) AssignCommand(oPC, PlaySound("as_pl_belchingm" + IntToString(d3())));
    else if (nGender == GENDER_FEMALE) DelayCommand(2.0, PlayVoiceChat(VOICE_CHAT_LAUGH, oPC));
}

//Play Shriek Sound
void DoShriek(object oPC);
void DoShriek(object oPC)
{
    SetPCChatMessage ("");
    int nGender = GetGender(oPC);
    if (nGender == GENDER_MALE) AssignCommand(oPC, PlaySound("as_pl_shriekm" + IntToString(d3())));
    else if (nGender == GENDER_FEMALE) AssignCommand(oPC, PlaySound("as_pl_shriekf" + IntToString(d3())));
}

//Play Goodbye Sound
void DoGoodbye(object oPC);
void DoGoodbye(object oPC)
{
    SetPCChatMessage ("");
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW));
    PlayVoiceChat(VOICE_CHAT_GOODBYE, oPC);
}

//Play Hello Sound
void DoHello(object oPC);
void DoHello(object oPC)
{
    SetPCChatMessage ("");
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW));
    PlayVoiceChat(VOICE_CHAT_HELLO, oPC);
}

//Play Headshake
void DoHeadShake(object oPC);
void DoHeadShake(object oPC)
{
    SetPCChatMessage ("");
    PlayVoiceChat(VOICE_CHAT_NO, oPC);
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0, 0.25f));
    DelayCommand(0.15f, AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 1.0, 0.25f)));
    DelayCommand(0.40f, AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0, 0.25f)));
    DelayCommand(0.65f, AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 1.0, 0.25f)));
}

void DoLoopAnimation(object oPlayer, int nAnimation, float fSpeed = 1.0, float fDur = 9999.0)
{
    SetPCChatMessage ("");
    AssignCommand(oPlayer, ClearAllActions(TRUE));
    AssignCommand(oPlayer, ActionPlayAnimation(nAnimation,fSpeed,fDur));
}

void DoFireForgetAnimation(object oPlayer, int nAnimation)
{
    SetPCChatMessage ("");
    AssignCommand(oPlayer, ClearAllActions(TRUE));
    AssignCommand(oPlayer,ActionPlayAnimation(nAnimation));
}

void DoPuke(object oPlayer)
{
    SetPCChatMessage ("");
    effect Puke1 = EffectVisualEffect(VFX_COM_CHUNK_GREEN_MEDIUM);
    effect Puke2 = EffectVisualEffect(VFX_COM_CHUNK_YELLOW_MEDIUM);
    int PukeFix;

    if(GetLocalInt(oPlayer, "PukeFix" )== TRUE)
    {
        FloatingTextStringOnCreature("Spam Fix",oPlayer);
        return;
    }

    else
    {
        SetLocalInt(oPlayer, "PukeFix",TRUE);
        DelayCommand(6.0,SetLocalInt(oPlayer, "PukeFix", FALSE));
        AssignCommand(oPlayer, ClearAllActions(TRUE));
        PlayVoiceChat(VOICE_CHAT_POISONED, oPlayer);
        AssignCommand(oPlayer, ActionPlayAnimation(ANIMATION_FIREFORGET_SPASM));
        DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, Puke1, oPlayer));
        DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, Puke2, oPlayer));
        DelayCommand(3.0, AssignCommand(oPlayer, SpeakString("Blurrrghhhhh!", TALKVOLUME_TALK)));
    }
}

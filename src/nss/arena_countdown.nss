void main()
{
    object oGate = GetObjectByTag("Gladiator_Gate");
    object oDM = GetLastUsedBy();
    object oPit = GetObjectByTag("CenterRing");
    effect ekick  = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
    effect ekick2 = EffectVisualEffect(VFX_IMP_GOOD_HELP);
    effect ekick3 = EffectVisualEffect(VFX_FNF_MYSTICAL_EXPLOSION);

    if(!GetIsDM(oDM))return;

    SetLocked(oGate, FALSE);
    SpeakString("<cú>Gladiator Pit Countdown will begin in 60 seconds!</c>", TALKVOLUME_SHOUT);
    DelayCommand(1.0,  ActionOpenDoor(oGate));
    DelayCommand(49.0, ActionCloseDoor(oGate));
    DelayCommand(50.0, SetLocked(oGate, TRUE));
    DelayCommand(51.0, SetLockKeyRequired(oGate, TRUE));
    DelayCommand(52.0, SpeakString("<cú>Gladiator Pit Countdown</c>", TALKVOLUME_SHOUT));
    DelayCommand(53.0, SpeakString("<cú>Commence Buffing</c>", TALKVOLUME_SHOUT));
    DelayCommand(54.0, SpeakString("<cú>6</c>", TALKVOLUME_SHOUT));
    DelayCommand(55.0, SpeakString("<cú>5</c>", TALKVOLUME_SHOUT));
    DelayCommand(56.0, SpeakString("<cú>4</c>", TALKVOLUME_SHOUT));
    DelayCommand(57.0, SpeakString("<cú>3</c>", TALKVOLUME_SHOUT));
    DelayCommand(58.0, SpeakString("<cú>2</c>", TALKVOLUME_SHOUT));
    DelayCommand(59.0, SpeakString("<cú>1</c>", TALKVOLUME_SHOUT));
    DelayCommand(60.0, SpeakString("<cú>FIGHT!</c>", TALKVOLUME_SHOUT));

    DelayCommand(53.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, ekick, oPit));
    DelayCommand(54.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, ekick2, oPit));
    DelayCommand(55.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, ekick2, oPit));
    DelayCommand(56.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, ekick2, oPit));
    DelayCommand(57.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, ekick2, oPit));
    DelayCommand(58.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, ekick2, oPit));
    DelayCommand(59.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, ekick3, oPit));
}

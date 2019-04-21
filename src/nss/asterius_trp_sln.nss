void main()
{
    object oCreature = GetEnteringObject();

    if (GetIsObjectValid(oCreature) == TRUE && GetIsPC(oCreature) == TRUE)
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSilence(), oCreature, 90.0f);
    }
}

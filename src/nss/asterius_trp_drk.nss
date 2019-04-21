void main()
{

   object oCreature = GetEnteringObject();

   if (GetIsObjectValid(oCreature) == TRUE && GetIsPC(oCreature) == TRUE)
   {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDarkness(), oCreature, 60.0f);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDarkness(), oCreature, 60.0f);
   }
}

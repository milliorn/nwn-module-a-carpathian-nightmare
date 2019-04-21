void main()
{
    object oPC = GetLastUsedBy();
    if(GetIsPC(oPC))
    {
        if (GetName(oPC) == GetLocalString(OBJECT_SELF, "NAME"))
        {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_RAISE_DEAD), GetLocation(OBJECT_SELF));
            GiveXPToCreature(oPC, GetLocalInt(OBJECT_SELF, "xp_dropped"));
            DelayCommand(0.1, DeleteLocalString(OBJECT_SELF, "NAME"));
            DelayCommand(0.5, DeleteLocalInt(OBJECT_SELF, "xp_dropped"));
            DelayCommand(1.0, DestroyObject(OBJECT_SELF));
        }
        else
        {
            SpeakString("This gravestone does not belong to you");
        }
    }
}


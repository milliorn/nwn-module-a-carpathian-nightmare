//Put this script OnOpen
void main()
{
    object oPC = GetLastOpenedBy();
    if (GetIsDM(oPC)) return;
    if (!GetIsPC(oPC)) return;
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), GetLocation(OBJECT_SELF));
}

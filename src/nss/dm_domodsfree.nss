#include "dm_inc_forge"

void main()
{
    object oForge = GetObjectByTag("omegaforge" + GetStringRight(GetTag(OBJECT_SELF),1));
    object oAnvil = GetObjectByTag("omegaanvil" + GetStringRight(GetTag(OBJECT_SELF),1));
    object oOriginal = GetFirstItemInInventory(oForge);
    object oModified = GetFirstItemInInventory(oAnvil);
    effect eForge = EffectVisualEffect(VFX_FNF_SOUND_BURST_SILENT);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eForge,oForge);

    DestroyObject(oOriginal);
    oOriginal = CopyItem(oModified, oForge);
    DestroyObject(oModified);
}

//OnUsed of placeable
void main()
{
    object oPC = GetLastUsedBy();
    if(GetIsPC(oPC))
    {
        GiveGoldToCreature(oPC, GetLocalInt(OBJECT_SELF, "gold"));
        DestroyObject(OBJECT_SELF);
    }
}

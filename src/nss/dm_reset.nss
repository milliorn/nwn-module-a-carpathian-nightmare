void main()
{
    SetLocalInt(OBJECT_SELF,"Cost",0);
    SetLocalInt(OBJECT_SELF,"Refund",FALSE);
    SetLocalInt(OBJECT_SELF,"Visual",FALSE);
    SetLocalInt(OBJECT_SELF,"Mods",0);
    SetLocalInt(OBJECT_SELF,"MODCODE",0);
    DeleteLocalObject(OBJECT_SELF,"ITEM_IN_FORGE");
    SetLocalInt(OBJECT_SELF,"SpellLevel",11);

    DestroyObject(GetFirstItemInInventory(GetObjectByTag("omegaanvil" + GetStringRight(GetTag(OBJECT_SELF),1))));
}

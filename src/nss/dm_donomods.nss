#include "dm_inc_forge"

void main()
{
    DestroyObject(GetFirstItemInInventory(GetObjectByTag("omegaanvil" + GetStringRight(GetTag(OBJECT_SELF),1))));

}

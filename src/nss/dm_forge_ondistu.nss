#include "dm_forge_config"
#include "x2_inc_itemprop"

void main()
{
    object oPC = GetLastDisturbed(),
           oItem = GetInventoryDisturbItem();

    if (GetItemPossessedBy(oItem, "sf_socket_item")!= OBJECT_INVALID)
    {
       SetLocalInt(oPC, "NO_SOCKET", 1);
    }

    switch (GetInventoryDisturbType())
    {

        case INVENTORY_DISTURB_TYPE_ADDED:
        {
            SetLocalObject(OBJECT_SELF, "LAST_USER", oPC);
            SetLocalInt(oPC, "FORGE_CHECK", 1);
            IPRemoveAllItemProperties(oItem, DURATION_TYPE_TEMPORARY);
            break;
        }

       default:
       {
            DeleteLocalObject(OBJECT_SELF, "LAST_USER");
            DeleteLocalInt(oPC, "FORGE_CHECK");
            break;
       }
    }

    if(!PLOT_UNFORGEABLE) return;

    if(GetPlotFlag(oItem))
    {
        CopyItem(oItem,oPC,TRUE);
        DestroyObject(oItem,0.5);
        FloatingTextStringOnCreature("You cannot forge that item", oPC, FALSE);
    }
}

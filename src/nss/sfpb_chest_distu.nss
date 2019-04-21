#include "sfpb_config"
void main()
{
    object oPC = GetLastDisturbed(),
           oChest = OBJECT_SELF,
           oItem = GetInventoryDisturbItem();
    string sName = GetName(oPC);

    location lVis = GetLocation(oPC);

    int nCount;

    switch (GetInventoryDisturbType())
    {

        case INVENTORY_DISTURB_TYPE_ADDED:
        {
            FloatingTextStringOnCreature("<cfÌþ>" + GetName(oPC) + "<c ó > ADDED <cóóó>"
            + GetName(oItem) +"</c> to the Transfer Chest " + " CD KEY = <có ó>"+ GetPCPublicCDKey(oPC, TRUE), oPC, TRUE);

            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lVis);

            object oItem = GetFirstItemInInventory(oChest);
            while (GetIsObjectValid(oItem))
            {
                // Item count
                nCount++;

                if (GetHasInventory(oItem))
                {
                    // Send a message to the player
                    FloatingTextStringOnCreature("<cø>Containers/bags are NOT allowed to" +
                    IntToString(MAX_ITEMS) + " be stored!!!" +
                                         "\nPlease remove the container/bag.</c>", oPC);

                    // Unlock chest and end script
                    return;
                }
                else if (nCount > MAX_ITEMS)
                {
                    // Send a message to the player
                    FloatingTextStringOnCreature("<cø>Only a maximum of " +
                    IntToString(MAX_ITEMS) + " items are allowed to be stored!!!" +
                                         "\nPlease remove the excess items.</c>", oPC);
                    AssignCommand(oPC, ActionSpeakString(sName + " has more than 30 items in a bank chest and will lose " +
                    " all items if that player doesn't reduce the amount to under 30 items"));
                    return;
                }

                // Next item
                oItem = GetNextItemInInventory(oChest);
            }
            break;
        }

        case INVENTORY_DISTURB_TYPE_REMOVED:
        {
            FloatingTextStringOnCreature("<cfÌþ>" + GetName(oPC) + "<có  > REMOVED <cóóó>"
            + GetName(oItem) +"</c> from the Persistant Chest " + " CD KEY = <có ó>"
            + GetPCPublicCDKey(oPC), oPC, TRUE);

            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lVis);

            object oItem = GetFirstItemInInventory(oChest);
            while (GetIsObjectValid(oItem))
            {
                // Item count
                nCount++;

                if (GetHasInventory(oItem))
                {
                    // Send a message to the player
                    FloatingTextStringOnCreature("<cø>Containers/bags are NOT allowed to" +
                    IntToString(MAX_ITEMS) + " be stored!!!" +
                                         "\nPlease remove the container/bag.</c>", oPC);

                    // Unlock chest and end script
                    return;
                }
                else if (nCount > MAX_ITEMS)
                {
                    // Send a message to the player
                    FloatingTextStringOnCreature("<cø>Only a maximum of " +
                    IntToString(MAX_ITEMS) + " items are allowed to be stored!!!" +
                                         "\nPlease remove the excess items.</c>", oPC);
                    return;
                }

                // Next item
                oItem = GetNextItemInInventory(oChest);
            }
            break;
        }

        default: SpeakString("ERROR!  Transfer Chest.  "
        + GetName(oPC) + " " + GetPCPublicCDKey(oPC, TRUE) + ".", TALKVOLUME_SHOUT);
    }
}


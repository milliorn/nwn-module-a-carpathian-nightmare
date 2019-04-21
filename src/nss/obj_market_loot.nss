#include "X0_I0_PARTYWIDE"
void BreakItemForGold(object oPC, object oItem);

void main()
{
    object  oPC   = GetLastDisturbed();
    object  oItem = GetInventoryDisturbItem();

    if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED)
    {
        BreakItemForGold(oPC, oItem);
    }
}

void BreakItemForGold(object oPC, object oItem)
{

        // -------------------------------------------------------------------------
        // CUTOFF CONDITIONS
        // -------------------------------------------------------------------------
        // Abort if something other than an item was targeted....
        if (GetObjectType(oItem) != OBJECT_TYPE_ITEM) {
            FloatingTextStringOnCreature("<cú>You may only break down items for gold!  ", oPC, FALSE);
            return;
        }
        if (GetBaseItemType(oItem) == BASE_ITEM_GOLD) {
            FloatingTextStringOnCreature("Market gave " + GetName(oItem) +
            " valued at " + IntToString(GetItemStackSize(oItem)) + " gp evenly between all party members.", oPC);
            GiveGoldToAllEqually(oPC, GetItemStackSize(oItem));
            DestroyObject(oItem, 0.2);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DESTRUCTION), GetLocation(OBJECT_SELF));
            return;
        }

        // Abort if the item is plot flagged...
        if (GetPlotFlag(oItem)){
            FloatingTextStringOnCreature("<cú>You cannot break down plot items!  ", oPC, FALSE);
            return;
        }

        // -------------------------------------------------------------------------
        // DEFINE VALUES
        // -------------------------------------------------------------------------
        int     nGold           = 0;
        int     nFixedCost      = GetLocalInt(oItem,    "ITEM_COST_FIXED");
        int     bOverrideMax    = GetLocalInt(oItem,    "ITEM_COST_UNLIMITED");
        float   nCostScale      = GetLocalFloat(oItem,  "ITEM_COST_SCALE");
        // Default values, set these to something appropriate.
        float   nMultiplier = 0.1;      // Base item costs are multiplied by this number. Lower number = lower cost.
        int     nMaxValue   = GetGoldPieceValue(oItem);      // Items may never yield more than this amount of gold.
        // -------------------------------------------------------------------------
        // THE OTHER STUFF...
        // -------------------------------------------------------------------------
        // If a variable named ITEM_COST_FIXED is set on the targeted item, it will give that
        // much gold no matter how much its really worth to the game.
        if (nFixedCost > 0)
        {
            nGold = nFixedCost;
        }

/*        if (GetBaseItemType(oItem) == BASE_ITEM_ARROW |
                                      BASE_ITEM_BOLT |
                                      BASE_ITEM_DART |
                                      BASE_ITEM_SHURIKEN |
                                      BASE_ITEM_THROWINGAXE)
        {
            nGold = FloatToInt(GetGoldPieceValue(oItem) * 0.1);
            FloatingTextStringOnCreature("Market bought " + GetName(oItem) + " for "
            + IntToString(nGold) + " gp.", oPC);
            GiveGoldToCreature(oPC, nGold);
            CopyItem(oItem, GetObjectByTag("MarketMerchant"), TRUE);
            DestroyObject(oItem);
            return;
        }
*/        // If a variable named ITEM_COST_SCALE is set on the targeted item, it will multiply
        // the in-game value of the item by that number to get how much gold is received.
        else if (nCostScale > 0.0f)
        {
            nGold = FloatToInt(GetGoldPieceValue(oItem) * nCostScale);
        }
        // Use standard values set above to determine how much of the in-game item value
        // will be returned as gold.
        else
        {
            nGold = FloatToInt(GetGoldPieceValue(oItem) * nMultiplier);
        }
        // No item will ever give more than nMaxValue gold set above, unless a variable
        // named ITEM_COST_UNLIMITED is set on the item.
        if ((nGold > nMaxValue) && !bOverrideMax)
        {
            nGold = nMaxValue;
        }
        // All items will give at least a symbolic 1 gp if nothing else...
        if (nGold < 1)
        {
            nGold = 1;
        }

        FloatingTextStringOnCreature("Market bought " + GetName(oItem) +
        " for " + IntToString(nGold) + " gp.", oPC);
        GiveGoldToAllEqually(oPC, nGold);
        CopyItem(oItem, GetObjectByTag("MarketMerchant"), TRUE);
        DestroyObject(oItem, 0.2);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DESTRUCTION), GetLocation(OBJECT_SELF));

}


const int MAX_ITEMS = 12;

void main()
{
    object oPC = GetLastDisturbed(),
           oChest = OBJECT_SELF,
           oItem = GetInventoryDisturbItem();

    location lVis = GetLocation(oChest);

    int nCount;

    switch (GetInventoryDisturbType())
    {
        case INVENTORY_DISTURB_TYPE_ADDED:
        {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lVis);

            object oItem = GetFirstItemInInventory(oChest);
            while (GetIsObjectValid(oItem))
            {
                if (GetResRef(oItem) == "lordmerrysbon")// Item count
                {
                    nCount++;
                    // Next item
                    oItem = GetNextItemInInventory(oChest);
                }
            }

            if (nCount < MAX_ITEMS)
            {
                // Send a message to the player
                FloatingTextStringOnCreature("<cσσσ>" + IntToString(nCount) +
                "</c> out of <cσσσ>12</c> bones in the coffin.", oPC, TRUE);
                return;
            }

            else if (nCount >= MAX_ITEMS)
            {
                // Send a message to the player
                FloatingTextStringOnCreature("<cσσσ>Lord Merry</c> has risen.", oPC, TRUE);
                object oMerry = GetWaypointByTag("NW_MERRY_SPAWN");
                object oMerryA = GetWaypointByTag("NW_MERRY_BOSS_A");
                object oMerryB = GetWaypointByTag("NW_MERRY_BOSS_B");
                object oMerryC = GetWaypointByTag("NW_MERRY_BOSS_C");
                object oMerryD = GetWaypointByTag("NW_MERRY_BOSS_D");
                object oMerryE = GetWaypointByTag("NW_MERRY_BOSS_E");
                object oMerryF = GetWaypointByTag("NW_MERRY_BOSS_F");
                object oMerryG = GetWaypointByTag("NW_MERRY_BOSS_G");
                object oMerryH = GetWaypointByTag("NW_MERRY_BOSS_H");
                object oMerryI = GetWaypointByTag("NW_MERRY_BOSS_I");
                object oMerryJ = GetWaypointByTag("NW_MERRY_BOSS_J");

                if (!GetIsObjectValid(GetNearestObjectByTag("LordMerry", oMerry)))
                {
                    CreateObject(OBJECT_TYPE_CREATURE, "lordmerry", GetLocation(oMerry));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_EPIC_UNDEAD), GetLocation(oMerry));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HORRID_WILTING), GetLocation(oChest));

                    CreateObject(OBJECT_TYPE_CREATURE, "merrypriest001", GetLocation(oMerryA));
                    CreateObject(OBJECT_TYPE_CREATURE, "merrypriest001", GetLocation(oMerryB));
                    CreateObject(OBJECT_TYPE_CREATURE, "merrypriest001", GetLocation(oMerryC));
                    CreateObject(OBJECT_TYPE_CREATURE, "merrypriest001", GetLocation(oMerryD));
                    CreateObject(OBJECT_TYPE_CREATURE, "merrypriest001", GetLocation(oMerryE));
                    CreateObject(OBJECT_TYPE_CREATURE, "merrypriest001", GetLocation(oMerryF));
                    CreateObject(OBJECT_TYPE_CREATURE, "merrypriest001", GetLocation(oMerryG));
                    CreateObject(OBJECT_TYPE_CREATURE, "merrypriest001", GetLocation(oMerryH));
                    CreateObject(OBJECT_TYPE_CREATURE, "merrypriest001", GetLocation(oMerryI));
                    CreateObject(OBJECT_TYPE_CREATURE, "merrypriest001", GetLocation(oMerryJ));

                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oMerryA));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oMerryB));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oMerryC));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oMerryD));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oMerryE));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oMerryF));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oMerryG));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oMerryH));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oMerryI));
                }

                object oItem = GetFirstItemInInventory(oChest);
                while (GetIsObjectValid(oItem))
                {
                    if (GetResRef(oItem) == "lordmerrysbon")// Item count
                    {
                        DestroyObject(oItem);
                        oItem = GetNextItemInInventory(oChest);

                    }
                }
            }
        }
    }
}

#include "x2_inc_craft"
void main()
{
    int nPart =  GetLocalInt(OBJECT_SELF,"X2_TAILOR_CURRENT_PART");

    object oPC  = GetPCSpeaker();
    object oItem =  CIGetCurrentModItem(oPC);

    int  nCurrentAppearance = GetItemAppearance(oItem,ITEM_APPR_TYPE_ARMOR_MODEL,nPart);


    if(GetIsObjectValid(oItem) == TRUE)
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        object oNew = IPGetModifiedArmor(oItem, nPart, X2_IP_ARMORTYPE_PREV, TRUE);
        CISetCurrentModItem(oPC,oNew);
        AssignCommand(oPC, ActionEquipItem(oNew, INVENTORY_SLOT_HEAD));
    }
}

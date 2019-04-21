//::///////////////////////////////////////////////
//:: Purple Dragon Knight - Heroic Shield
//:: x3_s2_pdk_shield.nss
//:://////////////////////////////////////////////
//:: Applies a temporary AC bonus to one ally
//:: Edit: All allies and OBJECT SELF get the bonus
//:://////////////////////////////////////////////
//:: Created By: Stratovarius
//:: Modified By: Milliorn
//:://////////////////////////////////////////////
/*
    Modified By : gaoneng erick
    Modified On : may 6, 2006
    Modified On : October 29th, 2018
    added custom vfx
*/


void main()
{
    //Declare main variables.
    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    object oObject = GetFirstFactionMember(oPC);
    object oArea = GetArea(OBJECT_SELF);

    int nBonus = 4;

    effect eAC = EffectACIncrease(nBonus);
    effect eVFX = EffectVisualEffect(VFX_IMP_PDK_HEROIC_SHIELD);

    if (GetLocalInt(oPC, "PDKHeroicTracking"))
    {
        FloatingTextStringOnCreature("You can only use this ability once a turn with a one turn cooldown.", oPC, FALSE);
        return;
    }

    while(GetIsObjectValid(oObject))
    {
         if (GetArea(oObject) == oArea)
         {
            if(!GetIsDead(oObject))
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAC, oObject, TurnsToSeconds(1));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oObject);
            }

            /*else if (oPC == oTarget)
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eAC, oObject, TurnsToSeconds(1));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oObject);
            }*/
         }

         oObject = GetNextFactionMember(oPC);
    }

    SetLocalInt(oPC, "PDKHeroicTracking", TRUE);
    DelayCommand(59.9, DeleteLocalInt(oPC, "PDKHeroicTracking"));
}

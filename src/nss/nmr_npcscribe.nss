// Written by: Ne0nx3r0
// for the Dot Hack Project mod,
// http://www.dothackproject.net/
// Ne0nx3r0@hotmail.com

void main()
{
    string sqname = GetLocalString(OBJECT_SELF,"current_name");
    object oChest = GetNearestObjectByTag("ChestofNames");
    object oItem  = GetFirstItemInInventory(oChest);
    object oPC =    GetPCSpeaker();
    int iArtifact = GetGoldPieceValue(oItem);

    TakeGoldFromCreature(iArtifact, oPC, TRUE);
    PlaySound("as_pl_laughingm2");
    ActionCastFakeSpellAtObject(SPELL_NEGATIVE_ENERGY_RAY, oChest, PROJECTILE_PATH_TYPE_DEFAULT);
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HARM), oChest));
    SetName(oItem,"<cú>"+sqname+"</c>");
    SetLocked(oChest,FALSE);
    DelayCommand(1.5, AssignCommand(oChest, ActionSpeakString("<cúú>***Item Scribed!***")));
    ActionSpeakString("<cúú>.. and there you have it!");
}

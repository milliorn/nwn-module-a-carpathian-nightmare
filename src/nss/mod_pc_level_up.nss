#include "inc_mod_events"
#include "acn_subfunc"
#include "nwnx_webhook"
#include "nwnx_time"
#include "inc_private"

void main()
{
    object  oPC         = GetPCLevellingUp(),
            oRecall     = GetItemPossessedBy(oPC, "itm_carp_gem");

    int     iLevel      = GetHitDice(oPC),
            iEXP        = GetXP(oPC),
            iDruid      = GetLevelByClass(CLASS_TYPE_DRUID, oPC),
            iPMLevel    = GetLevelByClass(CLASS_TYPE_PALE_MASTER, oPC);

    string  sLevel      = IntToString(GetHitDice(oPC)),
            sName       = GetName(oPC),
            sArea       = GetTag(GetArea(oPC));


    //  Force an alignment selection if they are Neutral alignment and NOT Druid
    if (iDruid == 0)
    {
        switch( GetAlignmentGoodEvil(oPC))
        {
            case ALIGNMENT_NEUTRAL:
            {
/*                int nXP = GetXP(oPC);
                int nHD = GetHitDice(oPC);
                SetXP(oPC, (((nHD*(nHD-1))/2*1000)-1));
                DelayCommand(1.0, SetXP(oPC, nXP));
*/
                int iAlign = d2();

                if (iAlign == 1)
                {
                    AdjustAlignment(oPC, ALIGNMENT_GOOD, 100, FALSE);

                    FloatingTextStringOnCreature("<cþf > WARNING!  You were given"
                    + " a random alignment(Good) because you do not have a Druid Class"
                    + " Level to take Neutral alignment!.  Use !chat commands.  Read your journal.", oPC, FALSE);

                    SendMessageToAllDMs(sName + "<cþf > is attempted to levelup without a Good/Evil Alignment."
                    + " Player was give a random alignment: Good.</c>");
                }

                else if (iAlign == 2)
                {
                    AdjustAlignment(oPC, ALIGNMENT_EVIL, 100, FALSE);

                    FloatingTextStringOnCreature("<cþf > WARNING!  You were given"
                    + " a random alignment (Evil) because you do not have a Druid Class"
                    + " Level to take Neutral alignment!.  Use !chat commands.  Read your journal.", oPC, FALSE);

                    SendMessageToAllDMs(sName + "<cþf > is attempted to levelup without a Good/Evil Alignment."
                    + " Player was give a random alignment: Good.</c>");
                }
            }
        }
    }
    //  Reapply Haste and bounty flag, heal all HP then export .bic file and
    //  send a Shout message of the level up with a Discord message.
    ApplyHaste(oPC);
    ForceRest(oPC);
    ExportSingleCharacter(oPC);
    ExecuteScript("ws_saveall_sub", oPC);
    ApplyBountyFlag(oPC);
    ACN_SubRace_OnLevel(oPC);
    FloatingTextStringOnCreature("<c ó >Character Saved</c>", oPC, FALSE);

    //  Special VFX effects at level up milestones
    switch(iLevel)
    {
        case 5: case 10: case 15: case 20: case 25: case 30: case 35: case 40:
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_WAIL_O_BANSHEES), oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC);
            DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_10), oPC));
            DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_20), oPC));
            DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_30), oPC));

            string sWebhookUrl = sDiscordHook;
            string CurrentTime = NWNX_Time_GetSystemTime();
            string CurrentDate = NWNX_Time_GetSystemDate();
            string sMessage = sName + " has advanced to level " + sLevel;
            SpeakString(sMessage, TALKVOLUME_SHOUT);
            NWNX_WebHook_SendWebHookHTTPS("discordapp.com", sWebhookUrl , sMessage , "Server");
    }

    //  VFX effects at level up based on alignment
    int nAlign = GetAlignmentGoodEvil(oPC);
    switch (nAlign)
    {
        case ALIGNMENT_EVIL:
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_10), oPC));
        DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_20), oPC));
        DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_30), oPC));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC);
        break;

        case ALIGNMENT_GOOD:
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_10), oPC));
        DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_20), oPC));
        DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_30), oPC));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC);
        break;
    }
}

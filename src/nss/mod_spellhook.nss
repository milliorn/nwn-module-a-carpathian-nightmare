//:://////////////////////////////////////////////
/*
     Spell hooking script to stop casting
     of spells/scrolls in certain areas.

     Additions by Milliorn
*/
//:://////////////////////////////////////////////

#include "x2_inc_switches"
#include "nwnx_creature"

int SummonCheck(object oCaster, int nID)
{
        if(nID == SPELL_ANIMATE_DEAD ||
           nID == SPELL_CONTROL_UNDEAD ||
           nID == SPELL_CREATE_GREATER_UNDEAD ||
           nID == SPELL_CREATE_UNDEAD ||
           nID == SPELL_EPIC_DRAGON_KNIGHT ||
           nID == SPELL_EPIC_MUMMY_DUST ||
           nID == SPELL_GATE ||
           nID == SPELL_GREATER_SHADOW_CONJURATION_SUMMON_SHADOW ||
           nID == SPELL_GREATER_PLANAR_BINDING ||
           nID == SPELL_LESSER_PLANAR_BINDING ||
           nID == SPELL_ELEMENTAL_SWARM ||
           nID == SPELL_ELEMENTAL_SUMMONING_ITEM ||
           nID == SPELL_GREATER_PLANAR_BINDING ||
           nID == SPELL_MORDENKAINENS_SWORD ||
           nID == SPELL_PLANAR_ALLY ||
           nID == SPELL_PLANAR_BINDING ||
           nID == SPELL_SHADES_SUMMON_SHADOW ||
           nID == SPELL_SHADOW_CONJURATION_SUMMON_SHADOW ||
           nID == SPELL_SHELGARNS_PERSISTENT_BLADE ||
           nID == SPELL_SUMMON_CREATURE_I ||
           nID == SPELL_SUMMON_CREATURE_II ||
           nID == SPELL_SUMMON_CREATURE_III ||
           nID == SPELL_SUMMON_CREATURE_IV ||
           nID == SPELL_SUMMON_CREATURE_IX ||
           nID == SPELL_SUMMON_CREATURE_V ||
           nID == SPELL_SUMMON_CREATURE_VI ||
           nID == SPELL_SUMMON_CREATURE_VII ||
           nID == SPELL_SUMMON_CREATURE_VIII ||
           nID == SPELL_SUMMON_SHADOW ||
           nID == SPELL_BLACK_BLADE_OF_DISASTER)
           return TRUE;
return FALSE;
}

void main()
{
    object oTarget  = GetSpellTargetObject();
    object oFam     = GetAssociate (ASSOCIATE_TYPE_FAMILIAR);
    object oSum     = GetAssociate (ASSOCIATE_TYPE_SUMMONED);
    object oCom     = GetAssociate (ASSOCIATE_TYPE_ANIMALCOMPANION);
    object oCaster  = OBJECT_SELF;
    object oItem    = GetSpellTargetObject();

    location lLocal = GetSpellTargetLocation();

    int nID         = GetSpellId();
    string sAoE     = IntToString(nID);
    int nTimer      = GetLocalInt(oCaster, sAoE);
    string sSpell   = IntToString(nID);

    if (nID == SPELL_ACID_SPLASH ||
        nID == SPELL_CURE_MINOR_WOUNDS ||
        nID == SPELL_DAZE ||
        nID == SPELL_ELECTRIC_JOLT ||
        nID == SPELL_FLARE ||
        nID == SPELL_INFLICT_MINOR_WOUNDS ||
        nID == SPELL_LIGHT ||
        nID == SPELL_RAY_OF_FROST ||
        nID == SPELL_RESISTANCE ||
        nID == SPELL_VIRTUE)
    {
        NWNX_Creature_RestoreSpells(oCaster, 0);
    }

    if (GetBaseItemType(oItem) == BASE_ITEM_BLANK_POTION ||
        GetBaseItemType(oItem) == BASE_ITEM_BLANK_SCROLL ||
        GetBaseItemType(oItem) == BASE_ITEM_BLANK_WAND)
    {
        FloatingTextStringOnCreature("Spell used for crafting!!", oCaster, FALSE);
        return;
    }

    if (GetLocalInt(GetArea(oCaster), "NO_CASTING"))
    {
        SetModuleOverrideSpellScriptFinished();
        FloatingTextStringOnCreature("No spellcasting allowed in this area!!", oCaster, FALSE);
        return;
    }

    if (nID == SPELL_ACID_FOG ||
        nID == SPELL_BLADE_BARRIER ||
        nID == SPELL_CLOUD_OF_BEWILDERMENT ||
        nID == SPELL_CLOUDKILL ||
        nID == SPELL_ENTANGLE ||
        nID == SPELL_EVARDS_BLACK_TENTACLES ||
        nID == SPELL_GREASE ||
        nID == SPELL_INCENDIARY_CLOUD ||
        nID == SPELL_STINKING_CLOUD ||
        nID == SPELL_STONEHOLD ||
        nID == SPELL_STORM_OF_VENGEANCE ||
        nID == SPELL_WALL_OF_FIRE ||
        nID == SPELL_WEB)
    {
        oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 1.67,lLocal,FALSE,OBJECT_TYPE_AREA_OF_EFFECT);

        while (GetIsObjectValid(oTarget))
        {
            if(GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
            {
                if(oCaster  == GetAreaOfEffectCreator(oTarget))
                {
                    DestroyObject (oTarget);
                    FloatingTextStringOnCreature("No AoE Spell stacking allowed.  Minimum 2 meter radius.", oCaster, FALSE);
                }
            }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, 1.67,lLocal,FALSE,OBJECT_TYPE_AREA_OF_EFFECT);
        }
        return;
    }

    if ((oTarget == OBJECT_SELF)
    && (!GetIsObjectValid(GetSpellCastItem()))
    && (GetSpellId()!=SPELL_SHAPECHANGE)
    && (GetSpellId()!=SPELL_POLYMORPH_SELF)
    && (!GetIsObjectValid(GetAssociate(ASSOCIATE_TYPE_NONE))))
    {
        AssignCommand(oFam, ActionCastSpellAtObject (nID, oFam, GetMetaMagicFeat(), TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        AssignCommand(oSum, ActionCastSpellAtObject (nID, oSum, GetMetaMagicFeat(), TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        AssignCommand(oCom, ActionCastSpellAtObject (nID, oCom, GetMetaMagicFeat(), TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return;
    }

    if (SummonCheck(oCaster, nID) && GetLocalInt(oCaster, "SUMMONSPAM"))
    {
        SetModuleOverrideSpellScriptFinished();
        FloatingTextStringOnCreature("You can't summon again for 6 seconds to prevent spamming of pulses.", oCaster, FALSE);
        return;
    }

    if (SummonCheck(oCaster, nID) && !GetLocalInt(oCaster, "SUMMONSPAM"))
    {
        SetLocalInt(oCaster, "SUMMONSPAM", TRUE);
        DelayCommand(1.0, SetLocalInt(oCaster, "SUMMONSPAM", FALSE));
    }

//  Evil Blight bypass
    if (nID == 566) return;

//  Quicken Spell bypass
    if (GetMetaMagicFeat() == METAMAGIC_QUICKEN) return;

//  Var check to stop chain casting
    if (GetLocalInt(oCaster, sSpell) == nID)
    {
        SetModuleOverrideSpellScriptFinished();
        FloatingTextStringOnCreature("No SPAMMING SPELLS!", oCaster, FALSE);
        return;
    }

//  Set and Clean a Var to stop an exploit with casting
    SetLocalInt(oCaster, sSpell, nID);
    DelayCommand(0.1, DeleteLocalInt(oCaster, sSpell));
}


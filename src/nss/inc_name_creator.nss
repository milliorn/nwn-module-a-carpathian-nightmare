//::///////////////////////////////////////////////
//:: Random NPC Name Script
//:: inc_name_creator
//:: Copyright (c) 2007 Milliorn
//:: Created By: Milliorn
//:: Created On: January 12, 2007
//:://////////////////////////////////////////////

// Creates Random NPC Name
void RandomNameNPC(object oCreature);
void RandomNameNPC(object oCreature)
{
    if (GetLocalInt(OBJECT_SELF, "DISABLE_RANDOM_NAME") == 1) return;

    switch (GetRacialType(OBJECT_SELF))
    {
        case RACIAL_TYPE_ABERRATION:
        case RACIAL_TYPE_ANIMAL:
        case RACIAL_TYPE_BEAST:
        case RACIAL_TYPE_CONSTRUCT:
        case RACIAL_TYPE_DRAGON:
        case RACIAL_TYPE_ELEMENTAL:
        case RACIAL_TYPE_FEY:
        case RACIAL_TYPE_GIANT:
        case RACIAL_TYPE_HUMANOID_GOBLINOID:
        case RACIAL_TYPE_HUMANOID_MONSTROUS:
        case RACIAL_TYPE_HUMANOID_ORC:
        case RACIAL_TYPE_HUMANOID_REPTILIAN:
        case RACIAL_TYPE_MAGICAL_BEAST:
        case RACIAL_TYPE_OOZE:
        case RACIAL_TYPE_OUTSIDER:
        case RACIAL_TYPE_SHAPECHANGER:
        case RACIAL_TYPE_VERMIN: SetName(OBJECT_SELF, RandomName(NAME_ANIMAL));
        break;
    }

    if (GetRacialType(OBJECT_SELF) == RACIAL_TYPE_UNDEAD)
    {
        SetName(OBJECT_SELF, RandomName(NAME_ANIMAL) + " " + RandomName(NAME_ANIMAL));
        return;
    }

    if (GetGender(OBJECT_SELF) == GENDER_FEMALE)
    {
        switch (GetRacialType(OBJECT_SELF))
        {
            case RACIAL_TYPE_DWARF:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_DWARF_FEMALE) + " " + RandomName(NAME_LAST_DWARF)); break;

            case RACIAL_TYPE_ELF:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_ELF_FEMALE) + " " + RandomName(NAME_LAST_ELF)); break;

            case RACIAL_TYPE_GNOME:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_GNOME_FEMALE) + " " + RandomName(NAME_LAST_GNOME)); break;

            case RACIAL_TYPE_HALFELF:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_HALFELF_FEMALE) + " " + RandomName(NAME_LAST_HALFELF)); break;

            case RACIAL_TYPE_HALFLING:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_HALFLING_FEMALE) + " " + RandomName(NAME_LAST_HALFLING)); break;

            case RACIAL_TYPE_HALFORC:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_HALFORC_FEMALE) + " " + RandomName(NAME_LAST_HALFORC)); break;

            case RACIAL_TYPE_HUMAN:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_HUMAN_FEMALE) + " " + RandomName(NAME_LAST_HUMAN)); break;
        }
    }

    if (GetGender(OBJECT_SELF) == GENDER_MALE)
    {
        switch (GetRacialType(OBJECT_SELF))
        {
            case RACIAL_TYPE_DWARF:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_DWARF_MALE) + " " + RandomName(NAME_LAST_DWARF)); break;

            case RACIAL_TYPE_ELF:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_ELF_MALE) + " " + RandomName(NAME_LAST_ELF)); break;

            case RACIAL_TYPE_GNOME:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_GNOME_MALE) + " " + RandomName(NAME_LAST_GNOME)); break;

            case RACIAL_TYPE_HALFELF:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_HALFELF_MALE) + " " + RandomName(NAME_LAST_HALFELF)); break;

            case RACIAL_TYPE_HALFLING:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_HALFLING_MALE) + " " + RandomName(NAME_LAST_HALFLING)); break;

            case RACIAL_TYPE_HALFORC:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_HALFORC_MALE) + " " + RandomName(NAME_LAST_HALFORC)); break;

            case RACIAL_TYPE_HUMAN:
            SetName(OBJECT_SELF, RandomName(NAME_FIRST_HUMAN_MALE) + " " + RandomName(NAME_LAST_HUMAN)); break;
        }
    }
}

/*void main(){}

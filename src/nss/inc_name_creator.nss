//::///////////////////////////////////////////////
//:: Random NPC Name Script
//:: inc_name_generat
//:: Copyright (c) 2007 Milliorn
//:: Created By: Milliorn
//:: Created On: January 12, 2007
//:://////////////////////////////////////////////

// Creates Random NPC Name
void RandomNameNPC(object oPC);
void RandomNameNPC(object oPC)
{

    if (GetLocalInt(OBJECT_SELF, "DISABLE_RANDOM_NAME") == 1) return;

string   sFname0 = RandomName(NAME_ANIMAL),
         sFname1 = RandomName(NAME_FIRST_DWARF_FEMALE),
         sFname2 = RandomName(NAME_FIRST_DWARF_MALE),
         sFname3 = RandomName(NAME_FIRST_ELF_FEMALE),
         sFname4 = RandomName(NAME_FIRST_ELF_MALE),
         sFname5 = RandomName(NAME_FIRST_GNOME_FEMALE),
         sFname6 = RandomName(NAME_FIRST_GNOME_MALE),
         sFname7 = RandomName(NAME_FIRST_HALFELF_FEMALE),
         sFname8 = RandomName(NAME_FIRST_HALFELF_MALE),
         sFname9 = RandomName(NAME_FIRST_HALFLING_FEMALE),
         sFname10 = RandomName(NAME_FIRST_HALFLING_MALE),
         sFname11 = RandomName(NAME_FIRST_HALFORC_FEMALE),
         sFname12 = RandomName(NAME_FIRST_HALFORC_MALE),
         sFname13 = RandomName(NAME_FIRST_HUMAN_FEMALE),
         sFname14 = RandomName(NAME_FIRST_HUMAN_MALE),
         sLname1 = RandomName(NAME_LAST_DWARF),
         sLname2 = RandomName(NAME_LAST_ELF),
         sLname3 = RandomName(NAME_LAST_GNOME),
         sLname4 = RandomName(NAME_LAST_HALFELF),
         sLname5 = RandomName(NAME_LAST_HALFLING),
         sLname6 = RandomName(NAME_LAST_HALFORC),
         sLname7 = RandomName(NAME_LAST_HUMAN);


    if (GetRacialType(OBJECT_SELF) == RACIAL_TYPE_ABERRATION ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_ANIMAL ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_BEAST ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_CONSTRUCT ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DRAGON ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_ELEMENTAL ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_FEY ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_GIANT ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HUMANOID_GOBLINOID ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HUMANOID_MONSTROUS ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HUMANOID_ORC ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HUMANOID_REPTILIAN ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_MAGICAL_BEAST ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_OOZE ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_OUTSIDER ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_SHAPECHANGER ||
        GetRacialType(OBJECT_SELF) == RACIAL_TYPE_VERMIN)
    {
        SetName(OBJECT_SELF, sFname0 + " " + GetName(OBJECT_SELF, TRUE));
        return;
    }

    else if(GetRacialType(OBJECT_SELF) == RACIAL_TYPE_UNDEAD)
    {
        {
            switch (d8())
            {
                case 1: SetName(OBJECT_SELF, sFname3+" "+sLname2); break;
                case 2: SetName(OBJECT_SELF, sFname4+" "+sLname2); break;
                case 3: SetName(OBJECT_SELF, sFname7+" "+sLname4); break;
                case 4: SetName(OBJECT_SELF, sFname8+" "+sLname4); break;
                case 5: SetName(OBJECT_SELF, sFname11+" "+sLname6); break;
                case 6: SetName(OBJECT_SELF, sFname12+" "+sLname6); break;
                case 7: SetName(OBJECT_SELF, sFname13+" "+sLname7); break;
                case 8: SetName(OBJECT_SELF, sFname14+" "+sLname7); break;
            }
        }
    }
        else
        {
            if(GetGender(OBJECT_SELF) == GENDER_FEMALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DWARF)
            {
                SetName(OBJECT_SELF, sFname1+" "+sLname1);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_MALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DWARF)
            {
                SetName(OBJECT_SELF, sFname2+" "+sLname1);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_FEMALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_ELF)
            {
                SetName(OBJECT_SELF, sFname3+" "+sLname2);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_MALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_ELF)
            {
                SetName(OBJECT_SELF, sFname4+" "+sLname2);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_FEMALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_GNOME)
            {
                SetName(OBJECT_SELF, sFname5+" "+sLname3);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_MALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_GNOME)
            {
                 SetName(OBJECT_SELF, sFname6+" "+sLname3);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_FEMALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HALFELF)
            {
                SetName(OBJECT_SELF, sFname7+" "+sLname4);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_MALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HALFELF)
            {
                SetName(OBJECT_SELF, sFname8+" "+sLname4);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_FEMALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HALFLING)
            {
                SetName(OBJECT_SELF, sFname9+" "+sLname5);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_MALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HALFLING)
            {
                SetName(OBJECT_SELF, sFname10+" "+sLname5);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_FEMALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HALFORC)
            {
                SetName(OBJECT_SELF, sFname11+" "+sLname6);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_MALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HALFORC)
            {
                SetName(OBJECT_SELF, sFname12+" "+sLname6);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_FEMALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HUMAN)
            {
                SetName(OBJECT_SELF, sFname13+" "+sLname7);return;
            }

            else if(GetGender(OBJECT_SELF) == GENDER_MALE &&
            GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HUMAN)
            {
                SetName(OBJECT_SELF, sFname14+" "+sLname7);return;
            }

        }
}
/*void main(){}

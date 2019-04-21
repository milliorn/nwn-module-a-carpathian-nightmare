#include "dm_inc_forge"
int StartingConditional()
{
    if(LIMIT_SPELL_LEVEL)
    {
        return GetHitDice(GetPCSpeaker()) >= 4;
    }
    else
        return TRUE;
}

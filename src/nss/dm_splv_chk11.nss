#include "dm_inc_forge"
int StartingConditional()
{
    if(LIMIT_SPELL_LEVEL)
    {
        return GetHitDice(GetPCSpeaker()) >= 8;
    }
    else
        return TRUE;
}

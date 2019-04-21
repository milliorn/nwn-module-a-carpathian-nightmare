#include "zdlg_include_i"
#include "hgll_func_inc"
const string THIRD_PAGE = "feat_select";
void main()
{
int nFeat;
int nCount2;
object oPC = OBJECT_SELF;
for(nFeat = 700; nFeat < 800; nFeat++)//loop through the feat constants
                    {
                    if (GetIsFeatAvailable(nFeat, oPC))//if the PC can take the feat, it is displayed
                        {
                        nCount2 = AddStringElement(GetNameOfFeat(nFeat), THIRD_PAGE, oPC );
                        ReplaceIntElement(nCount2 - 1, nFeat, THIRD_PAGE, oPC);//store the skill int with the skill
                        //DoDebug(oPC, "Response Number: " + IntToString(nCount2) + ", Feat Number: " + IntToString(nFeat) + ".");
                        }
                    }
}

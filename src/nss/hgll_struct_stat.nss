// Original script taken from post by CID-78 in the Bioware scripting forums.
// Modified to return 'base' skills as well, though they must be passed through
// another filter for feats and stat bonuses after this function.
struct xAbility
{
    int nSTR; //stats in 2da order
    int nDEX;
    int nCON;
    int nINT;
    int nWIS;
    int nCHA;
    int nANIMAL_EMPATHY;//skills in 2da order
    int nCONCENTRATION;
    int nDISABLE_TRAP;
    int nDISCIPLINE;
    int nHEAL;
    int nHIDE;
    int nLISTEN;
    int nLORE;
    int nMOVE_SILENTLY;
    int nOPEN_LOCK;
    int nPARRY;
    int nPERFORM;
    int nPERSUADE;
    int nPICK_POCKET;
    int nSEARCH;
    int nSET_TRAP;
    int nSPELLCRAFT;
    int nSPOT;
    int nTAUNT;
    int nUSE_MAGIC_DEVICE;
    int nAPPRAISE;
    int nTUMBLE;
    int nCRAFT_TRAP;
    int nBLUFF;
    int nINTIMIDATE;
    int nCRAFT_ARMOR;
    int nCRAFT_WEAPON;
    int nRIDE;
};

/*void main (){}

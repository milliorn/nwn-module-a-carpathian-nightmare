#include "nwnx_redis"
#include "nwnx_time"

void SaveRedis() {
  NWNX_Redis_BGSAVE();
  int nTime = NWNX_Time_GetTimeStamp();
  string sTime = IntToString(nTime);
  string sMessage = "Redis is saving : "+ sTime;
  // Log(sMessage,"1");
}

void MasterSave() {
  object oPC = GetFirstPC();
  while(GetIsObjectValid(oPC)) {
      ExportSingleCharacter(oPC);
      oPC = GetNextPC();
  }
  SaveRedis();
}

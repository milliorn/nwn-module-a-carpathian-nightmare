void main()
{
    int iCode = GetLocalInt(OBJECT_SELF,"MODCODE");
    int nNew = iCode + 4;
    SetLocalInt(OBJECT_SELF,"MODCODE",nNew);
}

void main()
{
    int iCode = GetLocalInt(OBJECT_SELF,"MODCODE");
    int nNew = iCode + 2;
    SetLocalInt(OBJECT_SELF,"MODCODE",nNew);
}

void main()
{
    int iCode = GetLocalInt(OBJECT_SELF,"MODCODE");
    int nNew = iCode + 66;
    SetLocalInt(OBJECT_SELF,"MODCODE",nNew);
}

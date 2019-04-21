void main()
{
    object oStore = GetNearestObjectByTag("MetalDyeMerchant");
    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
    {
        OpenStore(oStore, GetPCSpeaker());
    }
}

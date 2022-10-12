public class Products extends fflib_SObjectDomain implements IProductDomain{
    @TestVisible
    private static fflib_ISObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {
        Product2.SObjectType
    });
    public Products(List<Product2> sObjectList) {
        super(sObjectList);
    }
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Products(sObjectList);
        }
    }
    public void updateProductQuantity(Map<Id,Integer> updateProduct){
        for(Product2 pro:(List<Product2>)records){
            Integer unit=updateProduct.get(pro.Id);
            pro.Quantity__c=pro.Quantity__c-unit;
            uow.registerDirty(pro);
        }
        uow.commitWork();
    }
}

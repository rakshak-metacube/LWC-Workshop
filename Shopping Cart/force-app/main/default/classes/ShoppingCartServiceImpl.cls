public class ShoppingCartServiceImpl implements IShoppingCartService{
    @TestVisible
    private static PurchaseOrderSelector pos=new PurchaseOrderSelector();
    @TestVisible
    private static ProductSelector ps=new ProductSelector();
    @TestVisible 
    private static fflib_ISObjectUnitOfWork uow1 = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {
        Purchase_Order__c.SObjectType
    });
    @TestVisible 
    private static fflib_ISObjectUnitOfWork uow2 = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] {
        Purchase_Order_Line_Item__c.SObjectType
    });
    public List<Purchase_Order__c> getPurchaseHistory(){
        return pos.getAllPurchaseOrder();
    }
    public List<Product2> getAllProduct(){
        return ps.getAllProduct();
    }
    
    public List<Product2> selectById(List<ID> idSet){
        return ps.selectById(idSet);
    }
    public void saveOrder(List<Object> orders){
        system.debug('saveorder');
    }
    public Id insertPurchase(Integer total){
        Purchase_Order__c po=new Purchase_Order__c(Status__c='Processing',Order_Date__c=Date.today(),Order_Total__c=total);
        uow1.registerNew(po);
        uow1.commitWork();
        return po.Id;
    }
    public void insertPurchaseLineItem(Id purchaseId,List< Map<String,Object> > productItem){
        for(Map<String,Object> li:productItem){
            uow2.registerNew(new Purchase_Order_Line_Item__c(Products__c=(Id)li.get('Id'),Purchase_Order__c=purchaseId,Unit__c=(Integer)li.get('Unit')));
        }
        uow2.commitWork();
    }
}

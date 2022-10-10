public class ShoppingCartServiceImpl implements IShoppingCartService{
    public List<Purchase_Order__c> getPurchaseHistory(){
        return new PurchaseOrderSelector().getAllPurchaseOrder();
    }
    public List<Product2> getAllProduct(){
        return new ProductSelector().getAllProduct();
    }
    public List<Product2> getProductByName(String name){
        return new ProductSelector().getProductByName(name);
    }
    public List<Product2> selectById(List<ID> idSet){
        return new ProductSelector().selectById(idSet);
    }
    public void saveOrder(List<Object> orders){
        system.debug('saveorder');
    }
    public Id insertPurchase(Integer total){
        Purchase_Order__c po=new Purchase_Order__c(Status__c='Processing',Order_Date__c=Date.today(),Order_Total__c=total);
        insert po;
        return po.Id;
    }
    public void insertPurchaseLineItem(Id purchaseId,List< Map<String,Object> > productItem){
        List<Purchase_Order_Line_Item__c> poli=new List< Purchase_Order_Line_Item__c >();
        for(Map<String,Object> li:productItem){
            poli.add(new Purchase_Order_Line_Item__c(Products__c=(Id)li.get('Id'),Purchase_Order__c=purchaseId,Unit__c=(Integer)li.get('Unit')));
        }
        insert poli;
    }
}

public class PurchaseOrderLineItems extends fflib_SObjectDomain {
    @TestVisible
    private static ProductSelector ps=new ProductSelector();

    public PurchaseOrderLineItems(List<Purchase_Order_Line_Item__c> sObjectList) {
        super(sObjectList);
    }
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new PurchaseOrderLineItems(sObjectList);
        }
    }
    public override void onAfterInsert(){
        Map<Id,Integer> productUnit=new Map<Id,Integer>();
        for(Purchase_Order_Line_Item__c li : (List<Purchase_Order_Line_Item__c>) Records) {
            productUnit.put(li.Products__c,(Integer)li.Unit__c);
        }
        List<Product2> product=(List<Product2>)ps.selectSObjectsById(productUnit.keySet());
        Products prod=new Products(product);
        prod.updateProductQuantity(productUnit);
    }
}

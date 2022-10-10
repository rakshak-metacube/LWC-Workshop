public class PurchaseOrderSelector extends fflib_SObjectSelector implements IPurchaseOrderSelector {
    public Schema.SObjectType getSObjectType() {
        return Purchase_Order__c.sObjectType;
    }
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Purchase_Order__c.Id,
            Purchase_Order__c.Status__c,
            Purchase_Order__c.Order_Total__c
            };
    }
    public List<Purchase_Order__c> getAllPurchaseOrder(){
        return [SELECT Id,Status__c,Order_Total__c FROM Purchase_Order__c];
    }

}

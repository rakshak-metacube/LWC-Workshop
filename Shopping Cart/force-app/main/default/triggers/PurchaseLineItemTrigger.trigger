trigger PurchaseLineItemTrigger on Purchase_Order_Line_Item__c (after insert) {
    fflib_SObjectDomain.triggerHandler(PurchaseOrderLineItems.class);
}
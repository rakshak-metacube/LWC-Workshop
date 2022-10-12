@isTest
class PurchaseOrderLineItemsTest {
    @isTest
    static void testOnAfterInsert(){
        //Given
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        mocks.startStubbing();
        Product2 prod = new Product2(Id=fflib_IDGenerator.generate(Product2.SObjectType),Name='Iphone',ProductCode='I123',Price__c=1000,Quantity__C=10);
        Purchase_Order__C po = new Purchase_Order__C(Id = fflib_IDGenerator.generate(Purchase_Order__C.SObjectType),Status__c='Processing',Order_Date__c=Date.today(),Order_Total__c=1000);
        List<Purchase_Order_Line_Item__c> poli = new List<Purchase_Order_Line_Item__c>{new Purchase_Order_Line_Item__c(Id=fflib_IDGenerator.generate(Purchase_Order_Line_Item__c.SObjectType),Products__c=prod.Id,Purchase_Order__C=po.Id,Unit__c=1)};
        ProductSelector productSelectorMock = (ProductSelector) mocks.mock(ProductSelector.class);
        PurchaseOrderLineItems.ps = productSelectorMock;
        mocks.when(productSelectorMock.selectSObjectsById(new Set<Id>{prod.Id})).thenReturn(new List<Product2>{prod});
        Products.uow = new UnitOFWorkMock();
        mocks.stopStubbing();
        //when
        new PurchaseOrderLineItems(poli).onAfterInsert();
        //then
        system.assertEquals(1, UnitOFWorkMock.registerDirtyCount,'Test Count of Register Dirty');
        system.assertEquals(1, UnitOFWorkMock.commitCount,'Test Count of Commit');

    }
}
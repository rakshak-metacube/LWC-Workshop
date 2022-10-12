@isTest
class PurchaseOrderSelectorTest {

    @isTest

    static void testGetAllPurchaseOrder(){

        //Given
        List<Purchase_Order__C> poList=new List<Purchase_Order__C>();
        for(Integer i=1;i<=10;i++){
            Purchase_Order__C po=new Purchase_Order__C(Order_Date__c=Date.today(),Order_Total__c=100);
            poList.add(po);
        }
        insert poList;
        List<Purchase_Order__C> pos;

        //When
        test.startTest();
            pos=new PurchaseOrderSelector().getAllPurchaseOrder();
        test.stopTest();

        //Then
        System.assertEquals(10, pos.size(),'Get All Purchase Order History');
    }
    @isTest
    static void getSObjectFieldList(){
        system.assertEquals(3, new PurchaseOrderSelector().getSObjectFieldList().size(),'Return the list of field');
    }

    @isTest
    static void getSObjectType(){
        system.assertEquals(Purchase_Order__C.sObjectType, new PurchaseOrderSelector().getSObjectType(),'Return the Type of Object');
    }
}

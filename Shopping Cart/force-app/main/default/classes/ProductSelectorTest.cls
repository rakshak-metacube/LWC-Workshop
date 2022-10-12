@isTest

class ProductSelectorTest {

    @isTest
    static void testGetAllProduct(){
        //Given
        List<Product2> prodData=new List<Product2>();
        for(Integer i=1;i<=10;i++){
            prodData.add(new Product2(Name ='Product '+i,ProductCode='Prod1'+i,Price__c=10*i,Quantity__c=i*i));
        }
        insert prodData;
        List<Product2> products;
        //When
        test.startTest();
            products = new ProductSelector().getAllProduct();
        test.stopTest();
        //Then
        System.assertEquals(10, products.size(),'Get All Products');

    }

    @isTest
    static void testSelectById(){
        //Given
        List<Product2> prodData=new List<Product2>();
        List<Id> ids=new List<Id>();
        for(Integer i=1;i<=10;i++){
            prodData.add(new Product2(Name ='Product '+i,ProductCode='Prod1'+i,Price__c=10*i,Quantity__c=i*i));
        }
        insert prodData;
        for(Product2 pro:prodData){
            ids.add(pro.id);
        }

        //When
        test.startTest();
            prodData=new ProductSelector().selectById(ids);
        test.stopTest();

        //Then
        system.assertEquals(10, prodData.size(),'Get Products belong to Ids');

    }
    @isTest
    static void getSObjectFieldList(){
        system.assertEquals(5, new ProductSelector().getSObjectFieldList().size(),'Return the list of field');
    }

    @isTest
    static void getSObjectType(){
        system.assertEquals(Product2.sObjectType, new ProductSelector().getSObjectType(),'Return the Type of Object');
    }
}

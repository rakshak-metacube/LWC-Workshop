@isTest
class ProductsTest {
    @isTest
    static void testUpdateProductQuantity(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();

        //Given
        mocks.startStubbing();
        List<Product2> prods = new List<Product2>{new Product2(Id=fflib_IDGenerator.generate(Product2.SObjectType),Name='Iphone',ProductCode='I123',Price__c=100000,Quantity__C=10)};
        //fflib_ISObjectUnitOfWork uowMock = new fflib_SObjectMocks.SObjectUnitOfWork(mocks);
        fflib_ISObjectUnitOfWork uowMock=new UnitOFWorkMock();
        Products.uow=uowMock;
        Map<Id,Integer> productCount = new Map<Id,Integer>();
        productCount.put(prods[0].Id,3);

        //When
        Products pro = new Products(prods);
        test.startTest();
            pro.updateProductQuantity(productCount);
        test.stopTest();

        //then
        System.assertEquals(7, prods[0].Quantity__c,'Test change in Quantity');
        System.assertEquals(1, UnitOFWorkMock.registerDirtyCount,'Check register Dirty Count');
        System.assertEquals(1, UnitOFWorkMock.commitCount,'Check Commit Count');
    }
}

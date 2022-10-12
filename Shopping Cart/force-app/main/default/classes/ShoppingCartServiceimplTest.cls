@isTest
class ShoppingCartServiceimplTest {
    @isTest
    static void testGetAllProduct(){
        //Given
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        mocks.startStubbing();
        List<Product2> prodData = new List<Product2>();
        for(Integer i=1;i<=10;i++){
            prodData.add(new Product2(Id = fflib_IDGenerator.generate(Product2.SObjectType),Name = 'Product '+i,ProductCode = 'Prod1'+i,Price__c = 10*i,Quantity__c = i*i));
        }
        ProductSelector productSelectorMock=(ProductSelector) mocks.mock(ProductSelector.class);
        ShoppingCartServiceImpl.ps = productSelectorMock;
        mocks.when(productSelectorMock.getAllProduct()).thenReturn(prodData);
        mocks.stopStubbing();
        List<Product2> proList;
        //When
        test.startTest();
            proList = new ShoppingCartServiceImpl().getAllProduct();
        test.stopTest();

        //Then
        System.assertEquals(10, proList.size(),'Product Recieve from getAllProduct');
    }

    @isTest
    static void testSelectById(){
          //Given
          fflib_ApexMocks mocks = new fflib_ApexMocks();
          mocks.startStubbing();
          List<Product2> prods = new List<Product2>{new Product2(Id=fflib_IDGenerator.generate(Product2.SObjectType),Name='Iphone',ProductCode='I123',Price__c=100000,Quantity__C=10)};
          Set<Id> testProductSetIds = new Map<Id, Product2>(prods).keySet();
          List<Id> testProductIds = new List<Id>();
          testProductIds.addAll(testProductSetIds);
          ProductSelector productSelectorMock=(ProductSelector) mocks.mock(ProductSelector.class);
          ShoppingCartServiceImpl.ps = productSelectorMock;
          mocks.when(productSelectorMock.selectById(testProductIds)).thenReturn(prods);
          mocks.stopStubbing();
          List<Product2> proList;
          //when
          test.startTest();
            proList=new ShoppingCartServiceImpl().selectById(testProductIds);
          test.stopTest();

          //then
          System.assertEquals(1, proList.size(),'Recieve Product By Ids');
         

    }

    @isTest
    static void testInsertPurchase(){
        //Given
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        fflib_ISObjectUnitOfWork uowMock = new UnitOFWorkMock();
        ShoppingCartServiceImpl.uow1=uowMock;
        Purchase_Order__C po = new Purchase_Order__C(Id = fflib_IDGenerator.generate(Purchase_Order__C.SObjectType),Status__c='Processing',Order_Date__c=Date.today(),Order_Total__c=1000);
        Id i;
        //when
        test.startTest();
        i = new ShoppingCartServiceImpl().insertPurchase(100);
        test.stopTest();
        //then
        System.assertEquals(1, UnitOFWorkMock.registerNewCount,'Check registerNew count');
        System.assertEquals(1, UnitOFWorkMock.commitCount,'Check commitwork count');
    }

    @isTest
    static void testInsertPurchaseLineItem(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        fflib_ISObjectUnitOfWork uowMock = new UnitOFWorkMock();
        ShoppingCartServiceImpl.uow2=uowMock;
        //Given
        Product2 prod = new Product2(Id=fflib_IDGenerator.generate(Product2.SObjectType),Name='Iphone',ProductCode='I123',Price__c=1000,Quantity__C=10);
        Purchase_Order__C po = new Purchase_Order__C(Id=fflib_IDGenerator.generate(Purchase_Order__C.SObjectType),Status__c='Processing',Order_Date__c=Date.today(),Order_Total__c=1000);
        List< Map<String,Object> > productItem = new List<Map<String,Object> >();
        Map<String,Object> lineItems = new Map<String,Object>();
        lineItems.put('Id', prod.Id);
        lineItems.put('Unit',1);
        productItem.add(lineItems);
        //When
        test.startTest();
            new ShoppingCartServiceImpl().insertPurchaseLineItem(po.Id, productItem);
        test.stopTest();
        //Then
        System.assertEquals(1, UnitOFWorkMock.registerNewCount,'Check registerNew count');
        System.assertEquals(1, UnitOFWorkMock.commitCount,'Check commitwork count');
    }

    @isTest
    static void testPurchaseOrder(){

        //Given
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        mocks.startStubbing();
        Purchase_Order__C po = new Purchase_Order__C(Order_Date__c=Date.today(),Order_Total__c=100);
        PurchaseOrderSelector purchaseOrderSelectorMock = (PurchaseOrderSelector) mocks.mock(PurchaseOrderSelector.class);
        ShoppingCartServiceImpl.pos = purchaseOrderSelectorMock;
        mocks.when(purchaseOrderSelectorMock.getAllPurchaseOrder()).thenReturn(new List<Purchase_Order__C>{po});
        mocks.stopStubbing();

        List<Purchase_Order__C> poList;
        test.startTest();
            poList=new ShoppingCartServiceImpl().getPurchaseHistory();
        test.stopTest();

        //Then
        system.assertEquals(1, poList.size(),'Get All Purchase History Data');
    }


}

public interface IShoppingCartService {
    List<Purchase_Order__c> getPurchaseHistory();
    List<Product2> getAllProduct();
    List<Product2> selectById(List<ID> idSet);
    Id insertPurchase(Integer total);
    void insertPurchaseLineItem(Id purchaseId,List< Map<String,Object> > productItem);
} 
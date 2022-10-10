public  interface IProductSelector {
    List<Product2> getAllProduct();
    List<Product2> getProductByName(String name);
    List<Product2> selectById(List<ID> idSet);
}

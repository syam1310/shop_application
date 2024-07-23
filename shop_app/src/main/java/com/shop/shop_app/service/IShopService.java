package com.shop.shop_app.service;

import com.shop.shop_app.entity.Product;

import java.util.List;

public interface IShopService {
    List<Product> fetchAllProduct();
    Product fetchProductById(int id);
    boolean saveProduct(Product product);

    List<Product> fetchProductByType(String type);

    List<String> fetchDistinctTypes();


}

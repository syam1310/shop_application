package com.shop.shop_app.service.impl;

import com.shop.shop_app.entity.Product;
import com.shop.shop_app.repository.ProductRepository;
import com.shop.shop_app.service.IShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductServiceImpl implements IShopService {

    private final ProductRepository productRepository;

    @Autowired
    ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    /**
     * @return
     */
    @Override
    public List<Product> fetchAllProduct() {
        List<Product> productsList = new ArrayList<>();
        Iterable<Product> products = productRepository.findAll();
        products.forEach(productsList::add);
        return productsList;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public Product fetchProductById(int id) {
        return productRepository.findById(id).get();
    }

    /**
     * @param product
     * @return
     */
    @Override
    public boolean saveProduct(Product product) {
        Product product1 = productRepository.save(product);
        if (product1 != null && product1.getId() > 0) {
            return true;
        }
        return false;
    }

    /**
     * @param type
     * @return
     */
    @Override
    public List<Product> fetchProductByType(String type) {
        return productRepository.findByType(type);
    }

    /**
     * @return
     */
    @Override
    public List<String> fetchDistinctTypes() {
        return productRepository.findDistinctTypes();
    }


}

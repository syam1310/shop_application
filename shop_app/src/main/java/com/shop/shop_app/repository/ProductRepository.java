package com.shop.shop_app.repository;

import com.shop.shop_app.entity.Product;
import com.shop.shop_app.repository.impl.interf.ProductRepositoryCustom;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer>, ProductRepositoryCustom {
    List<Product> findByType(String type);


}

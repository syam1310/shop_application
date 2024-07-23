package com.shop.shop_app.repository.impl;

import com.shop.shop_app.repository.impl.interf.ProductRepositoryCustom;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class ProductRepositoryImpl implements ProductRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<String> findDistinctTypes() {
        return entityManager.createNativeQuery("select distinct type from shop.product")
                .getResultList();
    }
}


package com.flyout.service;

import com.flyout.dao.ProductDaoImpl;
import com.flyout.domain.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/15 9:46.
 * description:
 */
@Service
public class ProductServiceImpl {
    @Autowired
    private ProductDaoImpl productDao;

    public List<Product> getRecommend() {
        return productDao.getRecommendProduct();
    }

    public List<Product> query(String name) {
        return productDao.query(name);
    }
}

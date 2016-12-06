package com.flyout.service;

import com.flyout.common.enums.CategoryEnum;
import com.flyout.dao.ProductDaoImpl;
import com.flyout.domain.Product;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/15 9:46.
 * description:
 */
@Service
public class ProductServiceImpl {
    @Resource
    private ProductDaoImpl productDao;

    public List<Product> getRecommend(CategoryEnum category, Integer limit) {
        return productDao.getRecommendProduct(category, limit);
    }

    public List<Product> query(String name) {
        return productDao.query(name);
    }
}

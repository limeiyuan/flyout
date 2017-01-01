package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.common.enums.CategoryEnum;
import com.flyout.common.enums.EnableEnum;
import com.flyout.common.util.AliasToBeanNestedResultTransformer;
import com.flyout.domain.Product;
import org.hibernate.criterion.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/15 9:38.
 * description:
 */
@Repository
public class ProductDaoImpl extends BaseHibernateDao<Product, Long> {
    public List<Product> getRecommendProduct(CategoryEnum category, Integer limit) {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        if (category != null) {
            dc.add(Restrictions.eq("category", category));
        }
        dc.addOrder(Order.desc("topFlag"));
        dc.addOrder(Order.asc("topOrder"));
        dc.addOrder(Order.desc("score"));
        dc.addOrder(Order.desc("createTime"));
        if (limit != null && limit > 0) {
            dc.getExecutableCriteria(getSession()).setMaxResults(limit);
        }
        dc.setProjection(Projections.projectionList()
                .add(Projections.property("id"), "id")
                .add(Projections.property("title"), "title")
                .add(Projections.property("favoriteNum"), "favoriteNum")
                .add(Projections.property("photo.path"), "photo.path")
                .add(Projections.property("vender.venderName"), "vender.venderName")
                .add(Projections.property("vender.photo"), "vender.photo")
        );
        dc.createAlias("photo", "photo");
        dc.createAlias("vender", "vender");
        dc.setResultTransformer(new AliasToBeanNestedResultTransformer(Product.class));
        return dc.getExecutableCriteria(getSession()).list();
    }

    public List<Product> query(String name) {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        dc.add(Restrictions.like("title", name, MatchMode.ANYWHERE));
        dc.addOrder(Order.desc("topFlag"));
        dc.addOrder(Order.desc("topOrder"));
        return query(dc);
    }
}

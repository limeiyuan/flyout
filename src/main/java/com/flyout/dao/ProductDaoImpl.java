package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.common.enums.EnableEnum;
import com.flyout.domain.Product;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/15 9:38.
 * description:
 */
@Repository
public class ProductDaoImpl extends BaseHibernateDao<Product, Long> {
    public List<Product> getRecommendProduct() {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        dc.addOrder(Order.desc("topFlag"));
        dc.addOrder(Order.desc("topOrder"));
        return query(dc);
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

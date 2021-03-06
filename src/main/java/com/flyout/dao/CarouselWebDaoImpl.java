package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.common.enums.EnableEnum;
import com.flyout.domain.CarouselWeb;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2017/1/1.
 * Description:
 */
@Repository
public class CarouselWebDaoImpl extends BaseHibernateDao<CarouselWeb, Long> {
    public List<CarouselWeb> getCarousels(Integer limit) {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        dc.addOrder(Order.asc("order"));
        if (limit != null && limit != 0) {
            dc.getExecutableCriteria(getSession()).setMaxResults(limit);
        }
        return query(dc);
    }
}

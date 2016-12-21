package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.common.enums.BlogCategoryEnum;
import com.flyout.common.enums.EnableEnum;
import com.flyout.domain.Blog;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/12/21.
 * Description:
 */
@Repository
public class BlogDaoImpl extends BaseHibernateDao<Blog, Long> {
    public List<Blog> list(Integer limit, BlogCategoryEnum category) {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        dc.addOrder(Order.asc("order"));
        if (category != null) {
            dc.add(Restrictions.eq("category", category));
        }
        if (limit != null && limit != 0) {
            dc.getExecutableCriteria(getSession()).setMaxResults(limit);
        }
        return query(dc);
    }
}

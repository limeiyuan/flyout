package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.common.enums.EnableEnum;
import com.flyout.common.hibernate.PropertyFilter;
import com.flyout.domain.SchoolInfo;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/9 21:27.
 * description:
 */
@Repository
public class SchoolDaoImpl extends BaseHibernateDao<SchoolInfo, Long> {
    public List<SchoolInfo> query(List<PropertyFilter> filters) {
        DetachedCriteria dc = createDetachedCriteria();
        return query(dc, filters);
    }

    public List<SchoolInfo> findByName(String name) {
        DetachedCriteria dc = createDetachedCriteria();
        if (StringUtils.isNotEmpty(name)) {
            Criterion nameCri = Restrictions.like("name", name, MatchMode.ANYWHERE);
            Criterion eNameCri = Restrictions.like("ownname", name, MatchMode.ANYWHERE);
            dc.add(Restrictions.or(nameCri, eNameCri));
        }
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        return query(dc);
    }
}

package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.common.enums.EnableEnum;
import com.flyout.common.util.AliasToBeanNestedResultTransformer;
import com.flyout.domain.SuccessCase;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/18 16:57.
 * description:
 */
@Repository
public class SuccessCaseDaoImpl extends BaseHibernateDao<SuccessCase, Long> {
    public List<SuccessCase> list(Integer limit) {
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        dc.createAlias("school", "school", JoinType.LEFT_OUTER_JOIN);
        dc.createAlias("nation", "nation", JoinType.LEFT_OUTER_JOIN);
        dc.createAlias("photo", "photo", JoinType.LEFT_OUTER_JOIN);
        dc.setProjection(Projections.projectionList()
                .add(Projections.property("school.badgePhoto"), "school.badgePhoto")
                .add(Projections.property("school.name"), "school.name")
                .add(Projections.property("school.id"), "school.id")
                .add(Projections.property("nation.id"), "nation.id")
                .add(Projections.property("nation.name"), "nation.name")
                .add(Projections.property("photo.path"), "photo.path")
                .add(Projections.property("degree"), "degree")
                .add(Projections.property("major"), "major")
                .add(Projections.property("destMajor"), "destMajor")
                .add(Projections.property("destDegree"), "destDegree")
                .add(Projections.property("gpa"), "gpa")
                .add(Projections.property("graduateSchool"), "graduateSchool")
                .add(Projections.property("order"), "order")
                .add(Projections.property("description"), "description")
                .add(Projections.property("id"), "id")
                .add(Projections.property("name"), "name"))
                .setResultTransformer(new AliasToBeanNestedResultTransformer(SuccessCase.class));

        dc.addOrder(Order.asc("order"));
        if (limit != null && limit > 0) {
            dc.getExecutableCriteria(getSession()).setMaxResults(limit);
        }
        return query(dc);
    }
}

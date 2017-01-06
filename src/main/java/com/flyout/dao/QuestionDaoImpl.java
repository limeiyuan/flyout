package com.flyout.dao;

import com.flyout.common.dao.BaseHibernateDao;
import com.flyout.common.enums.EnableEnum;
import com.flyout.common.util.AliasToBeanNestedResultTransformer;
import com.flyout.domain.Question;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LiMeiyuan on 2017/1/5.
 * Description:
 */
@Repository
public class QuestionDaoImpl extends BaseHibernateDao<Question, Long> {
    public List<Question> getRecommend(Integer limit){
        DetachedCriteria dc = createDetachedCriteria();
        dc.add(Restrictions.eq("enable", EnableEnum.enable));
        dc.createAlias("account", "account", JoinType.LEFT_OUTER_JOIN);
        dc.setProjection(Projections.projectionList()
                .add(Projections.property("account.screenname"), "account.screenname")
                .add(Projections.property("account.id"), "account.id")
                .add(Projections.property("order"), "order")
                .add(Projections.property("content"), "content")
                .add(Projections.property("createTime"), "createTime")
                .add(Projections.property("id"), "id"))
                .setResultTransformer(new AliasToBeanNestedResultTransformer(Question.class));

        dc.addOrder(Order.asc("order"));
        dc.addOrder(Order.desc("id"));
        if (limit != null && limit > 0) {
            dc.getExecutableCriteria(getSession()).setMaxResults(limit);
        }
        return query(dc);
    }
}

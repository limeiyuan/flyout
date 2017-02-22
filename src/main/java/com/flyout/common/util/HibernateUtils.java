package com.flyout.common.util;

import com.flyout.common.hibernate.MatchType;
import com.flyout.common.hibernate.PropertyFilter;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.*;
import org.hibernate.internal.CriteriaImpl;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by LiMeiyuan on 2017/1/13.
 * Description:
 */
public class HibernateUtils {

    /**
     * protected constructor.
     */
    protected HibernateUtils() {
    }

    /**
     * get number for count.
     *
     * @param result Object
     * @return Integer
     */
    public static Integer getNumber(Object result) {
        if (result == null) {
            return 0;
        } else {
            return ((Number) result).intValue();
        }
    }

    /**
     * 去除hql的select 子句，未考虑union的情况,用于pagedQuery.
     *
     * @param hql HQL字符串
     * @return 删除select语句后的字符串
     */
    public static String removeSelect(String hql) {
        Assert.hasText(hql);
//        if (hql.toLowerCase(Locale.ENGLISH).indexOf("distinct") != -1) {
//        }
        int beginPos = hql.toLowerCase(Locale.CHINA).indexOf("from");
        Assert.isTrue(beginPos != -1, " hql : " + hql
                + " must has a keyword 'from'");
        return hql.substring(beginPos);
    }

    /**
     * 去除hql的order by 子句，用于pagedQuery.
     *
     * @param hql HQL字符串
     * @return 删除排序语句后的字符串
     */
    public static String removeOrders(String hql) {
        Assert.hasText(hql);

        Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*",
                Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(hql);
        StringBuffer sb = new StringBuffer();
        while (m.find()) {
            m.appendReplacement(sb, "");
        }
        m.appendTail(sb);
        return sb.toString();
    }

    /**
     * 获取hql的order by 子句，用于pagedQuery.
     *
     * @param hql HQL字符串
     * @return 获取排序语句后的字符串
     */
    public static String getOrders(String hql) {
        Assert.hasText(hql);
        Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*",
                Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(hql);
        if (m.find()) {
            return m.group();
        }
        return "";
    }

    /**
     * 是否有Order语句，用于构建hql，用于pagedQuery.
     *
     * @param hql HQL字符串
     * @return 获取排序语句后的字符串
     */
    public static boolean isOrdered(String hql) {
        Assert.hasText(hql);
        Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*",
                Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(hql);
        return m.find();
    }

    /**
     * distinct.
     *
     * @param query Query
     * @return Query
     */
    public static Query distinct(Query query) {
        query.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        return query;
    }

    /**
     * distinct.
     *
     * @param criteria Criteria
     * @return Criteria
     */
    public static Criteria distinct(Criteria criteria) {
        criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        return criteria;
    }

    /**
     * find projection from criteria.
     *
     * @param criteria Criteria
     * @return Projection
     */
    public static Projection findProjection(Criteria criteria) {
        if (criteria instanceof CriteriaImpl) {
            return ((CriteriaImpl) criteria).getProjection();
        } else {
            throw new IllegalArgumentException(criteria
                    + " is not a CriteriaImpl");
        }
    }

    /**
     * 按属性条件参数创建Criterion,辅助函数.
     *
     * @param propertyName  String
     * @param propertyValue Object
     * @param matchType     MatchType
     * @return Criterion
     */
    @SuppressWarnings("rawtypes")
    public static Criterion buildCriterion(String propertyName,
                                           Object propertyValue, MatchType matchType) {
        Assert.hasText(propertyName, "propertyName不能为空");

        Criterion criterion;
        // 根据MatchType构造criterion
        switch (matchType) {
            case EQ:
                criterion = Restrictions.eq(propertyName, propertyValue);
                break;
            case LIKE:
                // criterion = Restrictions.like(propertyName, (String)
                // propertyValue, MatchMode.ANYWHERE);
                criterion = new CustomLikeExpression(propertyName, escapeSQLLike(propertyValue.toString(), '/'), MatchMode.ANYWHERE, '/', true);
                break;
            case LE:
                criterion = Restrictions.le(propertyName, propertyValue);
                break;
            case LT:
                criterion = Restrictions.lt(propertyName, propertyValue);
                break;
            case GE:
                criterion = Restrictions.ge(propertyName, propertyValue);

                break;
            case GT:
                criterion = Restrictions.gt(propertyName, propertyValue);
                break;
            case IN:
                criterion = Restrictions.in(propertyName, (Collection) propertyValue);
                break;
            case NOT:
                criterion = Restrictions.ne(propertyName, propertyValue);
                break;
            default:
                criterion = Restrictions.eq(propertyName, propertyValue);
                break;
        }

        return criterion;
    }

    // 处理查询特殊字符
    public static String escapeSQLLike(String likeStr, char escapeChar) {
        likeStr = likeStr.replace("" + escapeChar, escapeChar + escapeChar + "")
                .replace("%", escapeChar + "%")
                .replace("_", escapeChar + "_");
        return "%" + likeStr + "%";
    }

    /**
     * 按属性条件列表创建Criterion数组,辅助函数.
     *
     * @param filters List
     * @return Criterion[]
     */
    public static Criterion[] buildCriterion(List<PropertyFilter> filters) {
        List<Criterion> criterionList = new ArrayList<>();
        if (filters != null && filters.size() > 0) {
            for (PropertyFilter filter : filters) {
                // 只有一个属性需要比较的情况.
                if (!filter.hasMultiProperties()) {
                    Criterion criterion = buildCriterion(
                            filter.getPropertyName(), filter.getMatchValue(),
                            filter.getMatchType());
                    criterionList.add(criterion);
                } else {
                    // 包含多个属性需要比较的情况,进行or处理.
                    Disjunction disjunction = Restrictions.disjunction();

                    for (String param : filter.getPropertyNames()) {
                        Criterion criterion = buildCriterion(param,
                                filter.getMatchValue(), filter.getMatchType());
                        disjunction.add(criterion);
                    }
                    criterionList.add(disjunction);
                }
            }
        }
        return criterionList.toArray(new Criterion[criterionList.size()]);
    }

    /**
     * 方法说明：根据查询属性构建查询条件
     *
     * @param buff
     * @param propertyFilter
     * @param tail
     */
    public static void buildQuery(StringBuilder buff,
                                  PropertyFilter propertyFilter, String tail) {
        if (!buff.toString().toLowerCase().contains("where")) {
            buff.append(" where ");
        } else {
            buff.append(" and ");
        }

        buff.append(propertyFilter.getPropertyName());
        switch (propertyFilter.getMatchType()) {
            case EQ:
                buff.append(" =:");
                break;
            case LIKE:
                buff.append(" like:");
                break;
            case LE:
                buff.append(" <=:");
                break;
            case LT:
                buff.append(" <:");
                break;

            case GE:
                buff.append(" >=:");
                break;
            case GT:
                buff.append(" >:");
                break;
            case IN:
                buff.append(" in :");
                break;
            default:
                buff.append(" =:");
                break;
        }

        String name = propertyFilter.getPropertyName().replaceAll("\\.", "_")
                + tail;
        if (MatchType.LIKE == propertyFilter.getMatchType()) {
            buff.append(name + " escape '/' ");
        } else {
            buff.append(name);
        }
    }

    static class CustomLikeExpression extends LikeExpression {
        protected CustomLikeExpression(String propertyName, String value, MatchMode matchMode, Character escapeChar, boolean ignoreCase) {
            super(propertyName, value, matchMode, escapeChar, ignoreCase);
        }
    }
}

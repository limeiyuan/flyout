package com.flyout.common.hibernate;

import org.hibernate.Criteria;
import org.hibernate.NullPrecedence;
import org.hibernate.criterion.CriteriaQuery;
import org.hibernate.criterion.Order;
import org.hibernate.engine.spi.SessionFactoryImplementor;
import org.hibernate.type.Type;

/**
 * Created by LiMeiyuan on 2017/1/13.
 * Description:
 */
public class GBKOrder extends Order {
    private NullPrecedence nullPrecedence;

    protected GBKOrder(String propertyName, boolean ascending) {
        super(propertyName, ascending);
    }

    public static GBKOrder asc(String property) {
        return new GBKOrder(property, true);
    }

    public static GBKOrder desc(String property) {
        return new GBKOrder(property, false);
    }

    @Override
    public Order nulls(NullPrecedence nullPrecedence) {
        this.nullPrecedence = nullPrecedence;
        return super.nulls(nullPrecedence);
    }

    @Override
    public String toSqlString(Criteria criteria, CriteriaQuery criteriaQuery) {
        String[] columns = criteriaQuery.getColumnsUsingProjection(criteria, getPropertyName());
        Type type = criteriaQuery.getTypeUsingProjection(criteria, getPropertyName());
        SessionFactoryImplementor factory = criteriaQuery.getFactory();
        int[] sqlTypes = type.sqlTypes(factory);
        StringBuilder fragment = new StringBuilder();

        for (int i = 0; i < columns.length; ++i) {
            StringBuilder expression = new StringBuilder();
            boolean lower = false;
            if (this.isIgnoreCase()) {
                int sqlType = sqlTypes[i];
                lower = sqlType == 12 || sqlType == 1 || sqlType == -1;
            }

            if (lower) {
                expression.append(factory.getDialect().getLowercaseFunction()).append('(');
            }

            expression.append("CONVERT(").append(columns[i]).append(" USING ").append("GBK)");
            if (lower) {
                expression.append(')');
            }

            fragment.append(factory.getDialect().renderOrderByElement(expression.toString(), null, super.isAscending() ? "asc" : "desc",
                    this.nullPrecedence != null ? this.nullPrecedence : factory.getSettings().getDefaultNullPrecedence()));
            if (i < columns.length - 1) {
                fragment.append(", ");
            }
        }

        return fragment.toString();
    }
}

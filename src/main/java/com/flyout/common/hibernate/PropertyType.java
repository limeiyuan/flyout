package com.flyout.common.hibernate;

import java.util.Date;

/**
 * Created by LiMeiyuan on 2017/1/13.
 * Description:
 */
public enum PropertyType {
    /**
     * String.
     */
    S(String.class),
    /**
     * Integer.
     */
    I(Integer.class),
    /**
     * Long.
     */
    L(Long.class),
    /**
     * Double.
     */
    N(Double.class),
    /**
     * Date.
     */
    D(Date.class),
    /**
     * Boolean.
     */
    B(Boolean.class);
    /**
     * class.
     */
    private Class<?> clazz;

    /**
     * constructor.
     *
     * @param clazz Class
     */
    private PropertyType(Class<?> clazz) {
        this.clazz = clazz;
    }

    /**
     * @return get value.
     */
    public Class<?> getValue() {
        return clazz;
    }
}

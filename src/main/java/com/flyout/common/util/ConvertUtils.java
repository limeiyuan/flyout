package com.flyout.common.util;

import org.apache.commons.beanutils.converters.DateConverter;

import java.util.Date;

/**
 * Created by LiMeiyuan on 2017/1/13.
 * Description:
 */
public class ConvertUtils {
    /**
     * convert element String to Object.
     *
     * @param value
     *            String
     * @param toType
     *            Class
     * @return Object
     */
    public static Object convertStringToObject(String value, Class<?> toType) {
        return org.apache.commons.beanutils.ConvertUtils.convert(value, toType);
    }

    /**
     * register date converter.
     */
    private static void registerDateConverter() {
        DateConverter dc = new DateConverter();
        dc.setUseLocaleFormat(true);
        dc.setPatterns(new String[] { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss" });
        org.apache.commons.beanutils.ConvertUtils.register(dc, Date.class);
    }
}

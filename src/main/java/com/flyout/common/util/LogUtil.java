package com.flyout.common.util;

import org.apache.log4j.Logger;

/**
 * Created by LiMeiyuan on 2016/11/17 23:19.
 * description:
 */
public class LogUtil {
    private static Logger logger = Logger.getLogger("default");

    public static Logger getLogger() {
        return logger;
    }
}

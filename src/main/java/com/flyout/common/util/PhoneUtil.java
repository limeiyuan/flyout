package com.flyout.common.util;

import java.util.regex.Pattern;

/**
 * @author LiMeiyuan
 * @version v1.00
 * @date 2016/12/4 20:23
 * @description:
 */
public class PhoneUtil {
    /**
     * 校验是否是正确的中国的手机号码
     * @param tel 手机号码
     * @return 是否正确
     */
    public static boolean isValidPhoneCN(String tel){
        Pattern pattern = Pattern.compile("^((1[358][0-9])|(14[57])|(17[01678]))\\d{8}$");
        return pattern.matcher(tel).matches();
    }
}

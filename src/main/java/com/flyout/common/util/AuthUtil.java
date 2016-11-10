package com.flyout.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by LiMeiyuan on 2016/11/9 20:15.
 * description:
 */
public class AuthUtil {
    public static String getPassword(String password) {
        try {
            byte[] destBytes = MessageDigest.getInstance("MD5").digest(password.getBytes());
            StringBuilder builder = new StringBuilder();
            for (byte destByte : destBytes) {
                builder.append(Integer.toHexString((destByte & 0xFF) | 0x100).substring(1, 3));
            }
            return builder.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return "";
    }
}

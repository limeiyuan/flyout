package com.flyout.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by LiMeiyuan on 2016/11/9 20:15.
 * description:
 */
public class AuthUtil {
    public static final String MD5 = "MD5";
    public static final String SHA1 = "SHA-1";
    public static final String SHA256 = "SHA-256";

    public static String getPassword(String password) {
        return gen(password, MD5);
    }

    public static String gen(String src, String type) {
        try {
            byte[] destBytes = MessageDigest.getInstance(type).digest(src.getBytes());
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

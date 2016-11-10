package com.flyout.common.auth;

import com.flyout.common.util.WebContextUtil;
import com.flyout.domain.Account;

import javax.servlet.http.HttpSession;

/**
 * Created by LiMeiyuan on 2016/11/9 15:21.
 * description:
 */
public class AuthHelper {
    public static final String LOGIN_USER = "loginUser";

    public static void login(Account account) {
        HttpSession session = WebContextUtil.getSession();
        session.setAttribute(LOGIN_USER, account);
    }

    public static Account getLoginUser() {
        HttpSession session = WebContextUtil.getSession();
        if (session == null) return null;
        return (Account) session.getAttribute(LOGIN_USER);
    }

    public static void logout() {
        HttpSession session = WebContextUtil.getSession();
        if (session != null) {
            session.removeAttribute(LOGIN_USER);
            session.invalidate();
        }
    }
}

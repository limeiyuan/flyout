package com.flyout.common.auth;

import com.flyout.common.dto.RongyunDto;
import com.flyout.common.util.WebContextUtil;
import com.flyout.domain.Account;

import javax.servlet.http.HttpSession;

/**
 * Created by LiMeiyuan on 2016/11/9 15:21.
 * description:
 */
public class AuthHelper {
    private static final String LOGIN_USER = "loginUser";
    private static final String RONGYUN_DTO = "rongyunDto";

    public static void login(Account account) {
        HttpSession session = WebContextUtil.getSession();
        session.setAttribute(LOGIN_USER, account);
    }

    public static void setRongyunDto(RongyunDto dto) {
        HttpSession session = WebContextUtil.getSession();
        session.setAttribute(RONGYUN_DTO, dto);
    }

    public static RongyunDto getRongyunDto() {
        HttpSession session = WebContextUtil.getSession();
        if (session == null) return null;
        return (RongyunDto) session.getAttribute(RONGYUN_DTO);
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
            session.removeAttribute(RONGYUN_DTO);
            session.invalidate();
        }
    }
}

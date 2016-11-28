package com.flyout.common.auth;

import com.flyout.common.dto.RongyunDto;
import com.flyout.common.util.WebContextUtil;
import com.flyout.controller.RongyunController;
import com.flyout.domain.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/9 15:19.
 * description:
 */
public class AuthenticationInterceptor implements HandlerInterceptor {
    private List<String> forbidUrls;

    public List<String> getForbidUrls() {
        return forbidUrls;
    }

    public void setForbidUrls(List<String> forbidUrls) {
        this.forbidUrls = forbidUrls;
    }

    @Autowired
    private RongyunController rongyunController;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        RongyunDto rongyunDto = AuthHelper.getRongyunDto();
        if (rongyunDto == null) {
            rongyunController.getToken(null);
        }

        Account account = AuthHelper.getLoginUser();
        if (account != null) {
            return true;
        }

        if (!forbidUrls.isEmpty()) {
            String url = httpServletRequest.getServletPath();
            for (String forbidUrl : forbidUrls) {
                if (url.equals(forbidUrl)) {
                    String loginPath = WebContextUtil.getServletContextName() + "/login/index.htm";
                    httpServletResponse.sendRedirect(loginPath);
                    return false;
                }
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}

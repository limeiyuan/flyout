package com.flyout.controller;

import com.flyout.common.auth.AuthHelper;
import com.flyout.common.constance.Constance;
import com.flyout.common.dto.BasicDto;
import com.flyout.common.util.AuthUtil;
import com.flyout.domain.Account;
import com.flyout.service.AccountServiceImpl;
import com.flyout.service.VerificationServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by LiMeiyuan on 2016/11/18 0:07.
 * description:
 */
@Controller
@RequestMapping("account")
public class AccountController {
    @Autowired
    private AccountServiceImpl accountService;

    @Autowired
    private VerificationServiceImpl verificationService;

    @RequestMapping(value = "register", method = RequestMethod.POST)
    @ResponseBody
    public BasicDto register(@RequestParam String username,
                             @RequestParam String password,
                             @RequestParam String verification) {
        BasicDto dto = new BasicDto();
        dto.setResult(false);
        if (StringUtils.isEmpty(username)) {
            dto.setMessage("用户名不能为空");
            return dto;
        }
        if (StringUtils.isEmpty(password) || password.length() < 6) {
            dto.setMessage("密码最少为6位字符");
            return dto;
        }
        if (StringUtils.isEmpty(verification)) {
            dto.setMessage("验证码不能为空");
            return dto;
        }
        // TODO: 2016/11/18 添加校验码验证
        accountService.register(username, password);
        return dto;
    }

    @RequestMapping(value = "resetPassword", method = RequestMethod.POST)
    @ResponseBody
    public BasicDto resetPassword(@RequestParam String username,
                                  @RequestParam String password) {
        BasicDto dto = new BasicDto();
        dto.setResult(false);
        if (StringUtils.isEmpty(username)) {
            dto.setMessage("用户名不能为空");
            return dto;
        }
        if (StringUtils.isEmpty(password) || password.length() < 6) {
            dto.setMessage("密码最少为6位字符");
            return dto;
        }
        return dto;
    }

    @RequestMapping("requestResetPassword")
    @ResponseBody
    public BasicDto requestResetPassword(HttpServletRequest request, @RequestParam String tel) {
        BasicDto dto = new BasicDto();
        dto.setResult(false);
        if (StringUtils.isEmpty(tel)) {
            dto.setMessage("手机号码不能为空");
            return dto;
        }
        return verificationService.sendVerificationNum(request, Constance.PHONE_AREA_CN, tel);
    }

    @RequestMapping(value = "changePassword", method = RequestMethod.POST)
    @ResponseBody
    public BasicDto changePassword(@RequestParam String password, @RequestParam String oldPassword) {
        BasicDto dto = new BasicDto();
        Account account = AuthHelper.getLoginUser();
        if (account.getPassword() == null || !AuthUtil.getPassword(oldPassword).equals(account.getPassword())) {
            dto.setMessage("旧密码不正确");
            return dto;
        }
        account.setPassword(password);
        accountService.save(account);
        return dto;
    }
}

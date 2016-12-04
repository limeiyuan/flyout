package com.flyout.controller;

import com.flyout.common.auth.AuthHelper;
import com.flyout.common.cache.MemcachedManager;
import com.flyout.common.constance.Constance;
import com.flyout.common.constance.MemcachedConstance;
import com.flyout.common.dto.BasicDto;
import com.flyout.common.util.PhoneUtil;
import com.flyout.domain.Account;
import com.flyout.service.AccountServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by LiMeiyuan on 2016/11/9 16:01.
 * description:
 */
@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private AccountServiceImpl accountService;

    @Autowired
    private MemcachedManager memcachedManager;

    @RequestMapping("index")
    public String index() {
        return "/login";
    }

    @RequestMapping("register")
    @ResponseBody
    public BasicDto register(@RequestParam String tel,
                             @RequestParam String password,
                             @RequestParam String verifyCode) {
        BasicDto dto = new BasicDto();
        String username = Constance.PHONE_AREA_CN + tel;
        //校验验证码
        String code = (String) memcachedManager.get(MemcachedConstance.SMS_KEY + username);
        if (StringUtils.isEmpty(code) || !code.equalsIgnoreCase(verifyCode)) {
            dto.setMessage("验证码错误");
            return dto;
        }
        //检查电话格式
        if (!PhoneUtil.isValidPhoneCN(tel)) {
            dto.setMessage("号码格式不正确");
            return dto;
        }
        //检查密码格式
        if (StringUtils.isEmpty(password) || password.length() < 6) {
            dto.setMessage("密码需大于6位");
            return dto;
        }
        if (accountService.isUsernameDulplicate(username)) {
            dto.setMessage("电话已经注册");
        }
        accountService.register(username, password);
        return dto;
    }

    @RequestMapping("login")
    @ResponseBody
    public BasicDto login(@RequestParam String username, @RequestParam String password) {
        BasicDto dto = new BasicDto();
        dto.setResult(false);
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            dto.setMessage("用户名或者密码不能为空");
            return dto;
        }

        Account account = accountService.login("86" + username, password);
        if (account == null) {
            dto.setMessage("用户不存在");
            return dto;
        }

        AuthHelper.login(account);

        dto.setResult(true);
        dto.setMessage("登录成功");
        return dto;
    }

    @RequestMapping("logout")
    @ResponseBody
    public BasicDto logout() {
        AuthHelper.logout();
        BasicDto dto = new BasicDto();
        dto.setResult(true);
        dto.setMessage("账户已退出");
        return dto;
    }
}

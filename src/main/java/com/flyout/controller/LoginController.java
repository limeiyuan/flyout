package com.flyout.controller;

import com.flyout.common.auth.AuthHelper;
import com.flyout.common.dto.BasicDto;
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

    @RequestMapping("index")
    public String index() {
        return "/login";
    }

    @RequestMapping("register")
    public String register() {
        return "/register";
    }

    @RequestMapping("login")
    @ResponseBody
    public BasicDto login(@RequestParam String username, @RequestParam String password) {
        BasicDto dto = new BasicDto();
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            dto.setResult(false);
            dto.setMessage("用户名或者密码不能为空");
        }

        Account account = accountService.login("86" + username, password);
        if (account == null) {
            dto.setResult(false);
            dto.setMessage("用户不存在");
        }
        AuthHelper.login(account);

        dto.setResult(true);
        dto.setMessage("登陆成功");
        return dto;
    }
}

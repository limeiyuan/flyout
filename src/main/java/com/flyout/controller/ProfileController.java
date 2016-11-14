package com.flyout.controller;

import com.flyout.common.auth.AuthHelper;
import com.flyout.common.dto.ProfileDto;
import com.flyout.domain.Account;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by LiMeiyuan on 2016/11/14 10:57.
 * description:
 */
@Controller
@RequestMapping("profile")
public class ProfileController {
    @RequestMapping("index")
    public String index(ModelMap map) {
        Account account = AuthHelper.getLoginUser();
        if (account == null) {
            return "login";
        }
        ProfileDto dto = ProfileDto.fromAccount(account);
        map.put("account", dto);
        return "profile/index";
    }
}

package com.flyout.controller;

import com.flyout.common.ApplicationProperties;
import com.flyout.common.auth.AuthHelper;
import com.flyout.common.dto.BasicDto;
import com.flyout.common.dto.CustomServiceDto;
import com.flyout.common.util.RandomUtil;
import com.flyout.domain.Account;
import com.flyout.service.RongyunService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by LiMeiyuan on 2016/11/26 12:20.
 * description:
 */
@RequestMapping("rongyun")
@Controller
public class RongyunController {
    @Autowired
    private RongyunService rongyunService;

    @Autowired
    private ApplicationProperties properties;

    @RequestMapping("getToken")
    @ResponseBody
    public BasicDto getToken(String userId) {
        BasicDto dto = new BasicDto();
        String name = "";
        String path = "";//用户头像地址
        if (userId == null) {
            Account account = AuthHelper.getLoginUser();
            if (account != null) {
                name = account.getScreenname();
                userId = String.valueOf(account.getId());
                path = account.getPhoto().getPath();
            } else {
                userId = RandomUtil.genRandomChar(6, RandomUtil.RandomType.LOWER_UPPER_NUMBER);
            }
        }
        if (StringUtils.isEmpty(name)) {
            //非系统账号
            name = "User_" + userId;
            path = properties.getValue("DEFAULT_AVATAR");
        }
        CustomServiceDto customServiceDto = rongyunService.getToken(name, userId, properties.getValue("SERVER_PIC_PATH") + path);
        if (customServiceDto == null) {
            dto.setMessage("获取Token失败");
        } else {
            AuthHelper.setCustomServiceDto(customServiceDto);
            dto.setResult(true);
            dto.setData(customServiceDto.getToken());
            dto.setMessage("获取Token成功");
        }
        return dto;
    }
}

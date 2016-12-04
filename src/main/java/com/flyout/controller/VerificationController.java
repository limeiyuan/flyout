package com.flyout.controller;

import com.flyout.common.constance.Constance;
import com.flyout.common.dto.BasicDto;
import com.flyout.service.VerificationServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by LiMeiyuan on 2016/11/17 15:49.
 * description:
 */
@Controller
@RequestMapping("verification")
public class VerificationController {
    @Autowired
    private VerificationServiceImpl verificationService;

    @RequestMapping(value = "get", method = {RequestMethod.POST})
    @ResponseBody
    public BasicDto getVerification(HttpServletRequest request, @RequestParam String tel) {
        return verificationService.sendVerificationNum(request, Constance.PHONE_AREA_CN, tel);
    }
}

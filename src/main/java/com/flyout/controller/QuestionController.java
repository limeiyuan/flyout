package com.flyout.controller;

import com.flyout.common.auth.AuthHelper;
import com.flyout.common.dto.BasicDto;
import com.flyout.domain.Account;
import com.flyout.domain.Question;
import com.flyout.service.QuestionServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by LiMeiyuan on 2017/1/5.
 * Description:
 */
@Controller
@RequestMapping("question")
public class QuestionController {
    @Resource
    private QuestionServiceImpl questionService;

    @RequestMapping("submit")
    @ResponseBody
    public BasicDto create(@RequestParam String content) {
        BasicDto dto = new BasicDto();
        dto.setResult(true);
        Account account = AuthHelper.getLoginUser();
        if (account == null) {
            dto.setMessage("需要登录");
            dto.setResult(false);
        }
        Question question = new Question();
        question.setAccount(account);
        question.setCreateTime(new Date());
        question.setContent(content);
        question.setOrder(50);
        questionService.save(question);
        dto.setMessage("提交成功");
        return dto;
    }

    @RequestMapping("detail")
    public String detail(@RequestParam Long id, ModelMap map) {
        Question question = questionService.get(id);
        if (question == null) {
            return "redirect:home/home.htm";
        }
        map.put("question", question);
        return "question/detail";
    }
}

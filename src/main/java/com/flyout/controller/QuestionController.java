package com.flyout.controller;

import com.flyout.common.dto.BasicDto;
import com.flyout.domain.Question;
import com.flyout.service.QuestionServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by LiMeiyuan on 2017/1/5.
 * Description:
 */
@Controller
@RequestMapping("question")
public class QuestionController {
    @Resource
    private QuestionServiceImpl questionService;

    @RequestMapping("create")
    @ResponseBody
    public BasicDto create() {
        BasicDto dto = new BasicDto();
        dto.setResult(true);
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

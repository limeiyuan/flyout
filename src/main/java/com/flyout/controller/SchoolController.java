package com.flyout.controller;

import com.flyout.common.cache.MemcachedManager;
import com.flyout.common.constance.MemcachedConstance;
import com.flyout.common.dto.PaginationDto;
import com.flyout.common.util.HtmlUtil;
import com.flyout.common.util.RandomUtil;
import com.flyout.domain.SchoolInfo;
import com.flyout.service.SchoolServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/9 21:15.
 * description:
 */
@Controller
@RequestMapping("school")
public class SchoolController {
    @Autowired
    private SchoolServiceImpl schoolService;

    @Autowired
    private MemcachedManager memcachedManager;

    @RequestMapping("index")
    public String index(String dataId, ModelMap map) {
        if (dataId != null) {
            map.put("dataId", dataId);
        }
        return "school/list";
    }

    @RequestMapping("detail")
    public String detail(Long id, ModelMap map) {
        SchoolInfo schoolInfo = schoolService.getSchool(id);
        map.put("school", schoolInfo);
        return "school/detail";
    }

    @RequestMapping("getInitData")
    @ResponseBody
    public PaginationDto<SchoolInfo> getInitData(String dataId) {
        PaginationDto<SchoolInfo> dto = new PaginationDto<>();
        if (dataId == null) {
            dto.autoFill(schoolService.getSchoolList(null));
        } else {
            dto.autoFill((List<SchoolInfo>) memcachedManager.get(dataId));
            memcachedManager.del(dataId);
        }
        dto.setResult(true);
        return dto;
    }

    @RequestMapping("list")
    @ResponseBody
    public PaginationDto<SchoolInfo> getSchoolList(String name) {
        PaginationDto<SchoolInfo> dto = new PaginationDto<>();
        List<SchoolInfo> schools = schoolService.getSchoolList(name);
        for (SchoolInfo school : schools) {
            String subject = HtmlUtil.getPlainText(school.getSubject().replace("<div>", "：").replace("<br>", "、"));
            if (subject.indexOf("、") > 0) {
                int offset = subject.indexOf("、", subject.indexOf("、") + 1);
                if (offset > 0) {
                    subject = subject.substring(0, offset);
                }
            }
            school.setSubject(subject);
            school.setHonour(HtmlUtil.getPlainText(school.getHonour()));
            school.setDescription("");
            school.setTerm("");
            school.setFlyDic("");
            school.setPriceCk("");
        }
        dto.autoFill(schools);
        return dto;
    }

    @RequestMapping("estimate")
    @ResponseBody
    public PaginationDto<SchoolInfo> estimate() {
        String dataId = RandomUtil.genRandomChar(8, RandomUtil.RandomType.LOWER_UPPER_NUMBER);
        memcachedManager.add(MemcachedConstance.DATA_ID + dataId, MemcachedConstance.DATA_EXPIRE, new ArrayList<SchoolInfo>());
        return new PaginationDto<>();
    }
}

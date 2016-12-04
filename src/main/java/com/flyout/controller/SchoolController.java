package com.flyout.controller;

import com.flyout.common.cache.MemcachedManager;
import com.flyout.common.dto.PaginationDto;
import com.flyout.common.util.HtmlUtil;
import com.flyout.domain.SchoolInfo;
import com.flyout.service.SchoolServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("estimate")
    public String estimate() {
        return "school/estimate";
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

    @RequestMapping("query")
    @ResponseBody
    public PaginationDto<SchoolInfo> getSchoolList(String name) {
        PaginationDto<SchoolInfo> dto = new PaginationDto<>();
        List<SchoolInfo> schools = schoolService.getSchoolList(name);
        dto.autoFill(schools);
        return dto;
    }

    @RequestMapping("getEstimateResult")
    @ResponseBody
    public PaginationDto<SchoolInfo> getEstimateResult() {
        PaginationDto<SchoolInfo> dto = new PaginationDto<>();
        List<SchoolInfo> schools = schoolService.getSchoolList("");
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
}

package com.flyout.common.util;

import com.flyout.common.PaginationInfo;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by LiMeiyuan on 2016/9/26 15:37.
 * description:
 */
public class PaginationUtil {
    public static PaginationInfo getPaginationFromRequest() {
        try {
            HttpServletRequest request = WebContextUtil.getRequest();
            String pageNumStr = request.getParameter("pageNum");
            if (StringUtils.isEmpty(pageNumStr)) {
                if (request.getAttribute("pageNum") != null) {
                    pageNumStr = String.valueOf(request.getAttribute("pageNum"));
                }
            }
            if (StringUtils.isNotEmpty(pageNumStr)) {
                PaginationInfo pageInfo = new PaginationInfo();
                String pageRowStr = request.getParameter("pageRow");
                if (StringUtils.isNotEmpty(pageRowStr)) {
                    pageRowStr = String.valueOf(request.getAttribute("pageRow"));
                }
                try {
                    if (StringUtils.isNotEmpty(pageNumStr)) {
                        int pageNum = Integer.parseInt(pageNumStr);
                        pageInfo.setPageNum(pageNum);
                    } else {
                        pageInfo.setPageNum(1);
                    }

                    if (StringUtils.isNotEmpty(pageRowStr)) {
                        int pageRows = Integer.parseInt(pageRowStr);
                        pageInfo.setPageRows(pageRows);
                    }

                    return pageInfo;
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    return null;
                }
            } else {
                return null;
            }
        } catch (Exception e) {
            System.out.println("不执行分页处理");
            return null;
        }
    }

    public static void initPagination(int pageNum, int pageRow) {
        HttpServletRequest request = WebContextUtil.getRequest();
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("pageRow", pageRow);
    }

    public static void setPaginationToRequest(int count, int pageCount) {
        HttpServletRequest request = WebContextUtil.getRequest();
        if (request.getParameter("pageNum") != null) {
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("count", count);
        }
    }

    public static void warpPagination(Map<String, Object> map) {
        PaginationInfo pageInfo = new PaginationInfo();
        HttpServletRequest request = WebContextUtil.getRequest();
        if (request.getParameter("pageNum") != null) {
            if (request.getAttribute("pageCount") != null && request.getAttribute("count") != null) {
                int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString());
                if (pageCount == 0) {
                    pageCount = 1;
                }
                int count = Integer.parseInt(request.getAttribute("count").toString());
                int pageNum = Integer.parseInt(request.getParameter("pageNum"));
                pageInfo.setCount(count);
                pageInfo.setPageCount(pageCount);
                pageInfo.setPageNum(pageNum);

                map.put("pagination", pageInfo);
            }

        }
    }

    public static void setEnable(boolean enable) {
        HttpServletRequest request = WebContextUtil.getRequest();
        if (request != null) {
            request.setAttribute("PAGINATION_ENABLE", enable);
        }

    }

    public static boolean isEnable() {
        HttpServletRequest request = WebContextUtil.getRequest();
        if (request == null) {
            return false;
        }
        Object obj = request.getAttribute("PAGINATION_ENABLE");
        if (obj != null && obj instanceof Boolean) {
            Boolean enable = (Boolean) obj;
            return enable;
        } else {
            return true;
        }
    }
}

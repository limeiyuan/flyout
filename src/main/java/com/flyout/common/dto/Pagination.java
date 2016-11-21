package com.flyout.common.dto;

/**
 * Created by LiMeiyuan on 2016/11/10 22:36.
 * description:
 */
public class Pagination {
    private Long count = 0L;
    private Integer pageNo = 1;
    private Integer pageSize = 30;
    private Integer pageCount = 0;

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }
}

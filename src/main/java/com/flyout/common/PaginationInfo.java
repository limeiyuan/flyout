package com.flyout.common;

/**
 * Created by LiMeiyuan on 2016/9/26 15:40.
 * description:
 */
public class PaginationInfo {
    /** 记录总数 **/
    private long count;

    /** 每页行数 **/
    private int pageSizes = 30;

    /** 当前页数 **/
    private int pageNo;

    /** 总页数 **/
    private int pageCount;

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public int getPageSizes() {
        return pageSizes;
    }

    public void setPageSizes(int pageSizes) {
        this.pageSizes = pageSizes;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }
}

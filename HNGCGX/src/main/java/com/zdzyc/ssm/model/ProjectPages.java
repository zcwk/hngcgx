package com.zdzyc.ssm.model;

import java.util.List;

/**
 * Created by zhoudezheng on 2017/7/25.
 */
public class ProjectPages {

    private int allSize;
    private int pageIndex;

    private List<List<Project>> list;

    public List<List<Project>> getList() {
        return list;
    }

    public void setList(List<List<Project>> list) {
        this.list = list;
    }

    public int getAllSize() {
        return allSize;
    }

    public void setAllSize(int allSize) {
        this.allSize = allSize;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }
}

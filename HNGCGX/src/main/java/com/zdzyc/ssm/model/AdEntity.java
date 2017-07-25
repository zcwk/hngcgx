package com.zdzyc.ssm.model;

/**
 * Created by zhoudezheng on 2017/7/25.
 */
public class AdEntity {

    private int index;
    private String image;
    private Project project;

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
}

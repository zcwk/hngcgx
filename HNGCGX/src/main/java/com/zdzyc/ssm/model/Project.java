package com.zdzyc.ssm.model;

import com.zdzyc.ssm.consts.Constant;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by zhoudezheng on 2017/3/7.
 */
public class Project implements Serializable {

    private Long id;

    private Long userId;// 创建人

    private String projectName;

    private String projectTitle;

    private String projectDetail;// 项目介绍

    private String projectTypeName;// 项目介绍

    private int projectType;// 类型

    private Integer downLoadNum;//下载次数

    private Integer star;//点赞数

    private Integer messageNum;//留言数

    private String images;//图片地址

    private List<String> listImage;//图片地址

    private Date createTime;

    private Date modifyTime;

    public String getProjectTypeName() {
        return Constant.getProjectType(projectType);
    }

    public void setProjectTypeName(String projectTypeName) {
        this.projectTypeName = projectTypeName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectTitle() {
        return projectTitle;
    }

    public void setProjectTitle(String projectTitle) {
        this.projectTitle = projectTitle;
    }

    public String getProjectDetail() {
        return projectDetail;
    }

    public void setProjectDetail(String projectDetail) {
        this.projectDetail = projectDetail;
    }

    public int getProjectType() {
        return projectType;
    }

    public void setProjectType(int projectType) {
        this.projectType = projectType;
    }

    public Integer getDownLoadNum() {
        return downLoadNum;
    }

    public void setDownLoadNum(Integer downLoadNum) {
        this.downLoadNum = downLoadNum;
    }

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public Integer getMessageNum() {
        return messageNum;
    }

    public void setMessageNum(Integer messageNum) {
        this.messageNum = messageNum;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public List<String> getListImage() {
        return listImage;
    }

    public void setListImage(List<String> listImage) {
        this.listImage = listImage;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", userId=" + userId +
                ", projectName='" + projectName + '\'' +
                ", projectTitle='" + projectTitle + '\'' +
                ", projectDetail='" + projectDetail + '\'' +
                ", projectType=" + projectType +
                ", downLoadNum=" + downLoadNum +
                ", star=" + star +
                ", messageNum=" + messageNum +
                ", images='" + images + '\'' +
                ", listImage=" + listImage +
                ", createTime=" + createTime +
                ", modifyTime=" + modifyTime +
                '}';
    }
}

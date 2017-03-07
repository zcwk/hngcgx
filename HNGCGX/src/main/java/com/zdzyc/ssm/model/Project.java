package com.zdzyc.ssm.model;

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

    private String projectType;// 类型

    private String downLoadNum;//下载次数

    private Integer star;//点赞数

    private Integer messageNum;//留言数

    private List<String> listImage;//图片地址

    private Date createTime;

    private Date modifyTime;
}

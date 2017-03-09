package com.zdzyc.ssm.dao;

import com.zdzyc.ssm.model.Project;

import java.util.List;

/**
 * Created by zhoudezheng on 2017/3/3.
 */
public interface ProjectMapper {

    List<Project> selectProjectByIndex(Long beginIndex, Long endIndex);

}

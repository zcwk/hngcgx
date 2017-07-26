package com.zdzyc.ssm.dao;

import com.zdzyc.ssm.model.Project;

import java.util.List;

/**
 * Created by zhoudezheng on 2017/3/3.
 */
public interface ProjectMapper {

    List<Project> selectProject();

    List<Project> selectProjectByIndex(int beginIndex, int endIndex);


    List<Project> selectDownloadProject(int size);

}

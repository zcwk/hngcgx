package com.zdzyc.ssm.service;

import com.zdzyc.ssm.model.Project;

import java.util.List;

/**
 * Created by zhoudezheng on 2017/3/5.
 */
public interface IProjectService {

    List<Project> selectProject();

    Project selectProjectById(int id);

    int insertProject(Project project);

    int deleteProject(int id);

    List<Project> selectAdProject();

    List<Project> selectProjectByUserId(long userId);

    List<Project> selectDownloadProject(int size);

    List<Project> selectProjectByIndex(int beginIndex, int endIndex);

}

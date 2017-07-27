package com.zdzyc.ssm.service.impl;


import com.zdzyc.ssm.dao.ProjectMapper;
import com.zdzyc.ssm.model.Project;
import com.zdzyc.ssm.service.IProjectService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Transactional
@Service("projectService")
public class ProjectServiceImpl implements IProjectService {
    @Resource
    public ProjectMapper projectMapper;

    @Override
    public List<Project> selectProject() {
        return projectMapper.selectProject();
    }

    @Override
    public Project selectProjectById(int id) {
        return projectMapper.selectProjectById(id);
    }

    @Override
    public int insertProject(Project project) {
        return projectMapper.insertProject(project);
    }

    @Override
    public int deleteProject(int id) {
        return projectMapper.deleteProject(id);
    }

    @Override
    public List<Project> selectAdProject() {
        return projectMapper.selectAdProject();
    }

    @Override
    public List<Project> selectProjectByUserId(long userId) {
        return projectMapper.selectProjectByUserId(userId);
    }

    @Override
    public List<Project> selectDownloadProject(int size) {
        return projectMapper.selectDownloadProject(size);
    }

    @Override
    public List<Project> selectProjectByIndex(int beginIndex, int endIndex) {
        return projectMapper.selectProjectByIndex(beginIndex, endIndex);
    }
}

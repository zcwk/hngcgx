package com.zdzyc.ssm.service.impl;


import com.zdzyc.ssm.dao.ProjectMapper;
import com.zdzyc.ssm.dao.UserMapper;
import com.zdzyc.ssm.model.Project;
import com.zdzyc.ssm.model.User;
import com.zdzyc.ssm.service.IProjectService;
import com.zdzyc.ssm.service.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Transactional
@Service("projectService")
public class ProjectServiceImpl implements IProjectService {
    @Resource
    public ProjectMapper projectService;

    @Override
    public List<Project> selectProjectByIndex(Long beginIndex, Long endIndex) {
        return projectService.selectProjectByIndex(beginIndex, endIndex);
    }
}

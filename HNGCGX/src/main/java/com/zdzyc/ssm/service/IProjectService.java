package com.zdzyc.ssm.service;

import com.zdzyc.ssm.model.Project;
import com.zdzyc.ssm.model.User;

import java.util.List;

/**
 * Created by zhoudezheng on 2017/3/5.
 */
public interface IProjectService {

    List<Project> selectProjectByIndex(Long beginIndex, Long endIndex);

}

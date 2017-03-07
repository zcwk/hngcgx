package com.zdzyc.ssm.controller;


import com.zdzyc.ssm.model.Project;
import com.zdzyc.ssm.model.User;
import com.zdzyc.ssm.service.IProjectService;
import com.zdzyc.ssm.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/index")
public class ProjectController {
    @Resource
    private IProjectService projectService;

    @RequestMapping("/showProject")
    public String showProject( Model model) {

        List<Project> list = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            Project project = new Project();
            project.setProjectName("项目1"+i);
            project.setProjectTitle("项目标题1"+i);
            project.setProjectDetail("把爸爸啊安安妃娘娘士大夫撒飞洒发"+i);
            list.add(project);
        }

        model.addAttribute("project", list);
        return "redirect:/#";
    }

}  
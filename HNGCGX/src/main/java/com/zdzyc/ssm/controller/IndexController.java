package com.zdzyc.ssm.controller;


import com.zdzyc.ssm.consts.Constant;
import com.zdzyc.ssm.model.Project;
import com.zdzyc.ssm.model.User;
import com.zdzyc.ssm.service.IProjectService;
import com.zdzyc.ssm.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/index")
public class IndexController {
    @Resource
    private IUserService userService;

    @Resource
    private IProjectService projectService;

    @RequestMapping(value = "/projectDetails/{projectId}", method = RequestMethod.GET)
    public String projectDetails(@PathVariable("projectId") int projectId, HttpServletRequest request, Model model) {

        User user = (User) request.getSession().getAttribute("loginUser");
        if (user == null) {
            return "login";
        }
        model.addAttribute("user", user);


        Project project = projectService.selectProjectById(projectId);
        if (project != null) {
            model.addAttribute("project", project);

            User projectUser = userService.selectByPrimaryKey(project.getUserId());

            model.addAttribute("projectUser", projectUser);
        }
        return "projectDetails";
    }


}  
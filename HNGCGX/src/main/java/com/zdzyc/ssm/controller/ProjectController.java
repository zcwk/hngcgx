package com.zdzyc.ssm.controller;


import com.zdzyc.ssm.model.AdEntity;
import com.zdzyc.ssm.model.Project;
import com.zdzyc.ssm.model.ProjectPages;
import com.zdzyc.ssm.service.IProjectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/index")
public class ProjectController {
    @Resource
    private IProjectService projectService;

    @RequestMapping(name = "/", method = RequestMethod.GET)
    public String ProjectList(Model model) {
        model.addAttribute("project", getProject(0));

        model.addAttribute("download", getDownLoadList());

        model.addAttribute("ads", getAdEntities());

        return "index";
    }

    @RequestMapping(value = "/{pageIndex}", method = RequestMethod.GET)
    public String ProjectList(@PathVariable("pageIndex") int pageIndex, Model model) {

        model.addAttribute("project", getProject(pageIndex));

        model.addAttribute("download", getDownLoadList());

        model.addAttribute("ads", getAdEntities());

        return "index";
    }

    private List<AdEntity> getAdEntities() {
        List<AdEntity> ads = new ArrayList<>();
        List<Project> adProject = projectService.selectAdProject();
        for (int i = 0; i < adProject.size(); i++) {
            Project project = adProject.get(i);
            AdEntity adEntity = new AdEntity();
            adEntity.setIndex(i);
            adEntity.setImage(project.getImages());
            adEntity.setProject(project);
            ads.add(adEntity);
        }
        return ads;
    }

    private List<Project> getDownLoadList() {
        List<Project> download = projectService.selectDownloadProject(10);

        return download;
    }

    private ProjectPages getProject(int pageIndex) {
        final int rows = 3;
        final int cols = 3;
        List<Project> list = projectService.selectProject();

        if (list == null) {
            ProjectPages projectPages = new ProjectPages();
            projectPages.setList(null);
            projectPages.setPageIndex(pageIndex);
            projectPages.setAllSize(list.size());
            return projectPages;
        }

        final boolean good = list.size() % cols == 0;

        final int size = good ? (list.size() / cols) : (list.size() / cols + 1);

        List<List<Project>> allList = new ArrayList<>();

        if (good) {
            for (int i = 0; i < size; i++) {
                List<Project> list1 = new ArrayList<>();
                for (int j = 0; j < cols; j++) {
                    list1.add(list.get(i * cols + j));
                }
                allList.add(list1);
            }
        } else {
            for (int i = 0; i < size; i++) {
                List<Project> list1 = new ArrayList<>();
                int lastSize = (list.size() % cols);
                for (int j = 0; j < ((i == size - 1) ? lastSize : cols); j++) {
                    list1.add(list.get(i * cols + j));
                }
                allList.add(list1);
            }
        }

        List<List<Project>> requestList = new ArrayList<>();

        for (int i = 0; i < cols; i++) {
            int index = (pageIndex * cols) + i;
            if (index < allList.size())
                requestList.add(allList.get(index));
        }

        ProjectPages projectPages = new ProjectPages();
        projectPages.setList(requestList);
        projectPages.setPageIndex(pageIndex);
        projectPages.setAllSize(list.size());

        return projectPages;
    }


}
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
        for (int i = 1; i < 6; i++) {
            AdEntity adEntity = new AdEntity();
            adEntity.setIndex(i == 1 ? 0 : i);
            adEntity.setImage("http://pic25.nipic.com/20121121/668573_132500576118_2.jpg");
            Project project = new Project();
            project.setProjectName("项目" + i);
            project.setProjectTitle("项目标题" + i);
            project.setProjectDetail("把爸爸啊安安妃娘娘士大夫撒飞洒发" + i);
            adEntity.setProject(project);
            ads.add(adEntity);
        }
        return ads;
    }

    private List<Project> getDownLoadList(){
        List<Project> download = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            Project project = new Project();
            project.setProjectName("项目1" + i);
            project.setProjectTitle("项目标题1" + i);
            project.setProjectDetail("把爸爸啊安安妃娘娘士大夫撒飞洒发" + i);
            download.add(project);
        }

        return download;
    }

    private ProjectPages getProject(int pageIndex) {
        List<Project> list = new ArrayList<>();
        for (int i = 0; i < 40; i++) {
            Project project = new Project();
            project.setProjectName("项目" + i);
            project.setProjectTitle("项目标题" + i);
            project.setProjectDetail("把爸爸啊安安妃娘娘士大夫撒飞洒发" + i);
            project.setImages("http://pic25.nipic.com/20121121/668573_132500576118_2.jpg");
            list.add(project);
        }

        final int rows = 3;
        final int cols = 3;
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
            int index = (pageIndex * cols)+i;
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
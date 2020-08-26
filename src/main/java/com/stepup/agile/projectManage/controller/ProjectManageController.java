package com.stepup.agile.projectManage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.projectManage.model.service.ProjectService;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class ProjectManageController {
	@Autowired
	private ProjectService ps;
	
	public String selectProject(@ModelAttribute("loginUser")Member m, Model model) {
		
		List<Project> pjList = ps.selectProject(m);
		
		model.addAttribute("pjList", pjList);
		
		
		return "projectManage/projectTimeLine/projectTimeLine";
	}
}

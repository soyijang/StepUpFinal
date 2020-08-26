package com.stepup.agile.projectManage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.projectManage.model.service.ProjectService;

@SessionAttributes("loginUser")
@Controller
public class ProjectManageController {
	@Autowired
	private ProjectService ps;
	
	public String selectProject(@("loginUser")Model model, ) {
		
		return "";
	}
}

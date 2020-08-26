package com.stepup.agile.userInfo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.projectManage.model.service.ProjectService;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.service.MemberService;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class ProjectMainController {
	@Autowired
	private MemberService ms;
	
	@Autowired
	private ProjectService ps;
	
	@RequestMapping("selectUserProject.me")
	public String selectUserProject(@ModelAttribute("loginUser") Member m, Model model) {
	
	List<Project> pjList = ps.selectUserProject(m);
	
	System.out.println(pjList);
	model.addAttribute("pjList", pjList);
	
	return "userInfo/userProjectMain/userProjectMain";
			
		
			
			
	}
}

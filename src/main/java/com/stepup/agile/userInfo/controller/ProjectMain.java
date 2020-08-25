package com.stepup.agile.userInfo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.userInfo.model.service.MemberService;

@SessionAttributes("loginUser")
@Controller
public class ProjectMain {
	@Autowired
	private MemberService ms;
	
	@RequestMapping("selectUserProject.me")
	public String selectUserProject(Model model) {
		List<Map<String, Object>> list = new ArrayList<>();
		
		
		list = ms.selectUserProject();
		model.addAttribute("projectList", list);
		
		
		return "userInfo/userProjectMain/userProjectMain";
	}
}

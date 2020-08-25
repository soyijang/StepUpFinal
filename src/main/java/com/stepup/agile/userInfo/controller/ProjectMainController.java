package com.stepup.agile.userInfo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.userInfo.model.service.MemberService;

@SessionAttributes("loginUser")
@Controller
public class ProjectMainController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping("selectUserProject.me")
	public String selectUserProject(Model model) {
		List <String> list = new ArrayList<>();
		HashMap<String, Object> hashMap = new HashMap<>();
		
		list = ms.selectUserProject();
		hashMap.put("userPjList", list);
		
		System.out.println(list);
		model.addAttribute("userPjList", list);
		
		return "userInfo/userProjectMain/userProjectMain";
	}
}

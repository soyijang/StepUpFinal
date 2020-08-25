package com.stepup.agile.projectBacklog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stepup.agile.projectBacklog.model.service.BacklogService;
import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.userInfo.model.vo.Member;

@Controller
public class BacklogController {
	
	@Autowired
	private BacklogService bs;
	
	@RequestMapping("showSprintMain.sp")
	public String selectSprint(Model model, Member m) {
		
		List<Sprint> sprintList;
		
		sprintList = bs.selectSprint(m);
		model.addAttribute("sprintList", sprintList);
		System.out.println(m);
		return "projectBacklog/projectBacklog";
		
	}
	
}

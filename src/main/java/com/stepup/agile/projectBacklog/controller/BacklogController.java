package com.stepup.agile.projectBacklog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.projectBacklog.model.service.BacklogService;
import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class BacklogController {
	
	@Autowired
	private BacklogService bs;
	
	@RequestMapping("showSprintMain.st")
	public String selectSprint(Model model, @ModelAttribute("loginUser") Member m) {
		
		System.out.println("컨트롤러에서의 m.getUserEmail() : " + m.getUserEmail());
		List<Sprint> sprintList;
		sprintList = bs.selectSprint(m);
		model.addAttribute("sprintList", sprintList);
		System.out.println(sprintList);
		
		return "projectBacklog/projactBacklog";
		
	}
	
}

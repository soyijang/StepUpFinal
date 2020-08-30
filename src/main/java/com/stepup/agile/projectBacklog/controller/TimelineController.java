package com.stepup.agile.projectBacklog.controller;

import java.util.ArrayList;
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
public class TimelineController {
	@Autowired
	private BacklogService bs;
	
	@RequestMapping("SelectEpic.st")
	public String selectEpic(Model model, @ModelAttribute("loginUser")Member m) {
		
		List<Sprint> EpicList = new ArrayList<Sprint>();
		EpicList = bs.selectSprint(m);
		
		model.addAttribute("EpicList", EpicList);
		
		
		return "projectManage/projectTimeLine/projectTimeLine";
	}
}

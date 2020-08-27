package com.stepup.agile.projectBacklog.controller;

import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectBacklog.model.service.BacklogService;
import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
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
		
		return "projectBacklog/projactBacklog";
		
	}
	
	@RequestMapping(value="showSprintDetail.st",method=RequestMethod.POST)
	public ModelAndView selectSprintOne(@ModelAttribute("loginUser") Member m, int sprintCode, ModelAndView mv) {
		
		SprintHistory sprintList;
		sprintList = bs.selectSprintOne(m, sprintCode);
		mv.addObject("sprint", sprintList);
		mv.setViewName("jsonView");
		
		return mv;
		
	}
	
	@RequestMapping("insert.st")
	public String insertSprint(Model model, @RequestParam(value="userProjectCode",required=false) int userProjectCode) {
		
		System.out.println("컨트롤러에서의 userProjectCode : " +userProjectCode );
		int result = bs.insertSprint(userProjectCode);
		
		if(result>0) {
			return "redirect:showSprintMain.st";
		}else {
			model.addAttribute("msg", "스프린트 생성을 실패하였습니다!");
			return "common/errorPage";
		}
		
	}
}

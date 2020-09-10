package com.stepup.agile.projectFeedback.newsurvey.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectFeedback.newsurvey.model.service.NewSurveyService;
import com.stepup.agile.userInfo.model.vo.Member;

import net.sf.json.JSONArray;

@SessionAttributes("loginUser")
@Controller
public class NewSurveyController {

	@Autowired
	private NewSurveyService ns;
	
	@RequestMapping("selectEndSprint.sv")
	public String selectEndSprint(Model model, @ModelAttribute("loginUser") Member m) {
		List<Sprint> endSprintList = new ArrayList<Sprint>();
		endSprintList = ns.selectEndSprint(m);
		
		
		model.addAttribute("endSprintList", endSprintList);
		
		return "projectFeedback/survey";
	}
	
	
	@RequestMapping("newSurvey.sv")
	public ModelAndView newSurvey(Model model, @ModelAttribute("loginUser") Member m, ModelAndView mv, String surveyName, String surveyIntro, String surveyStartDate, String surveyEndDate, String sprintName) {
		
//		List<SprintHistory> selectSprintName = new ArrayList<SprintHistory>();
//		Map<String, Object> map2= new HashMap<String, Object>();
//		String sName = sprintName.trim();
//		
//		map2.put("userEmail", m.getUserEmail());
//		map2.put("sprintName", sName);
//		
//		selectSprintName = ns.selectSprintName(map2);
//		System.out.println("스프린트 코드 : " + selectSprintName.get(0).getSprint().getSprintCode());
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		System.out.println("userCode :" + m.getUserCode());
//		map.put("userCode", m.getUserCode());
//		map.put("surveyName", surveyName);
//		map.put("surveyIntro", surveyIntro);
//		map.put("surveyStartDate", surveyStartDate);
//		map.put("surveyEndDate", surveyEndDate);
//		map.put("sprintCode", selectSprintName.get(0).getSprint().getSprintCode());
//		
//		int insertSurveyList = ns.insertNewSurvey(map);
//		
//		if(insertSurveyList > 0) {
//			System.out.println("성공");
//		}
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("selectSurvey.sv")
	public String selectSurvey(Model model, @ModelAttribute("loginUser") Member m) {
		
		
		return "projectFeedback/newsurvey";
	}
	
	
}

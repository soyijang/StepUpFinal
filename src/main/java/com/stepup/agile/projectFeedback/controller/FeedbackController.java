package com.stepup.agile.projectFeedback.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectFeedback.model.service.SurveyService;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class FeedbackController {
	

	//private Logger logger = Logger.getLogger(FeedbackController.class);
	
	@Autowired
	private SurveyService ss;
	
	//User 설문지 조회용
	@RequestMapping("survey.sv")
	public String surveyList(Model model, SurveyList sl, @ModelAttribute("loginUser") Member m ) {
		
		List<SurveyList> surveyList = null;
		
		try {
			surveyList = ss.selectSurvey(m);
			model.addAttribute("surveyList",surveyList);
		} catch(Exception e) { 
			
			e.printStackTrace();
		}
		
		System.out.println("controller : "+surveyList);
		
		return "projectFeedback/survey";
	}
	
	@RequestMapping(value = "delete.sv", method = RequestMethod.POST)
	public ModelAndView deleteSurvey(Model model, ModelAndView mv, String surveyName,
										@ModelAttribute("loginUser") Member m) throws Exception {
		int surveyCode = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("surveyName", surveyName);
		map.put("userCode", m.getUserCode());
		surveyCode = ss.selectSurveyCode(map);
		int result = 0;
		result = ss.deleteSurvey(surveyCode);
		
		mv.setViewName("jsonView");		
		return mv;

	}

	@RequestMapping(value = "update.sv", method = RequestMethod.GET)
	public String updateSurvey(SurveyList surveyList, Model model) {
		
		int result = ss.updateSurvey(surveyList);
		
		if(result>0) {
			return "redirect:update.sv";
		}else {
			model.addAttribute("msg", "실패하였습니다!");
			return "common/errorPage";
		}
	
	}
	

}

package com.stepup.agile.projectFeedback.controller;

import java.util.List;
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
			surveyList = ss.selectSurvey(sl);
			model.addAttribute("surveyList",surveyList);
		} catch(Exception e) { 
			
			e.printStackTrace();
		}
		
		System.out.println("controller : "+surveyList);
		
		return "projectFeedback/survey";
	}
	
	/*
	 * @RequestMapping(value = "delete.sv", method = RequestMethod.GET) public
	 * String deleteSurvey(@RequestParam(value="surveyCode") int surveyCode) throws
	 * Exception{
	 * 
	 * ss.deleteSurvey(surveyCode);
	 * 
	 * return "refirect:projectFeedback/survey.jsp";
	 * 
	 * }
	 */
	
	@RequestMapping("delete.sv")
	public ModelAndView deleteSurvey(ModelAndView mv, @ModelAttribute("loginUser") Member m, int surveyCode) {
		
			int result = ss.deleteSurvey(surveyCode);
			
			mv.addObject("result",result);
			mv.setViewName("jsonview");
			
			if(result>0) {
				mv.setViewName("jsonview");
				return mv;
			} else {
				return mv;
			}
		
	}

}

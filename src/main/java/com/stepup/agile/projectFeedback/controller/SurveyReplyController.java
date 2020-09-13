package com.stepup.agile.projectFeedback.controller;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectFeedback.model.service.SurveyReplyService;
import com.stepup.agile.projectFeedback.model.vo.SurveyChoiceList;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.projectFeedback.model.vo.SurveyReplyList;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class SurveyReplyController {
	
	@Autowired
	private SurveyReplyService rs;
	
	//응답페이지 메인용
	@RequestMapping("surveyReply.sv")
	public String selectSurveyOne(Model model, @ModelAttribute("loginUser") Member m, SurveyList s) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", m.getUserCode());
		map.put("surveyCode", s.getSurveyCode());
		SurveyList survey;
		survey = rs.selectSurveyOne(map);
		
		if(survey == null) {
			model.addAttribute("alertmsg", m.getUserName() + "님은 설문 참여 대상이 아닙니다!");
			model.addAttribute("url", "redirect:MyTaskList.mt");
			return "common/alert";
		}else {
			survey.setSurveyIntro(survey.getSurveyIntro().replace("\\r\\n", "<br>"));
			model.addAttribute("surveyOne", survey);
			return "projectFeedback/feedbackAnswer/answerMain";
		}
	
	}
	
	//응답페이지 두번째 next (문항)
	@RequestMapping(value="surveyReplyNext.sv",method=RequestMethod.POST)
	public ModelAndView selectSurveyQues(ModelAndView mv, @ModelAttribute("loginUser") Member m, int surveyCode) {
		//질문 및 문항 같이 조회
		List<SurveyChoiceList> surveyChoiceList;
		surveyChoiceList = rs.selectSurveyQues(surveyCode);
		
		mv.addObject("surveyChoiceList", surveyChoiceList);
		mv.setViewName("jsonView");
		
		return mv;
	}	
	
	
	//응답페이지 제출용
	@RequestMapping("surveyReplyFin.sv")
	public ModelAndView insertSurveyReply(ModelAndView mv, @ModelAttribute("loginUser") Member m, @RequestBody SurveyReplyList replyList) {
		
		for(SurveyReplyList str : replyList.getSurveyReplyVOLists()) {
			int result = rs.insertSurveyReply(str);
		}

		mv.addObject("alertmsg", m.getUserName() + "님! 설문에 참여해주셔서 감사합니다!👼🏻");
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	
	
		
}

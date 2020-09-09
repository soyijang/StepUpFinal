package com.stepup.agile.projectFeedback.newsurvey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class NewSurveyController {

	@RequestMapping("selectSurvey.sv")
	public String selectSurvey(Model model, @ModelAttribute("loginUser") Member m) {
		
		return "projectFeedback/newsurvey";
	}
}

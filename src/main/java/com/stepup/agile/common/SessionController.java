package com.stepup.agile.common;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class SessionController {

	
	@RequestMapping(value="sessionSave.st",method=RequestMethod.POST)
	public String selectSprint(Model model, HttpSession session, 
			@ModelAttribute("loginUser") Member m, int projectCode, int userProjectCode
			, String projectName) {
		 System.out.println(projectName);
		session.setAttribute("userProjectCodeNew",userProjectCode);
		session.setAttribute("projectCodeNew",projectCode); 
		session.setAttribute("projectName",projectName); 
		
		return "redirect:showSprintMain.st";
		
	}
	
	
}

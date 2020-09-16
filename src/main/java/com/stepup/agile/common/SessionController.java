package com.stepup.agile.common;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class SessionController {

	
	@RequestMapping("sessionSave.st")
	public String selectSprint(Model model, HttpSession session, @ModelAttribute("loginUser") Member m, int projectCode, int userProjectCode) {
		 
		session.setAttribute("userProjectCodeNew",userProjectCode);
		session.setAttribute("projectCodeNew",projectCode); 
		
		return "redirect:showSprintMain.st";
		
	}
	
	
}

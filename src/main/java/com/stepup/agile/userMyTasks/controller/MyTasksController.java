package com.stepup.agile.userMyTasks.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.service.MemberService;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.service.MyTasksService;
import com.stepup.agile.userMyTasks.model.vo.MyTask;

@SessionAttributes("loginUser")
@Controller
public class MyTasksController {
	@Autowired
	private MemberService ms;
	
	@Autowired
	private MyTasksService mt;
	
	//조회
	@PostMapping("myTaskSelect.mt")
	public String showMyTasks(Member m,Model model, HttpSession session ) {
		
		try {
			Member loginUser= ms.loginMember(m);
			session.setAttribute("loginUser", loginUser);
			
			MyTask[] showMyTask = mt.showMyTasks(m);
			
			return "userMyTasks/userMyCalendar/userCalenverMain";
		} catch (LoginFailedException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}		
				
	}
	
	
	
	
}

package com.stepup.agile.userMyTasks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class MyTasksController {
	
	@RequestMapping("MyTaskList.mt")
	public String showMemberJoinForm() {
		return "userMyTasks/userMyCalendar/userCalendarMain";
	}
	
	
	
	
}

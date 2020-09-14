package com.stepup.agile.userMyTasks.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.service.MyTasksStandupMeetingService;

@SessionAttributes("loginUser")
@Controller
public class MyTasksStandupMeetingController {
	@Autowired
	private MyTasksStandupMeetingService sms;
	

	// 프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동)
	@RequestMapping("showStandUpMeeting.mt")
	public String selectProject(Model model, @ModelAttribute("loginUser") Member m) {

		//프로젝트 리스트 조회한 후에 값이 null이 아니면 
		/* if (userProjectList != null) { */
			return "userMyTasks/userStandupMeeting/userStandupMeeting";
/*			
		} else {	
			model.addAttribute("msg", "프로젝트 조회 실패!");
			return "common/errorPage";
		}*/
	}
	
	
	
}

package com.stepup.agile.userMyTasks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.service.MyTasksStandupMeetingService;
import com.stepup.agile.userMyTasks.model.vo.Rss;
import com.stepup.agile.userMyTasks.model.vo.MyTask;

import net.sf.json.JSONArray;


@SessionAttributes("loginUser")
@Controller
public class MyTasksStandupMeetingController {
	@Autowired
	private MyTasksStandupMeetingService sms;
	

	// 프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동)
	@RequestMapping("showStandUpMeeting.mt")
	public String selectProject(Model model, @ModelAttribute("loginUser") Member m) {

		//--------------------rss목록 가져오기--------------------------------
			
			List<Rss> rssList;
			rssList = sms.selectRssList(m);
			model.addAttribute("rssList", rssList);		
			
		//---------------------------------------------------------------
		
			//특정 프로젝트 기준으로 가져온다.
		int projectCode = 2;
		List<MyTask> selectMytaskShareList;
		selectMytaskShareList = sms.selectMytaskShareList(projectCode);
		for(int i = 0; i < selectMytaskShareList.size(); i++) {
			
			System.out.println(i + "번째  : " + selectMytaskShareList.get(i));
		}
		model.addAttribute("selectMytaskShareList", JSONArray.fromObject(selectMytaskShareList));
		return "userMyTasks/userStandupMeeting/userStandupMeeting";
		

	}
}

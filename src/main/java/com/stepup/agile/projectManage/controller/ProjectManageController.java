package com.stepup.agile.projectManage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectManage.model.service.ProjectService;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.userInfo.model.service.MemberService;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class ProjectManageController {
	@Autowired
	private ProjectService ps;
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping("selectTimeLine.pj")
	   public String selectTimeLine(Model model, @ModelAttribute("loginUser") Member m) {
		   
		  
		   return "projectManage/projectTimeLine/projectTimeLine";
		   
	   }
	   
	   @RequestMapping("timelineTask.pj")
	   public ModelAndView timelineTask(@ModelAttribute("loginUser") Member m, Model model, ModelAndView mv) {
		   List<ProjectHistory>selectTimelineProject = new ArrayList<ProjectHistory>();
		   System.out.println(m.getUserCode());
		   
		   selectTimelineProject = ps.selectTimelineProject(m);
		   
		   mv.addObject("userName", m.getUserName());
		   mv.addObject("ProjectList", selectTimelineProject);
		   mv.setViewName("jsonView");
		   
		   return mv;
	   }
	@RequestMapping("updateTimeline.pj")
	public ModelAndView updateTimeline(@ModelAttribute("loginUser") Member m, Model model, ModelAndView mv, String projectName, String start, String end, String projectHistoryStartTime, String projectHistoryEndTime, String projectHistoryIntro) {
		
		int updateTimeline = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("프로젝트 이름  : " + projectName);
		System.out.println("시작날짜 : " + start);
		System.out.println("종료날짜 : " + end);
		
		String startMonth = start.substring(4,7);
		String startDay = start.substring(8,10);
		String startYear = start.substring(11,15);
		
		if(startMonth.equals("Jan")) {
			startMonth = "01";
		} else if(startMonth.equals("Feb")) {
			startMonth = "02";
		} else if(startMonth.equals("Mar")) {
			startMonth = "03";
		} else if(startMonth.equals("Apr")) {
			startMonth = "04";
		} else if(startMonth.equals("May")) {
			startMonth = "05";
		} else if(startMonth.equals("Jun")) {
			startMonth = "06";
		} else if(startMonth.equals("Jul")) {
			startMonth = "07";
		} else if(startMonth.equals("Aug")) {
			startMonth = "08";
		} else if(startMonth.equals("Sep")) {
			startMonth = "09";
		} else if(startMonth.equals("Oct")) {
			startMonth = "10";
		} else if(startMonth.equals("Nov")) {
			startMonth = "11";
		} else if(startMonth.equals("Dec")) {
			startMonth = "12";
		}
		
		String startDate = startYear + "-" + startMonth + "-" + startDay;
		
		System.out.println(startMonth);
		System.out.println(startDay);
		System.out.println(startYear);
		System.out.println(startDate);
		
		String endMonth = end.substring(4,7);
		String endDay = end.substring(8,10);
		String endYear = end.substring(11,15);
		
		if(endMonth.equals("Jan")) {
			endMonth = "01";
		} else if(endMonth.equals("Feb")) {
			endMonth = "02";
		} else if(endMonth.equals("Mar")) {
			endMonth = "03";
		} else if(endMonth.equals("Apr")) {
			endMonth = "04";
		} else if(endMonth.equals("May")) {
			endMonth = "05";
		} else if(endMonth.equals("Jun")) {
			endMonth = "06";
		} else if(endMonth.equals("Jul")) {
			endMonth = "07";
		} else if(endMonth.equals("Aug")) {
			endMonth = "08";
		} else if(endMonth.equals("Sep")) {
			endMonth = "09";
		} else if(endMonth.equals("Oct")) {
			endMonth = "10";
		} else if(endMonth.equals("Nov")) {
			endMonth = "11";
		} else if(endMonth.equals("Dec")) {
			endMonth = "12";
		}
		
		
		String endDate = endYear + "-" + endMonth + "-" + endDay;
		
		System.out.println(endMonth);
		System.out.println(endDay);
		System.out.println(endYear);
		System.out.println(endDate);
		
		map.put("projectName", projectName);
		map.put("userEmail", m.getUserEmail());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("startTime", projectHistoryStartTime);
		map.put("endTime", projectHistoryEndTime);
		map.put("intro", projectHistoryIntro);
		
		updateTimeline = ps.updateTimeline(map);
		if(updateTimeline > 0) {
			mv.setViewName("jsonView");
			
			return mv;
		} else {
			System.out.println("업데이트 불가능");
			mv.setViewName("jsonView");
			return mv;
		}
		
		//mv.addObject("ProjectList", selectTimelineProject);
		
	}
}

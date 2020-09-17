package com.stepup.agile.userInfo.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectManage.model.service.ProjectService;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.service.TaskService;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.service.MemberService;
import com.stepup.agile.userInfo.model.vo.AlertList;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.service.MyTasksService;
import com.stepup.agile.userMyTasks.model.vo.MyTask;

@SessionAttributes("loginUser")
@Controller
public class ProjectMainController {
	@Autowired
	private MemberService ms;
	
	@Autowired
	private ProjectService ps;
	
	@Autowired
	private TaskService ts;
	
	@Autowired
	private MyTasksService mts;
	
	@RequestMapping("selectUserProject.me")
	public String selectUserProject(@ModelAttribute("loginUser") Member m, Model model, Project p) {
	
		int alertList = ps.selectAlert(m);
		int alertList2 = ps.selectSprintAlert(m);
		
		List<Project> pjName = ps.selectUserProject(m);
		List<Project> pjName2 = ps.selectUserProject2(m);
		
		
		List<TaskHistory> taskList = ts.selectUserTask(m);
		List<String> taskTitle = new ArrayList<String>();
		List<String> taskStatus = new ArrayList<String>();
		List<String> taskDate = new ArrayList<String>();
		
		for(int i = 0; i < taskList.size(); i++) {
			if(taskList.get(i).getTaskCategoryCode().equals("J")) {
				taskTitle.add(taskList.get(i).getTaskHistValue());
			}else if(taskList.get(i).getTaskCategoryCode().equals("I")) {
				taskStatus.add(taskList.get(i).getTaskHistValue());
			}else if(taskList.get(i).getTaskCategoryCode().equals("A")) {
				taskDate.add(taskList.get(i).getTaskHistValue());
			}
		}
		
		System.out.println(taskTitle);
		
		int nonTaskCnt=0;
		int ingTaskCnt=0;
		int comTaskCnt=0;
		for(int j = 0; j < taskStatus.size(); j++) {
			if(taskStatus.get(j).equals("미진행")) {
				nonTaskCnt++;
			}else if(taskStatus.get(j).equals("진행중")){
				ingTaskCnt++;
			}else if(taskStatus.get(j).equals("완료")){
				comTaskCnt++;
			}
		}
		
	System.out.println(nonTaskCnt);
	System.out.println(ingTaskCnt);
	System.out.println(comTaskCnt);
		
	model.addAttribute("alertList2", alertList2);
	model.addAttribute("alertList", alertList);
	model.addAttribute("pjList", pjName);
	model.addAttribute("pjList2", pjName2);
	model.addAttribute("taskList", taskList);
	model.addAttribute("taskTitle", taskTitle);
	model.addAttribute("taskStatus", taskStatus);
	model.addAttribute("taskDate", taskDate);
	model.addAttribute("nonTaskCnt", nonTaskCnt);
	model.addAttribute("ingTaskCnt", ingTaskCnt);
	model.addAttribute("comTaskCnt", comTaskCnt);
	
	
	return "userInfo/userProjectMain/userProjectMain";
			
	}
	
	@RequestMapping("selectMyTasks.me")
	public ModelAndView selectMyTasks(@ModelAttribute("loginUser") Member m, Model model, ModelAndView mv) {
		List<MyTask> myTasks = mts.selectTaskList(m);
		
		System.out.println(myTasks);
		
		mv.addObject("myTasks", myTasks);
		mv.setViewName("jsonView");
		
		return mv;
	}
	

}

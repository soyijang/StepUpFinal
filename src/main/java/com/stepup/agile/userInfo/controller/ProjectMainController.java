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

import com.stepup.agile.projectManage.model.service.ProjectService;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.service.TaskService;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.service.MemberService;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class ProjectMainController {
	@Autowired
	private MemberService ms;
	
	@Autowired
	private ProjectService ps;
	
	@Autowired
	private TaskService ts;
	
	@RequestMapping("selectUserProject.me")
	public String selectUserProject(@ModelAttribute("loginUser") Member m, Model model, Project p) {
	
		List<Project> pjName = ps.selectUserProject(m);
		List<String> taskPjNonTaskList = new ArrayList<String>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(int i = 0; i < pjName.size(); i++) {
			System.out.println("프로젝트 이름 : " + pjName.get(i).getProjectName());
			map.put("userCode", m.getUserCode());
			map.put("projectName", pjName.get(i).getProjectName());
			
			
			taskPjNonTaskList.add(ts.selectPjNonTask(map));
			System.out.println(taskPjNonTaskList.get(i));
		}
		
		
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
		
		
	model.addAttribute("pjList", pjName);
	model.addAttribute("taskList", taskList);
	model.addAttribute("taskTitle", taskTitle);
	model.addAttribute("taskStatus", taskStatus);
	model.addAttribute("taskDate", taskDate);
	model.addAttribute("nonTaskCnt", nonTaskCnt);
	model.addAttribute("ingTaskCnt", ingTaskCnt);
	model.addAttribute("comTaskCnt", comTaskCnt);
	

	
	
	//return "";
	return "userInfo/userProjectMain/userProjectMain";
			
	}

}

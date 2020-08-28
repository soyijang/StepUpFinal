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
		System.out.println("pjName" + pjName);
		List<TaskList> taskPjNonTaskList = new ArrayList<TaskList>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		String pName = "";
		for(int i = 0; i < pjName.size(); i++) {
			System.out.println("프로젝트 이름 : " + pjName.get(i).getProjectName());
			map.put("userCode", m.getUserCode());
			pName = pjName.get(i).getProjectName();
			map.put("projectName", pName);
			taskPjNonTaskList.add(ts.selectPjNonTask(map));
			System.out.println(taskPjNonTaskList);
		}
		
		
		List<TaskList> taskTitleList = ts.selectUserTask(m);
		List<TaskList> taskStatusList = ts.selectUserTaskStatus(m);
		List<TaskList> taskIngList = ts.selectIngTask(m);
		List<TaskList> taskNonList = ts.selectNonTask(m);
		List<TaskList> taskComList = ts.selectComTask(m);
		List<TaskList> taskSumList = ts.selectSumTask(m);
		List<TaskList> taskDateList = ts.selectTaskDate(m);
		//List<TaskList> taskPjIngTaskList = ts.selectPjIngTask(m);
		
		
	model.addAttribute("pjList", pjName);
	model.addAttribute("taskTitleList", taskTitleList);
	model.addAttribute("taskStatusList", taskStatusList);
	model.addAttribute("taskIngList", taskIngList);
	model.addAttribute("taskNonList", taskNonList);
	model.addAttribute("taskComList", taskComList);
	model.addAttribute("taskSumList", taskSumList);
	model.addAttribute("taskDateList", taskDateList);
	
	
	return "userInfo/userProjectMain/userProjectMain";
			
	}

}

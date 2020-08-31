package com.stepup.agile.projectTask.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.projectTask.model.service.TaskService;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class TaskController {
	
	@Autowired
	private TaskService ts;
	
	@RequestMapping("createTask.pj")
	@ResponseBody
	public int createTask(Model model, @ModelAttribute("loginUser") Member m, TaskList t) {
		
		int taskCode = ts.createTask(m, t);
/*		TaskList taskList = new TaskList();
		taskList.setTaskCode(taskCode);*/
		
		System.out.println("멤버 : " + m);
		System.out.println("controller test: " + m.getUserCode());
		System.out.println("테스크 : " + t);
		System.out.println(taskCode);
		//model.addAttribute("TaskList", taskList);
		System.out.println("모달이모야?" + model);
		return taskCode;
	}
	
	@RequestMapping("updateTitle.pj")
	@ResponseBody
	/*public String updateTitle(Model model, Member m, TaskHistory th, @RequestParam(value="allData[]", required=false) List<String> title) {*/ 
	public String updateTitle(Model model, @ModelAttribute("loginUser") Member m, TaskHistory th, 
			                   @RequestParam(value="taskCode", required=false) int taskCode, 
			                   @RequestParam(value="taskHistValue", required=false) String taskHistValue, 
			                   @RequestParam(value="taskCategoryCode", required=false) String taskCategoryCode ) {	
				
		th.setTaskCode(taskCode); 
		th.setTaskHistValue(taskHistValue);
		th.setTaskCategoryCode(taskCategoryCode);
		th.setUserCode(m.getUserCode());
		/*
		 * th.setTaskCode(Integer.parseInt(title.get(0)));
		 * th.setTaskHistValue(title.get(1)); th.setTaskCategoryCode(title.get(2));
		 */
		
		System.out.println("th란"+th);
		int taskHistCode = ts.updateTitle(m,th);
		
		return taskHistValue;
	}
	
	/*
	 * @RequestMapping("updateTitle.pj")
	 * 
	 * @ResponseBody public List<String> updateTitle(Model model, Member m,
	 * TaskHistory th, @RequestParam(value="title[]") List<String> title) {
	 * 
	 * // int taskHistCode = ts.updateTitle(m, th);
	 * System.out.println(title.get(1)); System.out.println(title.get(2));
	 * System.out.println(title.get(3));
	 * 
	 * th.setUserCode(m.getUserCode()); li
	 * 
	 * int taskHistCode = ts.selectTitle(m, th, list);
	 * 
	 * String taskTitle = ts.selectTitle(taskHistCode, th);
	 * System.out.println(taskTitle); return "redirect:showSprintDetail.st"; }
	 */	
	
}
package com.stepup.agile.projectTask.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectBacklog.model.service.BacklogService;
import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectManage.model.service.ProjectService;
import com.stepup.agile.projectTask.model.service.TaskService;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class TaskController {
	
	@Autowired
	private BacklogService bs;
	
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
	public String updateTitle(Model model, Member m, TaskHistory th, @RequestParam(value="title[]", required=false) List<String> title) {
		
		th.setTaskHistValue(title.get(1));
		th.setTaskCategoryCode(title.get(2));
		
		int taskHistCode = ts.updateTitle(m, th);
		System.out.println(title.get(0));
		System.out.println(title.get(1));
		System.out.println(title.get(2));
		System.out.println(title.get(3));
		
		return "redirect:showSprintDetail.st";
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
	@RequestMapping("selectBugTask.tk")
	   public String selectBugTask(Model model, @ModelAttribute("loginUser") Member m) {
		   
		   List<TaskHistory> bglist = ts.selectBugTask(m);
		   
		   model.addAttribute("bgList", bglist);
		  
		   return "projectTask/bug/bug";
		   
	   }
	   
	   @RequestMapping("selectBugCont.tk")
	   public ModelAndView selectBugCont(ModelAndView mv, @ModelAttribute("loginUser") Member m, String tCode){
		   
		   int taskCode = Integer.parseInt(tCode);
		   HashMap<String, Object> map = new HashMap<String, Object>();
		   map.put("taskCode", taskCode);
		   map.put("userCode", m.getUserCode());
		   
		   List<TaskList> bgContList = ts.selectBugCont(map);
		   
		   mv.addObject("bgContList", bgContList);
		   mv.setViewName("jsonView");
		   return mv;
	   }
	   
	   @RequestMapping("insertCloneBug.tk")
	   @ResponseBody
	   public ModelAndView insertCloneBug(ModelAndView mv, @ModelAttribute("loginUser") Member m, int tCode, String bugtitle, String bugCont, int sprintCode){
		   
		   HashMap<String, Object> map = new HashMap<String, Object>();
		   map.put("taskCode", tCode);
		   map.put("userCode", m.getUserCode());
		   map.put("sprintCode", sprintCode);
		   
		   System.out.println(map.get("userCode"));
		   System.out.println(map.get("sprintCode"));
		   
		   int NewTaskCode = ts.insertCloneBug(map);
		   
		   HashMap<String, Object> map2 = new HashMap<String, Object>();
		   map2.put("userCode", Integer.valueOf(m.getUserCode()));
		   map2.put("bugtitle", bugtitle);
		   map2.put("bugCont", bugCont);
		   map2.put("taskCode", NewTaskCode);
		   
		   
		   System.out.println("map : " + map.get("userCode"));
		   System.out.println("map2 : " + map2.get("userCode"));
		   System.out.println("map2 taskCode : " + map2.get("taskCode"));
		   
		   
	       int insertClone = ts.insertCloneBug2(map2);
	       if(insertClone > 0) {
	    	   
	    	   mv.setViewName("jsonView");
	    	   return mv;
	       } else {
	    	   return mv;
	       }
			   
		   
	   }
	   @RequestMapping("deleteCloneBug.tk")
	   public ModelAndView DeleteCloneBug(ModelAndView mv, @ModelAttribute("loginUser") Member m, int tCode) {
		   HashMap<String, Object> map = new HashMap<String, Object>();
		   map.put("taskCode", tCode);
		   
		   int deleteClone = ts.deleteCloneBug(map);
		   
		   if(deleteClone > 0) {
			   mv.setViewName("jsonView");
			   return mv;
		   } else {
			   System.out.println("에러..");
			   return mv;
		   }
		   
	   }
	   @RequestMapping("searchBug.tk")
	   public ModelAndView searchBug(ModelAndView mv, @ModelAttribute("loginUser") Member m, String taskHistValue) {
		   HashMap<String, Object> map = new HashMap<String, Object>();
		   map.put("taskCont", taskHistValue);
		   map.put("userCode", m.getUserCode());
		   List<TaskHistory> searchBugList1 = new ArrayList<TaskHistory>();
		   List<TaskHistory> searchBugList2 = new ArrayList<TaskHistory>();
		   
		   if(taskHistValue.equals("")) {
			   searchBugList1 = ts.selectBugTask(m);
			   mv.addObject("searchBugList1", searchBugList1);
			   mv.setViewName("jsonView");
			   
			   return mv;
		   } else {
			   searchBugList2 = ts.searchBug(map);
			   
			   mv.addObject("searchBugList2", searchBugList2);
			   mv.setViewName("jsonView");
			   
			   return mv;
		   }
		   
	   }
	   
	   @RequestMapping("selectTimeLine.tk")
	   public String selectTimeLine(Model model, @ModelAttribute("loginUser") Member m) {
		   
		  
		   return "projectManage/projectTimeLine/projectTimeLine";
		   
	   }
	   
	   @RequestMapping("timelineTask.tk")
	   public ModelAndView timelineTask(@ModelAttribute("loginUser") Member m, Model model, ModelAndView mv) {
		   List<TaskHistory> selectTaskList = new ArrayList<TaskHistory>();
		   List<Sprint> selectSprintList = new ArrayList<Sprint>();
		   System.out.println(m.getUserCode());
		   
		   selectTaskList = ts.selectUserTask(m);
		   selectSprintList = bs.selectSprintList(m);
		   
		   
		   mv.addObject("taskList", selectTaskList);
		   mv.addObject("SprintList", selectSprintList);
		   mv.setViewName("jsonView");
		   
		   return mv;
	   }
}
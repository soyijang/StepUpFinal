package com.stepup.agile.projectTask.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
   public String createTask(Model model, @ModelAttribute("loginUser") Member m) {
      
      int result = ts.createTask(m);
      
      if(result > 0) {
         System.out.println("controller : " + result);
         return "projectTask/taskDetail";
      } else {
         model.addAttribute("msg", "테스크 생성 실패!");
         return "common/errorPage";
      }
   }
   
   @RequestMapping("updateTitle.pj")
   public String updateTitle(Model model, @ModelAttribute("loginUser") Member m) {
      
      int result = ts.updateTitle(m);
      
      if(result > 0) {         
         return "projectTask/taskDetail";
      } else {
         model.addAttribute("msg", "테스크 수정 실패!");
         return "common/errorPage";
      }
   }
   
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
   
}
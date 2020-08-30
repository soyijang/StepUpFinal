package com.stepup.agile.projectTask.controller;

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
	   
	   List<TaskList> bglist = ts.selectBugTask(m);
	   
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
   public ModelAndView insertCloneBug(ModelAndView mv, @ModelAttribute("loginUser") Member m, String tCode, String bugtitle, String bugYN, String bugCont){
	   int taskCode = Integer.parseInt(tCode);
	   
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   map.put("taskCode", taskCode);
	   map.put("userCode", m.getUserCode());
	   map.put("bugtitle", bugtitle);
	   map.put("bugYN", bugYN);
	   map.put("bugCont", bugCont);
	   
	   System.out.println(map.keySet());
	   
	   int result = ts.insertCloneBug(map);
	   List<TaskList> bgContList = new ArrayList<TaskList>();
	   
	   if(result > 0) {
		   //bgContList = ts.selectBugCont(map);
		   int insertClone = ts.insertCloneBug2(map);
		   
		   mv.addObject("bgContList", bgContList);
		   mv.setViewName("jsonView");
		   return mv;
	   } else {
		   System.out.println("그냥도 안된거");
		   return mv;
	   }
	   
   }
   
}
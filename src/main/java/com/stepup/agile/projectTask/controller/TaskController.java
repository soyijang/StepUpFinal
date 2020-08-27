package com.stepup.agile.projectTask.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.projectTask.model.service.TaskService;
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
	   
	   return "projectTask/bug/bug";
	   
   }
   
}
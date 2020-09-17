package com.stepup.agile.common;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PageMove {

   @RequestMapping("loginfirst.me")
   public String selectSprint(Model model) {
      
      return "userInfo/loginOut/login";
      
   }


   @RequestMapping("loginSecond.me")
   public String afterLogin(Model model) {
      
      return "main/mainAfterLogin";
      
   }
   
}
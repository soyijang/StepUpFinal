package com.stepup.agile.projectManage.controller;

import java.util.ArrayList;
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
		   
		   
		   mv.addObject("ProjectList", selectTimelineProject);
		   mv.setViewName("jsonView");
		   
		   return mv;
	   }
	
}

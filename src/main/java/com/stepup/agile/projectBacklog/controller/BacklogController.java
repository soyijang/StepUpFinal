package com.stepup.agile.projectBacklog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectBacklog.model.service.BacklogService;
import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes({"loginUser", "projectCodeNew", "userProjectCodeNew"})
@Controller
public class BacklogController {
	
	@Autowired
	private BacklogService bs;
	
//	스프린트 목록조회용
	@RequestMapping("showSprintMain.st")
	public String selectSprint(Model model, @ModelAttribute("loginUser") Member m,
			@ModelAttribute("projectCodeNew") int projectCode, @ModelAttribute("userProjectCodeNew") int userProjectCode) {
		//스프린트 목록부터 조회
		List<Sprint> sprintList;
		sprintList = bs.selectSprint(m, projectCode);
		
		model.addAttribute("sprintList", sprintList);
		System.out.println("sprintList :" + sprintList);
		return "projectBacklog/projactBacklog";
		
	}
	
//	스프린트 상세정보 조회용
	@RequestMapping(value="showSprintDetail.st",method=RequestMethod.POST)
	public ModelAndView selectSprintOne(@ModelAttribute("loginUser") Member m, int sprintCode, ModelAndView mv) {
		
		SprintHistory sprintList;
		sprintList = bs.selectSprintOne(m, sprintCode);
		mv.addObject("sprint", sprintList);
		mv.setViewName("jsonView");
		
		return mv;
		
	}
	
//	스프린트 추가용
	@RequestMapping(value="insert.st",method=RequestMethod.POST)
	public String insertSprint(Model model, 
			@ModelAttribute("projectCodeNew") int projectCode, @ModelAttribute("userProjectCodeNew") int userProjectCode) {
		
		int result = bs.insertSprint(userProjectCode);
		System.out.println("스프린트 생성할때 userProjectCode : " + userProjectCode);
		
		if(result>0) {
			
			System.out.println("스프린트 추가성공! main으로 가라");
			return "redirect:showSprintMain.st";
		}else {
			model.addAttribute("msg", "스프린트 생성을 실패하였습니다!");
			return "common/errorPage";
		}
		
	}
	
//	테스크목록 출력용 
	@RequestMapping(value="showTaskDetail.st",method=RequestMethod.POST)
	public ModelAndView selectSprintTask(@ModelAttribute("loginUser") Member m, int sprintCode, ModelAndView mv) {
		
		List<TaskHistory> sprintTaskList;
		sprintTaskList = bs.selectSprintTask(m, sprintCode);
		mv.addObject("sprintTaskList", sprintTaskList);
		mv.setViewName("jsonView");
		
		return mv;
		
	}
	
//	스프린트 편집용
	@RequestMapping("update.st")
	public String updateSprint(Model model, SprintHistory sprintHistory) {
		
		int result = bs.updateSprint(sprintHistory);
		
		if(result>0) {
			return "redirect:showSprintMain.st";
		}else {
			model.addAttribute("msg", "스프린트 생성을 실패하였습니다!");
			return "common/errorPage";
		}
		
	}
	
//  스프린트 종료용
	@RequestMapping("updateFinish.st")
	public String updateFinish(Model model, SprintHistory sprintHistory) {
		
		int result = bs.updateFinish(sprintHistory);
		
		if(result == 1) {
			return "redirect:showSprintMain.st";
		}if(result == 2) {
			model.addAttribute("alertmsg", "아직 진행중이거나 미진행한 Task가 존재합니다! 모든 Task를 종료 후에 스프린트를 종료해주세요.");
			model.addAttribute("url", "showSprintMain.st");
			return "common/alert";
		}else {
			model.addAttribute("msg", "스프린트 종료를 실패하였습니다!");
			return "common/errorPage";
		}
		
	}
	
//  스프린트 시작용
	@RequestMapping("updateStart.st")
	public String updateStart(Model model, SprintHistory sprintHistory) {
		
		int result = bs.updateStart(sprintHistory);
		
		if(result == 1) {
			return "redirect:showSprintMain.st";
		}if(result == 2) {
			model.addAttribute("alertmsg", "이미 진행중인 스프린트가 존재합니다! 종료 후에 시작해주세요.");
			model.addAttribute("url", "showSprintMain.st");
			return "common/alert";
		}else {
			model.addAttribute("msg", "스프린트 시작를 실패하였습니다!");
			return "common/errorPage";
		}
	}
	
//	테스크종료
	@RequestMapping("finishTask.st")
	public String insertTask(Model model, @RequestParam(value="taskCode",required=false) int taskCode) {
		
		int result = bs.updateTask(taskCode);
		
		if(result>0) {
			return "redirect:showSprintMain.st";
		}else {
			model.addAttribute("msg", "테스크 종료처리를 실패하였습니다!");
			return "common/errorPage";
		}
		
	}	
	
	
//	스프린트 검색용
	@RequestMapping(value="searchSprint.st",method=RequestMethod.POST)
	public ModelAndView searchSprint(@ModelAttribute("loginUser") Member m, String sprintName, ModelAndView mv) {
		
		//스프린트 목록부터 조회
		List<Sprint> searchSprint;
		searchSprint = bs.searchSprint(m,sprintName);
		mv.addObject("searchSprint", searchSprint);
		mv.setViewName("jsonView");
		
		return mv;
		
	}	
	
	
	
	
	
	
	
	
}

package com.stepup.agile.projectBacklog.controller;

import java.util.List;

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

@SessionAttributes("loginUser")
@Controller
public class BacklogController {
	
	@Autowired
	private BacklogService bs;
	
//	스프린트 목록조회용
	@RequestMapping("showSprintMain.st")
	public String selectSprint(Model model, @ModelAttribute("loginUser") Member m) {
		
		//스프린트 목록부터 조회
		List<Sprint> sprintList;
		sprintList = bs.selectSprint(m);
		model.addAttribute("sprintList", sprintList);
		System.out.println(sprintList);
		/*
		 * //가져온애들중에 코드만 뽑아서 다시 보내 int sprintCodeList[] = new int[sprintList.size()];
		 * for(int i=0; i<sprintList.size(); i++) { sprintCodeList[i] =
		 * sprintList.get(i).getSprintCode(); } int sprintTaskCount[] =
		 * bs.sprintTaskCount(sprintCodeList); model.addAttribute("sprintTaskCount",
		 * sprintTaskCount);
		 */
		
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
	@RequestMapping("insert.st")
	public String insertSprint(Model model, @RequestParam(value="userProjectCode",required=false) int userProjectCode) {
		
		int result = bs.insertSprint(userProjectCode);
		
		if(result>0) {
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
		
		if(result>0) {
			return "redirect:showSprintMain.st";
		}else {
			model.addAttribute("msg", "스프린트 종료를 실패하였습니다!");
			return "common/errorPage";
		}
		
	}
	
//  스프린트 시작용
	@RequestMapping("updateStart.st")
	public String updateStart(Model model, SprintHistory sprintHistory) {
		
		int result = bs.updateStart(sprintHistory);
		
		System.out.println("컨트롤러가 받은 result : " +result);
		if(result == 1) {
			System.out.println("설마이게실행되겠어?");
			return "redirect:showSprintMain.st";
		}if(result == 2) {
			System.out.println("이게정상");
			model.addAttribute("alertmsg", "이미 진행중인 스프린트가 존재합니다! 종료 후에 시작해주세요.");
			model.addAttribute("url", "showSprintMain.st");
			return "common/alert";
		}else {
			model.addAttribute("msg", "스프린트 시작를 실패하였습니다!");
			return "common/errorPage";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

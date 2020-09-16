package com.stepup.agile.userMyTasks.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.service.MyTasksService;
import com.stepup.agile.userMyTasks.model.vo.MyTask;
import com.stepup.agile.userMyTasks.model.vo.MyTaskShare;

@SessionAttributes("loginUser")
@Controller
public class MyTasksController {
	
	@Autowired
	private MyTasksService ts;
	
	// 테스크 조회용
	@RequestMapping("MyTaskList.mt")
	public String selectTaskList(Model model, @ModelAttribute("loginUser") Member m) {
		
		//스프린트 목록부터 조회
		List<MyTask> myTaskList;
		myTaskList = ts.selectTaskList(m);
		model.addAttribute("myTaskList", myTaskList);		
		
		//미해결업무 카운팅
		int countN = 0;
		for(int i=0; i<myTaskList.size(); i++) {
			if(myTaskList.get(i).getMyTasksTodoYN().equals("N")) {
				countN++;
			}
		}
		model.addAttribute("countN",countN);
		
		//미래업무 제외
		int future =0;
		Date today = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("yyyyMMdd");
		int today2 = Integer.parseInt(fm.format(today));
		
		for(int i=0; i<myTaskList.size(); i++) {
			String startDay[] = (myTaskList.get(i).getMyTasksstartDate()).split("-");
			String startDay2 =  startDay[0] +  startDay[1]+ startDay[2];
			int startDay3 = Integer.parseInt(startDay2);
					
			if(today2 < startDay3) {
				future++;
			}
		}
		model.addAttribute("future",future);
		
		return "userMyTasks/userMyCalendar/userCalendarMain";
	}
	
	// 테스크 조회용2
	@RequestMapping(value="MyTaskListReset.mt",method=RequestMethod.POST)
	public ModelAndView selectTaskListReset(ModelAndView mv, @ModelAttribute("loginUser") Member m) {
		
		//스프린트 목록부터 조회
		List<MyTask> myTaskList;
		myTaskList = ts.selectTaskList(m);
		mv.addObject("myTaskList", myTaskList);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	// 달력 테스크 조회용(ajax)
	@RequestMapping(value="MyTaskCalendar.mt",method=RequestMethod.POST)
	public ModelAndView selectTaskCalendar(@ModelAttribute("loginUser") Member m, ModelAndView mv) {
		
		//스프린트 목록부터 조회
		List<MyTask> myTaskList2;
		myTaskList2 = ts.selectTaskList(m);
		mv.addObject("myTaskCalendar", myTaskList2);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	// 달력 테스크 YN업데이트용 (ajax)
	@RequestMapping(value="UpdateMyTaskYN.mt",method=RequestMethod.POST)
	public ModelAndView updateMyTaskYN(@ModelAttribute("loginUser") Member m,
										int myTasksCode, String myTasksTodoYN, ModelAndView mv) {
		
		int result = 0;
		result = ts.updateMyTaskYN(m, myTasksTodoYN, myTasksCode);
		mv.addObject("result", result);
		mv.setViewName("jsonView");
		return mv;
		
	}
	
	// 달력 테스크 업데이트용 
	@RequestMapping("update.mt")
	public String updateMyTask(Model model, MyTask mytask) {
		
		int result = 0;
		result = ts.updateMyTask(mytask);
		
		if(result>0) {
			return "redirect:MyTaskList.mt";
		}else {
			model.addAttribute("msg", "테스크 수정을 실패하였습니다!");
			return "common/errorPage";
		}
		
	}
	
	// 달력 테스크 추가용
	@RequestMapping("insert.mt")
	public String insertMyTask(Model model, MyTask mytask) {
		
		int result = 0;
		result = ts.insertMyTask(mytask);
		
		if(result>0) {
			return "redirect:MyTaskList.mt";
		}else {
			model.addAttribute("msg", "테스크 추가를 실패하였습니다!");
			return "common/errorPage";
		}
		
	}
	
	// 달력 테스크 삭제용
	@RequestMapping("delete.mt")
	public String deleteMyTask(Model model, MyTask mytask) {
		
		int result = 0;
		result = ts.deleteMyTask(mytask);
		
		if(result>0) {
			return "redirect:MyTaskList.mt";
		}else {
			model.addAttribute("msg", "테스크 삭제를 실패하였습니다!");
			return "common/errorPage";
		}
		
	}
	
	// 공유된 테스크 조회용(ajax)
	@RequestMapping(value="shareMyTasks.mt",method=RequestMethod.POST)
	public ModelAndView selectShareMyTasks(@ModelAttribute("loginUser") Member m, ModelAndView mv) {
		
		//스프린트 목록부터 조회
		List<MyTask> sharedTaskList;
		sharedTaskList = ts.selectShareMyTasks(m);
		mv.addObject("sharedTaskList", sharedTaskList);
		mv.setViewName("jsonView");
		return mv;
	}
	
	// 공유 테스크 추가용
	@RequestMapping("share.mt")
	public String insertShareMyTask(Model model, @ModelAttribute("loginUser") Member m, MyTaskShare mytask) {
		
		int result = 0;
		result = ts.insertShareMyTask(mytask);
		
		if(result>0) {
			return "redirect:MyTaskList.mt";
		}else {
			model.addAttribute("msg", "테스크 공유를 실패하였습니다!");
			return "common/errorPage";
		}
		
	}
}

package com.stepup.agile.projectTask.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.service.TaskService;
import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

import net.sf.json.JSONArray;

@SessionAttributes("loginUser")
@Controller
public class TaskController {

	@Autowired
	private TaskService ts;

	@RequestMapping("createTask.pj")
	@ResponseBody
	public int createTask(Model model, @ModelAttribute("loginUser") Member m, TaskList t) {

		int taskCode = ts.createTask(m, t);
		/*
		 * TaskList taskList = new TaskList(); taskList.setTaskCode(taskCode);
		 */

		System.out.println("멤버 : " + m);
		System.out.println("controller test: " + m.getUserCode());
		System.out.println("테스크 : " + t);
		System.out.println(taskCode);
		// model.addAttribute("TaskList", taskList);
		System.out.println("모달이모야?" + model);
		return taskCode;
	}

	@RequestMapping("updateTitle.pj")
	@ResponseBody
	public String updateTitle(Model model, Member m, TaskHistory th,
			@RequestParam(value = "title[]", required = false) List<String> title) {

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
		   List<ReplyHistory> r = ts.selectReply(map);
		   
		   mv.addObject("replyHistory", r);
		   mv.addObject("bgContList", bgContList);
		   mv.setViewName("jsonView");
		   return mv;
	   }
	   
	   @RequestMapping("insertCloneBug.tk")
	   @ResponseBody
	   public ModelAndView insertCloneBug(ModelAndView mv, @ModelAttribute("loginUser") Member m, int tCode, String bugtitle, String bugCont, int sprintCode, String taskLevel, int taskMaster, int headTaskCode){
		   
		   HashMap<String, Object> map = new HashMap<String, Object>();
		   map.put("taskCode", tCode);
		   map.put("userCode", m.getUserCode());
		   map.put("sprintCode", sprintCode);
		   map.put("taskLevel", taskLevel);
		   map.put("taskMaster", taskMaster);
		   
		   if(taskLevel.equals("상위")) {
			   map.put("headTaskCode", (null));
		   } else if(taskLevel.equals("서브")) {
			   map.put("headTaskCode", headTaskCode);
		   }
		   
		   
		   System.out.println("마스터" + map.get("taskMaster"));
		   System.out.println("레벨" + map.get("taskLevel"));
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
		   System.out.println(map.get("userCode"));
		   System.out.println(map.get("taskCont"));
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

//miso Kim's task ------------------------------------------------------------------------------------

//테스크 리스트 조회 후 보드 메인 view로 이동(현재 진행중인 스프린트의 tasklist만 조회)
	@RequestMapping("showTaskBoardMain.tk")
	public String selectTaskList(Locale locale, Model model, @ModelAttribute("loginUser") Member m, Project p) {
		// hashmap에 쿼리문 조건에 사용할 사용자 정보(email)과 프로젝트 코드 담기
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 프로젝트 받아오고 나서 수정하기
		// map.put("projectCode", p.getProjectCode());
		map.put("userEmail", m.getUserEmail());

		// taskHistory vo 기준으로 data return 받기 (resultSet 데이터별 고유 값이 taskHistoryCode라서)
		List<TaskHistory> taskList;
		List<TaskList> mainTaskList = new ArrayList<TaskList>();
		List<TaskList> subTaskList = new ArrayList<TaskList>();
		taskList = ts.selectTaskList(map);
		if (taskList != null) {

			// 중복 내용 정리
			List<TaskList> selectedTaskList = new ArrayList<TaskList>();
			for (int i = 0; i < taskList.size(); i++) {
				// i가 0일때는 그냥 selectedTaskList에 넣어주기
				if (i == 0) {
					selectedTaskList.add(taskList.get(0).getTaskList());
					// i가 0이 아니고 앞에있는 테스크 코드와 다를 경우에만 selectedTaskList에 넣어주기
				} else if (taskList.get(i).getTaskList().getTaskCode() != taskList.get(i - 1).getTaskList()
						.getTaskCode()) {
					selectedTaskList.add(taskList.get(i).getTaskList());
				}
			}
			
			// 상위 하위 테스크 구분
			for (int j = 0; j < selectedTaskList.size(); j++) {
				if (selectedTaskList.get(j).getTaskLevel().equals("상위")) {
					mainTaskList.add(selectedTaskList.get(j));
				} else {
					subTaskList.add(selectedTaskList.get(j));
				}
			}
			
			//model.addAttribute("taskList", taskList);
			// 중복 제거한 테스크 정보
			//-- model.addAttribute("selectedTaskList", selectedTaskList);
			//model.addAttribute("mainTaskList", mainTaskList);
			//model.addAttribute("subTaskList", subTaskList);
			
			//JSONArray jsonArray = new JSONArray();
			model.addAttribute("jsonList1", JSONArray.fromObject(taskList));
			model.addAttribute("jsonList2", JSONArray.fromObject(mainTaskList));
			model.addAttribute("jsonList3", JSONArray.fromObject(subTaskList));
			return "projectTask/projectTaskBoard/projectTaskBoard";
		} else {
			model.addAttribute("msg", "테스크 조회 실패!");
			return "common/errorPage";
		}
	}

//----------------------------------------------------------------------------------------------------

}
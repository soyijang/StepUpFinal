package com.stepup.agile.projectTask.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.service.TaskService;
import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

import net.sf.json.JSONArray;

@SessionAttributes("loginUser")
@Controller
public class TaskController {
	@Autowired
	private TaskService ts;

	//Task생성
	@RequestMapping(value="/createTask.pj", method = RequestMethod.POST)
	@ResponseBody 
	public HashMap<String, Object> createTask(Model model, @ModelAttribute("loginUser") Member m, TaskList t) {

		int taskCode = ts.createTask(m, t);
		/*		TaskList taskList = new TaskList();
		taskList.setTaskCode(taskCode);*/
		System.out.println(taskCode);

		TaskList list = ts.selectTask(t.getTaskCode());
		//model.addAttribute("TaskList", taskList);
		System.out.println("모달이모야?" + list);
		
		HashMap<String, Object>map = new HashMap<String, Object>();
	
		/*
		 * mv.addObject("list", list); mv.setViewName("jsonViews");
		 */
		 map.put("list", list);
		 
		
		return map;
	}

	//Task Contents 생성
	//1.Task Title 수정
	@RequestMapping(value="/updateTitle.pj", produces = "application/text; charset=utf8")
	@ResponseBody
	/*public String updateTitle(Model model, Member m, TaskHistory th, @RequestParam(value="allData[]", required=false) List<String> title) {*/ 
	public String updateTitle(Model model, @ModelAttribute("loginUser") Member m, TaskHistory th, 
			@RequestParam(value="taskCode", required=false) int taskCode, 
			@RequestParam(value="taskHistValue", required=false) String taskHistValue, 
			@RequestParam(value="taskCategoryCode", required=false) String taskCategoryCode ) {	

		th.setTaskCode(taskCode); 
		th.setTaskHistValue(taskHistValue);
		th.setTaskCategoryCode(taskCategoryCode);
		th.setUserCode(m.getUserCode());
		/*
		 * th.setTaskCode(Integer.parseInt(title.get(0)));
		 * th.setTaskHistValue(title.get(1)); th.setTaskCategoryCode(title.get(2));
		 */

		System.out.println("th란"+th);
		int taskHistCode = ts.updateTitle(m,th);

		return taskHistValue;
	}


	//2. Task Description 수정
	@RequestMapping(value="/updateDescipt.pj", produces = "application/text; charset=utf8")
	@ResponseBody
	public ModelAndView updateDescript(ModelAndView mv, @ModelAttribute("loginUser") Member m, TaskHistory th, 
			@RequestParam(value="taskCode", required=false) int taskCode, 
			@RequestParam(value="summernote", required=false) String summernote, 
			@RequestParam(value="taskCategoryCode", required=false) String taskCategoryCode ) {

		/*
		 * th.setTaskCode(Integer.parseInt(title.get(0)));
		 * th.setTaskHistValue(title.get(1)); th.setTaskCategoryCode(title.get(2));
		 * th.setUserCode(m.getUserCode());
		 */
		th.setTaskCode(taskCode);
		th.setTaskHistValue(summernote);
		th.setTaskCategoryCode(taskCategoryCode);
		th.setUserCode(m.getUserCode());

		System.out.println("왜안와"+summernote);
		System.out.println("th란"+th);
		int taskHistCode = ts.updateDescript(th);

		TaskHistory history = ts.selectDescript(taskHistCode);

		mv.addObject("history", history);
		mv.setViewName("jsonView");

		return mv;
	}

	//3.Sub-Task 생성
	@RequestMapping(value="/insertSubTask.pj",method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public ModelAndView insertSubTask(ModelAndView mv, @ModelAttribute("loginUser") Member m, TaskList t, TaskHistory th,
											int headTaskCode, String subTaskTitle,String taskCategoryCode) {

		t.setTaskUser(m.getUserCode());
		t.setHeadTaskCode(headTaskCode);
		int subTaskCode = ts.createSubTask(t);

		th.setTaskHistValue(subTaskTitle);
		th.setTaskCategoryCode(taskCategoryCode);
		th.setTaskCode(subTaskCode);
		th.setUserCode(m.getUserCode());

		int taskHistCode = ts.updateSubTitle(th);

		/*
		 * Map<String, Object> map = new HashMap<String, Object>();
		 * map.put("headTaskCode", headTaskCode); System.out.println(map);
		 */
		
		List<ReplyHistory> history = ts.selectSubTitle(headTaskCode);

		mv.addObject("history", history);
		mv.setViewName("jsonView");

		return mv;
	}

	//4.댓글 생성
	@RequestMapping(value="/insertReply.pj", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public ModelAndView insertReply(ModelAndView mv, @ModelAttribute("loginUser") Member m, ReplyList replyList, ReplyHistory history,
							int taskCode, String reply, String taskCategoryCode) {

		replyList.setUserCode(m.getUserCode());
		System.out.println(reply);
		int replyCode = ts.insertReply(replyList);
		
		history.setReplyCode(replyCode);
		history.setReplyContents(reply);
		
		int histCode = ts.updateReplyHist(history);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replyHistCode", histCode);
		map.put("taskCode", taskCode);
		
		List<ReplyHistory> r = ts.selectReply(map);

		mv.addObject("replyHistory", r); 
		mv.setViewName("jsonView");


		return mv;
	}
	//4-1.댓글 수정
	@RequestMapping("updateReply.pj")
	public ModelAndView updateReply(ModelAndView mv, @ModelAttribute("loginUser") Member m, int replyCode, int userCode) {
		
		if(m.getUserCode() == userCode) {
			int result = ts.updateReply(replyCode);
			
			mv.addObject("result", result);
			mv.setViewName("jsonView");
			
			if(result > 0) {

				mv.setViewName("jsonView");
				return mv;
			} else {
				return mv;
			}
		} else {
			return mv;
		}
	}
	
	//4-2.댓글삭제
	@RequestMapping("deleteReply.pj")
	public ModelAndView deleteReply(ModelAndView mv, @ModelAttribute("loginUser") Member m, int replyCode, int userCode) {
		
		if(m.getUserCode() == userCode) {
			int result = ts.deleteReply(replyCode);
			
			mv.addObject("result", result);
			mv.setViewName("jsonView");
			
			if(result > 0) {

				mv.setViewName("jsonView");
				return mv;
			} else {
				return mv;
			}
		} else {
			return mv;
		}
	}

	//5.담당자 선택
	@RequestMapping("selectTeam.pj")
	public ModelAndView selectTeam(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode) {
						
		int userCode = m.getUserCode();
		System.out.println(userCode);		
		List<Member> list = ts.selectTeam(userCode);
						
		System.out.println("리스트" + list);
				
		mv.addObject("list", list); 
		mv.setViewName("jsonView");
						
			return mv;
		}	
	
	@RequestMapping("updateUser.pj")
	public ModelAndView taskUser(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode, int Code, String Name) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("taskCode", taskCode);
		map.put("userCode", Code);
		map.put("taskHistValue", Name);
		System.out.println(map);
		int result = ts.taskUser(map);
		System.out.println(Code);
	
	//	int listCode = ts.updateTaskList(result);
		
		mv.addObject("result", result);
		mv.setViewName("jsonView");
		
		return mv;
	}


	//6.보고자 선택
	@RequestMapping("selectTeam2.pj")
	public ModelAndView selectTeam2(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode) {
						
		int userCode = m.getUserCode();
		System.out.println(userCode);		
		List<Member> list = ts.selectTeam2(userCode);
						
		System.out.println("리스트" + list);
				
		mv.addObject("list", list); 
		mv.setViewName("jsonView");
						
			return mv;
		}	
	@RequestMapping("updateMaster.pj")
	public ModelAndView updateMaster(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode, int Code, String Name) {
		System.out.println(taskCode);
		System.out.println(Code);
		System.out.println(Name);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("taskCode", taskCode);
		map.put("masterCode", Code);
		map.put("memberName", Name);

		int result = ts.taskMaster(map);
		System.out.println(Code);
		
		int listCode = ts.updateTaskList2(result);
		
		mv.addObject("listCode", listCode);
		mv.setViewName("jsonView");
		
		return mv;
	}

	//7.레이블 선택
	@RequestMapping(value="/insertLabel.pj", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ModelAndView insertLabel(ModelAndView mv, @ModelAttribute("loginUser") Member m, TaskHistory th,
			String labelText, int taskCode, String taskCategoryCode) {

		th.setTaskCode(taskCode);
		th.setTaskCategoryCode(taskCategoryCode);
		th.setTaskHistValue(labelText);
		th.setUserCode(m.getUserCode());

		int taskHistCode = ts.createLabel(th);

		TaskHistory history = ts.selectLabel(taskHistCode);

		mv.addObject("history", history);
		mv.setViewName("jsonView");
		System.out.println("mv란"+mv);
		return mv;
	}

	//8.Story Point 선택
	@RequestMapping(value="/insertPoint.pj", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ModelAndView insertPoint(ModelAndView mv, @ModelAttribute("loginUser") Member m, TaskHistory th,
			String taskHistValue, int taskCode, String taskCategoryCode) {

		th.setTaskCode(taskCode);
		th.setTaskCategoryCode(taskCategoryCode);
		th.setTaskHistValue(taskHistValue);
		th.setUserCode(m.getUserCode());

		int taskHistCode = ts.insertPoint(th);

		TaskHistory history = ts.selectPoint(taskHistCode);
		System.out.println(history);
		mv.addObject("history", history);
		mv.setViewName("jsonView");
		System.out.println("mv란"+mv);
		return mv;
	}
	//9.최초예상 선택
	@RequestMapping(value="/insertExpect.pj", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ModelAndView insertExpect(ModelAndView mv, @ModelAttribute("loginUser") Member m, TaskHistory th,
			String expectText, int taskCode, String taskCategoryCode) {

		th.setTaskCode(taskCode);
		th.setTaskCategoryCode(taskCategoryCode);
		th.setTaskHistValue(expectText);
		th.setUserCode(m.getUserCode());
		System.out.println(expectText);
		int taskHistCode = ts.createExpect(th);

		TaskHistory history = ts.selectExpect(taskHistCode);
		System.out.println(history);
		mv.addObject("history", history);
		mv.setViewName("jsonView");
		System.out.println("mv란"+mv);
		return mv;
	}
	//10.시간추적 선택

	//11.우선순위 선택
	@RequestMapping("taskProperty1.pj")
	@ResponseBody
	public ModelAndView taskProperty1(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode, String high, TaskHistory t) {

		t.setTaskCode(taskCode);
		t.setUserCode(m.getUserCode());
		t.setTaskHistValue("high");

		int taskHistCode = ts.taskProperty1(t);
		System.out.println(taskHistCode);
		TaskHistory th = ts.taskPropertySelect1(taskHistCode);
		System.out.println(th);
		mv.addObject("taskHistory", th);
		mv.setViewName("jsonView");
		
		return mv;
	}
	@RequestMapping("taskProperty2.pj")
	@ResponseBody
	public ModelAndView taskProperty2(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode, TaskHistory t) {
		
		t.setTaskCode(taskCode);
		t.setUserCode(m.getUserCode());
		t.setTaskHistValue("medium");

		int taskHistCode = ts.taskProperty2(t);
		System.out.println(taskHistCode);
		TaskHistory th = ts.taskPropertySelect2(taskHistCode);
		System.out.println(th);
		mv.addObject("taskHistory", th);
		mv.setViewName("jsonView");
		
		return mv;
	}
	@RequestMapping("taskProperty3.pj")
	@ResponseBody
	public ModelAndView taskProperty3(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode, TaskHistory t) {
		
		t.setTaskCode(taskCode);
		t.setUserCode(m.getUserCode());
		t.setTaskHistValue("medium");

		int taskHistCode = ts.taskProperty3(t);
		System.out.println(taskHistCode);
		TaskHistory th = ts.taskPropertySelect3(taskHistCode);
		System.out.println(th);
		mv.addObject("taskHistory", th);
		mv.setViewName("jsonView");
		
		return mv;
	}
	//12.진행상태 변경
	@RequestMapping("taskStatus1.pj")
	@ResponseBody
	public ModelAndView taskStatus1(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode, String input, TaskHistory t) {
		
		t.setTaskCode(taskCode);
		t.setUserCode(m.getUserCode());
		t.setTaskHistValue("medium");

		int taskHistCode = ts.taskStatus1(t);
		System.out.println(taskHistCode);
		TaskHistory th = ts.taskStatusSelect1(taskHistCode);
		System.out.println(th);
		mv.addObject("taskHistory", th);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("taskStatus2.pj")
	@ResponseBody
	public ModelAndView taskStatus2(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode, String input, TaskHistory t) {
		
		t.setTaskCode(taskCode);
		t.setUserCode(m.getUserCode());
		t.setTaskHistValue("medium");

		int taskHistCode = ts.taskStatus2(t);
		System.out.println(taskHistCode);
		TaskHistory th = ts.taskStatusSelect2(taskHistCode);
		System.out.println(th);
		mv.addObject("taskHistory", th);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//13.파일업로드
	

	  

	//14.복제 클릭 이벤트
	@RequestMapping("insertCloneTask.pj")
	@ResponseBody
	public ModelAndView insertCloneTask(ModelAndView mv, @ModelAttribute("loginUser") Member m, 
										int taskCode, int sprintCode, String subTaskTitle, String replyContents, String memberName,
										String labelText,String taskpointText,String expectText, String high, String medium, String low,
										String work, String done, String summernote, String titleName){

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", m.getUserCode());
		map.put("sprintCode", sprintCode);/*
											 * map.put("taskCode", taskCode);
											 */

		System.out.println(map.get("userCode"));
		System.out.println(map.get("sprintCode"));
		System.out.println(map.get("taskCode"));

		int NewTaskCode = ts.insertCloneTask(map);

		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("userCode", Integer.valueOf(m.getUserCode()));
		map2.put("taskCode", NewTaskCode);
		map2.put("subTaskTitle", subTaskTitle);
		map2.put("replyContents", replyContents);
		map2.put("memberName", memberName);
		map2.put("labelText", labelText);
		map2.put("taskpointText", taskpointText);
		map2.put("expectText", expectText);
		map2.put("high", high);
		map2.put("medium", medium);
		map2.put("low", low);
		map2.put("work", work);
		map2.put("done", done);
		map2.put("summernote", summernote);
		map2.put("titleName", titleName);


		System.out.println("map : " + map.get("userCode"));
		System.out.println("map2 : " + map2.get("userCode"));
		System.out.println("map2 taskCode : " + map2.get("taskCode"));


		int insertClone = ts.insertCloneTask2(map2);
		if(insertClone > 0) {
			
			
			mv.setViewName("jsonView");
			return mv;
		} else {
			return mv;
		}


	}

	//15.복제테스크 삭제 이벤트
	@RequestMapping("deleteCloneTask.pj")
	public ModelAndView DeleteCloneTask(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("taskCode", taskCode);

		int deleteClone = ts.deleteCloneTask(map);

		if(deleteClone > 0) {
			mv.setViewName("jsonView");
			return mv;
		} else {
			System.out.println("에러..");
			return mv;
		}

	}




	//BugTask
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

	 //miso Kim's task --------------------------------------------------------------------------------------------------------

	 //테스크 리스트 조회 후 보드 메인 view로 이동(현재 진행중인 스프린트의 tasklist만 조회)
	 	@RequestMapping("showTaskBoardMain.tk")
	 	public String selectTaskList(Locale locale, Model model, @ModelAttribute("loginUser") Member m, Project p) {
	 		// hashmap에 쿼리문 조건에 사용할 사용자 정보(email)과 프로젝트 코드 담기
	 		HashMap<String, Object> map = new HashMap<String, Object>();
	 		// 프로젝트 받아오고 나서 수정하기
	 		// map.put("projectCode", p.getProjectCode());
	 		map.put("userEmail", m.getUserEmail());

	 		// taskHistory vo 기준으로 data return 받기 (resultSet 데이터별 고유 값이 taskHistoryCode라서)
	 		List<TaskHistory> taskList;//전체리스트
	 		taskList = ts.selectTaskList(map);
	 		
	 		if (taskList != null) {
	 			//담아갈 리스트
	 			
	 			List<TaskHistory> mainTaskList = new ArrayList<TaskHistory>();//상위전체
	 			List<TaskHistory> subTaskList = new ArrayList<TaskHistory>();//하위전체
	 			List<TaskHistory> selectedTaskList = new ArrayList<TaskHistory>();//중복제거한 리스트(진행상태기준)
	 			List<TaskHistory> mainTaskList1 = new ArrayList<TaskHistory>();//중복제거 상위미진행
	 			List<TaskHistory> mainTaskList2= new ArrayList<TaskHistory>();//중복제거 상위진행중
	 			List<TaskHistory> mainTaskList3 = new ArrayList<TaskHistory>();//중복제거 상위완료
	 			List<TaskHistory> subTaskList1 = new ArrayList<TaskHistory>();//중복제거 하위미진행
	 			List<TaskHistory> subTaskList2 = new ArrayList<TaskHistory>();//중복제거 하위진행중
	 			List<TaskHistory> subTaskList3 = new ArrayList<TaskHistory>();//중복제거 하위완료

	 			//상위 하위 리스트 정리
	 			for (int k = 0; k < taskList.size(); k++) {
	 				if (taskList.get(k).getTaskList().getTaskLevel().equals("상위")) {
	 					mainTaskList.add(taskList.get(k));
	 				}else if(taskList.get(k).getTaskList().getTaskLevel().equals("서브")) {
	 					subTaskList.add(taskList.get(k));
	 				}else {
	 					System.out.println("테스크 타입(상위, 하위 테크스) data 입력 오류");
	 				}
	 			}
	 			
	 			// 중복 내용 정리
	 			for (int i = 0; i < taskList.size(); i++) {
	 				// i가 0일때는 그냥 selectedTaskList에 넣어주기
	 				if (i == 0) {
	 					selectedTaskList.add(taskList.get(0));
	 					// i가 0이 아니고 앞에있는 테스크 코드와 다를 경우에만 selectedTaskList에 넣어주기
	 				} else if (taskList.get(i).getTaskList().getTaskCode() != taskList.get(i - 1).getTaskList()
	 						.getTaskCode()) {
	 					selectedTaskList.add(taskList.get(i));
	 				}
	 			}


	 			// 상위 하위 테스크 구분
	 			for (int j = 0; j < selectedTaskList.size(); j++) {
	 				
	 				if (selectedTaskList.get(j).getTaskList().getTaskLevel().equals("상위")) {
	 					
	 					//상위테스크 미진행, 진행, 완료 구분
	 					if(selectedTaskList.get(j).getTaskCategoryCode().equals("I") && selectedTaskList.get(j).getTaskHistValue().equals("미진행")) {
	 						mainTaskList1.add(selectedTaskList.get(j));
	 					}else if(selectedTaskList.get(j).getTaskCategoryCode().equals("I") && selectedTaskList.get(j).getTaskHistValue().equals("진행중")) {
	 						mainTaskList2.add(selectedTaskList.get(j));
	 					}else if(selectedTaskList.get(j).getTaskCategoryCode().equals("I") && selectedTaskList.get(j).getTaskHistValue().equals("완료")) {
	 						mainTaskList3.add(selectedTaskList.get(j));
	 					}else {
	 						System.out.println("테스크 진행상태 없슴. 테스크 data 확인");
	 					}
	 					
	 				} else if(selectedTaskList.get(j).getTaskList().getTaskLevel().equals("서브")){
	 					
	 					//하위테스크 미진행, 진행, 완료 구분
	 					if(selectedTaskList.get(j).getTaskCategoryCode().equals("I") && selectedTaskList.get(j).getTaskHistValue().equals("미진행")) {
	 						subTaskList1.add(selectedTaskList.get(j));
	 					}else if(selectedTaskList.get(j).getTaskCategoryCode().equals("I") && selectedTaskList.get(j).getTaskHistValue().equals("진행중")) {
	 						subTaskList2.add(selectedTaskList.get(j));
	 					}else if(selectedTaskList.get(j).getTaskCategoryCode().equals("I") && selectedTaskList.get(j).getTaskHistValue().equals("완료")) {
	 						subTaskList3.add(selectedTaskList.get(j));
	 					}else {
	 						System.out.println("테스크 진행상태 없슴. 테스크 data 확인");
	 					}
	 				}else {
	 					System.out.println("테스크 상위, 서브 분류 data 오류");
	 				}
	 			}
	 			
	 			System.out.println("원본 리스트 사이즈" + taskList.size());
	 			System.out.println("상위테스크 원본 리스트 사이즈" + mainTaskList.size());
	 			System.out.println("하위테스크 원본 리스트 사이즈" + subTaskList.size());
	 			System.out.println("중복 제거 리스트 사이즈" + selectedTaskList.size());	 			
	 			System.out.println("상위테스크 미진행 중복제거 사이즈: " + mainTaskList1.size());
	 			System.out.println("상위테스크 진행중 중복제거 사이즈: " + mainTaskList2.size());
	 			System.out.println("상위테스크 완료 중복제거 사이즈: " + mainTaskList3.size());
	 			System.out.println("하위테스크 미진행 중복제거 사이즈: " + subTaskList1.size());
	 			System.out.println("하위테스크 진행중 중복제거 사이즈: " + subTaskList2.size());
	 			System.out.println("하위테스크 완료 중복제거 사이즈: " + subTaskList3.size());
	 			//model.addAttribute("taskList", taskList);
	 			// 중복 제거한 테스크 정보
	 			//-- model.addAttribute("selectedTaskList", selectedTaskList);
	 			//model.addAttribute("mainTaskList", mainTaskList);
	 			//model.addAttribute("subTaskList" , subTaskList);
	 			
	 			//JSONArray jsonArray = new JSONArray();
	 			model.addAttribute("taskList", JSONArray.fromObject(taskList));
	 			model.addAttribute("mainTaskList", JSONArray.fromObject(mainTaskList));
	 			model.addAttribute("subTaskList", JSONArray.fromObject(subTaskList));
	 			model.addAttribute("selectedTaskList", JSONArray.fromObject(selectedTaskList));
	 			model.addAttribute("mainTaskList1", JSONArray.fromObject(mainTaskList1));
	 			model.addAttribute("mainTaskList2", JSONArray.fromObject(mainTaskList2));
	 			model.addAttribute("mainTaskList3", JSONArray.fromObject(mainTaskList3));
	 			model.addAttribute("subTaskList1", JSONArray.fromObject(subTaskList1));
	 			model.addAttribute("subTaskList2", JSONArray.fromObject(subTaskList2));
	 			model.addAttribute("subTaskList3", JSONArray.fromObject(subTaskList3));
	 			return "projectTask/projectTaskBoard/projectTaskBoard";
	 		} else {
	 			model.addAttribute("msg", "테스크 조회 실패!");
	 			return "common/errorPage";
	 		}
	 	}
	 	
	 	//플래그 추가
	   @RequestMapping("insertTaskHistoryFlagYes.tk")
	   public ModelAndView insertTaskHistoryFlagYes(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode) {
		   int result = ts.insertTaskHistoryFlagYes(taskCode);
		   System.out.println("플래그 추가 성공 : " + result);
		   mv.addObject("result", result);
		   mv.setViewName("jsonView");
		   return mv;
	   }	
	 	
	 	//플래그 제거
	   @RequestMapping("insertTaskHistoryFlagNo.tk")
	   public ModelAndView insertTaskHistoryFlagNo(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode) {
		   int result = ts.insertTaskHistoryFlagNo(taskCode);
		   System.out.println("플래그 제거 성공 : " + result);
		   mv.addObject("result", result);
		   mv.setViewName("jsonView");
		   return mv;
	   }
	   
	 	//레이블 제거
	   @RequestMapping("insertTaskHistoryLabelNo.tk")
	   public ModelAndView insertTaskHistoryLabelNo(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode) {
		   int result = ts.insertTaskHistoryLabelNo(taskCode);
		   System.out.println("레이블 제거 성공 : " + result);
		   mv.addObject("result", result);
		   mv.setViewName("jsonView");
		   return mv;
	   }	   
	   
	   
	   
	   //테스크 삭제
	   @RequestMapping("insertTaskHistoryTaskDelete.tk")
	   public ModelAndView insertTaskHistoryTaskDelete(ModelAndView mv, @ModelAttribute("loginUser") Member m, int taskCode) {
		   int result = ts.insertTaskHistoryTaskDelete(taskCode);
		   System.out.println("테스크 삭제 성공 : " + result);
		   mv.addObject("result", result);
		   mv.setViewName("jsonView");
		   return mv;
	   }	
	   
	   
	 //--------------------------------------------------------------------------------------------------------------------------------------------------
	   
	   
}
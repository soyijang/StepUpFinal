package com.stepup.agile.projectTask.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectTask.model.service.TaskService;
import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class TaskController {
	
	@Autowired
	private TaskService ts;

	//Task생성
	@RequestMapping("createTask.pj")
	@ResponseBody
	public int createTask(Model model, @ModelAttribute("loginUser") Member m, TaskList t) {
		
		int taskCode = ts.createTask(m, t);
/*		TaskList taskList = new TaskList();
		taskList.setTaskCode(taskCode);*/
		
		System.out.println("멤버 : " + m);
		System.out.println("controller test: " + m.getUserCode());
		System.out.println("테스크 : " + t);
		System.out.println(taskCode);
		//model.addAttribute("TaskList", taskList);
		System.out.println("모달이모야?" + model);
		return taskCode;
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

	
	 /* */
	//3.Sub-Task 생성
	@RequestMapping(value="/insertSubTask.pj",method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ModelAndView insertSubTask(ModelAndView mv, @ModelAttribute("loginUser") Member m, TaskList t, TaskHistory th,
											@RequestParam(value="taskCode", required=false) int taskCode, 
										    @RequestParam(value="subTaskTitle", required=false) String subTaskTitle,
										    @RequestParam(value="taskCategoryCode", required=false) String taskCategoryCode,
										    @RequestParam(value="sprintCode", required=false) int sprintCode) {
								
		t.setTaskUser(m.getUserCode());
		t.setSprintCode(sprintCode);
		int subTaskCode = ts.createSubTask(t);
		
		System.out.println(subTaskCode);
		
		th.setTaskHistValue(subTaskTitle);
		th.setTaskCategoryCode(taskCategoryCode);
		th.setTaskCode(subTaskCode);
		th.setUserCode(m.getUserCode());
		
		System.out.println(subTaskTitle);
		
		int taskHistCode = ts.updateSubTitle(th);
		System.out.println(th);
		System.out.println("가능불가능?"+taskHistCode);
		
		TaskHistory history = ts.selectSubTitle(taskHistCode);
		
		mv.addObject("history", history);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//4.댓글 생성
		@RequestMapping(value="/insertReply.pj", method = RequestMethod.POST, produces = "application/text; charset=utf8")
		@ResponseBody
		public ModelAndView insertReply(ModelAndView mv, @ModelAttribute("loginUser") Member m, ReplyList reply, ReplyHistory history,
				@RequestParam(value="taskCode", required=false) String taskCode, 
			    @RequestParam(value="content", required=false) String content,
			    @RequestParam(value="taskCategoryCode", required=false) String taskCategoryCode) {
			
			/*
			 * for(String data : list){
			 * 
			 * System.out.println("data = " + data);
			 * 
			 * }
			 */
			reply.setUserCode(m.getUserCode());
			reply.setTaskCode(Integer.parseInt(taskCode));

			int replyCode = ts.insertReply(reply);
			
			history.setReplyCode(replyCode);
			history.setReplyContents(content);
			
			int histCode = ts.updateReplyHist(history);
			
			ReplyHistory r = ts.selectReply(reply);
			
			mv.addObject("Reply", r);
			mv.addObject("Member", m);
			mv.setViewName("jsonView");
			
			return mv;
		}
	
	
}
package com.stepup.agile.projectManage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectManage.model.service.ProjectService;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;
import com.stepup.agile.projectTask.model.service.TaskService;
import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.userInfo.model.vo.Member;


@SessionAttributes("loginUser")
@Controller
public class ProjectController {
	@Autowired
	private ProjectService ps;
	
	@Autowired
	private TaskService ts;
	
	//프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동) 
	@RequestMapping("showProjectMain.pj")
	public String selectProject(Model model,  @ModelAttribute("loginUser") Member m) {
		System.out.println("controller" + m.getUserEmail());
		List<Project> projectList;
		//프로젝트 리스트 (프로젝트 코드 정보 담김)
		System.out.println("컨트롤");
		projectList = ps.selectProjectList(m);
		System.out.println(projectList.size());
		//System.out.println("controller " + projectList);
		
		/*
		 * int[] projectCodeArr = new int [projectList.size()]; for(int i = 0; i <
		 * projectList.size(); i++) { System.out.println("projectCode : " +
		 * projectList.get(i).getProjectCode()); projectCodeArr[i] =
		 * projectList.get(i).getProjectCode(); } HashMap<String, Integer>
		 * projectProceegingRate; projectProceegingRate =
		 * ps.selectProjectProceedingRate(projectCodeArr);
		 */
		
		model.addAttribute("projectList", projectList);
		return "projectManage/projectList/projectList";
	}
	
	//프로젝트 생성
	@RequestMapping("insert.pj")
	public String insertProject(Model model, Project p) {
		int result = ps.insertProject(p);
		System.out.println(p);
		if(result > 0) {
			return "projectManage/projectList/projectList";
		} else {
			model.addAttribute("msg", "프로젝트 생성 실패!");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("insertReply.pj")
	   public ModelAndView insertReply(ModelAndView mv, @ModelAttribute("loginUser") Member m, ReplyList reply, ReplyHistory history, String replyContents, int taskCode) {

	      reply.setUserCode(m.getUserCode());

	      int replyCode = ts.insertReply(reply);

	      history.setReplyCode(replyCode);
	      history.setReplyContents(replyContents);

	      System.out.println(replyContents);
	      
	      int histCode = ts.updateReplyHist(history);

	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("replyHistCode", histCode);
	      map.put("taskCode", taskCode);

	      List<ReplyHistory> r = ts.selectReply(map);

	      mv.addObject("replyHistory", r); 
	      mv.setViewName("jsonView");


	      return mv;
	   }
	
	
	
}

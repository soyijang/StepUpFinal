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
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

import net.sf.json.JSONArray;

@SessionAttributes("loginUser")
@Controller
public class ProjectController {
	@Autowired
	private ProjectService ps;
	
	@Autowired
	private TaskService ts;
	

	// 프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동)
	@RequestMapping("showProjectMain.pj")
	public String selectProject(Model model, @ModelAttribute("loginUser") Member m) {
		List<UserProjectList> userProjectList;
		userProjectList = ps.selectProjectList(m);
		
		//중복 제거한 projectHistory만 담을 list 생성한다.(프로젝트 고유한 history만 따로 담아줌)
		List<ProjectHistory> selectedProjectHistoryList = new ArrayList<ProjectHistory>();
		
		
		//프로젝트 리스트 조회한 후에 값이 null이 아니면 
		if (userProjectList != null) {
			
			//진행률 계산
			for(int i = 0; i < userProjectList.size(); i++) {
				//진행률 계산
				int a = 0;
				int b = 0;
				int c = 0;
				int rate = 0;
				a = userProjectList.get(i).getProjectHistory().getProject().getSprintTypeA();
				b = userProjectList.get(i).getProjectHistory().getProject().getSprintTypeB();
				c = userProjectList.get(i).getProjectHistory().getProject().getSprintTypeC();
				
				if((a + b + c) != 0) {
					rate = (int)( (double)c/ (double)(a + b + c) * 100.0 );
				}else { //프로젝트의 스프린트가 없을때
					rate = 0;
				}
				userProjectList.get(i).getProjectHistory().getProject().setProjectProceedingRate(rate);
				
				//현재 코드번호랑 같은 코드의 개수를 반복문 통해서 확인한 후 project 참가자수 추가해줌. 
				for(int j = 0; j < userProjectList.size(); j++) {
					//userProjectList에 있는 time 초단위 00 빼주기 input type time에 넣어줘야하기 때문에
					userProjectList.get(i).getProjectHistory().setProjectEndTime(userProjectList.get(i).getProjectHistory().getProjectEndTime().substring(0, 5));
					userProjectList.get(i).getProjectHistory().setProjectStartTime(userProjectList.get(i).getProjectHistory().getProjectStartTime().substring(0, 5));
					
					if(userProjectList.get(i).getProjectHistory().getProjectCode() == userProjectList.get(j).getProjectHistory().getProjectCode()) {
						userProjectList.get(i).getProjectHistory().getProject().setProjectParticipantCnt(1);
					}
				}
				//i가 0일때는 그냥 selectedProjectHistoryList에 넣어주기
				if(i == 0) {
					selectedProjectHistoryList.add(userProjectList.get(0).getProjectHistory());
				//i가 0이 아니고 앞에있는 리스트 코드와 다를 경우에만 selectedProjectHistoryList에 넣어주기
				}else if(userProjectList.get(i).getProjectHistory().getProjectCode() != userProjectList.get(i-1).getProjectHistory().getProjectCode()){
						selectedProjectHistoryList.add(userProjectList.get(i).getProjectHistory());
				}
			}
//			model.addAttribute("jsonList2", JSONArray.fromObject(mainTaskList));
//			model.addAttribute("jsonList3", JSONArray.fromObject(subTaskList));

			
			//프로젝트 소속 유저 정보
			//model.addAttribute("userProjectList", userProjectList);
			//중복 제거한 프로젝트 정보
			//model.addAttribute("selectedProjectHistoryList", selectedProjectHistoryList);
			model.addAttribute("userProjectList", JSONArray.fromObject(userProjectList));
			model.addAttribute("selectedProjectHistoryList", JSONArray.fromObject(selectedProjectHistoryList));
			return "projectManage/projectList/projectList";
			
		} else {	
			model.addAttribute("msg", "프로젝트 조회 실패!");
			return "common/errorPage";
		}
	}

	
	
	// 프로젝트 생성
	@RequestMapping("insert.pj")
	public String insertProject(Model model, @ModelAttribute("loginUser") Member m, ProjectHistory projectHistory, Project project) {
		//input 타입 타임 00:00:00 형식으로 변경
		projectHistory.setProjectEndTime( projectHistory.getProjectEndTime()+ ":00");
		projectHistory.setProjectStartTime( projectHistory.getProjectStartTime()+ ":00");
		
		//프로젝트 생성후 프로젝트 코드 반환 (Project 객체에 담아옴)
		ps.insertProject(project);
		
		if(project.getProjectCode() != 0) {
			//프로젝트 히스토리 vo에 프로젝트 코드에 추가
			projectHistory.setProjectCode(project.getProjectCode());
			
			//프로젝트 히스토리 생성
			int result1 = ps.insertProjectHistory(projectHistory);
			
			//사용자프로젝트리스트 생성하기위해 member 정보 기준으로 사용자팀코드, 유저번호 가져오기
			UserTeamList userTeamList;
			userTeamList = ps.selectUserTeamCode(m);
			
			//가져온 사용자팀정보 project에 담기
			project.setUserTeamList(userTeamList);
			
			//사용자프로젝트리스트 생성(스크럼마스터 권한으로 생성)
			//멤버의 이메일 주소 project에 넣음
			project.setMember(m);
			int result12 = ps.insertUserProjectOne(project);
			
			//완료 후 서블릿으로 이동
			return "redirect:showProjectMain.pj";
		}else {
			//project insert fail
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

	
	//프로젝트 수정 : projectHistory insert 형태로 수정
	@RequestMapping("update.pj")
	public String updateProjectOne(Model model, @ModelAttribute("loginUser") Member m, ProjectHistory projectHistory) {
			//input 타입 타임 00:00:00 형식으로 변경
			projectHistory.setProjectEndTime( projectHistory.getProjectEndTime()+ ":00");
			projectHistory.setProjectStartTime( projectHistory.getProjectStartTime()+ ":00");
			int result = ps.updateProjectOne(projectHistory);
		if(result > 0) {
			return "redirect:showProjectMain.pj";
		}else {
			//project update fail
			model.addAttribute("msg", "프로젝트 수정 실패!");
			return "common/errorPage";
		}
	}
	
	
}

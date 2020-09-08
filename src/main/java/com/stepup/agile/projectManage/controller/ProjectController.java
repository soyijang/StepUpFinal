package com.stepup.agile.projectManage.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.projectManage.model.service.ProjectService;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

@SessionAttributes("loginUser")
@Controller
public class ProjectController {
	@Autowired
	private ProjectService ps;

	// 프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동)
	@RequestMapping("showProjectMain.pj")
	public String selectProject(Model model, @ModelAttribute("loginUser") Member m) {
		List<UserProjectList> userProjectList;
		userProjectList = ps.selectProjectList(m);
		
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


			
			//프로젝트 소속 유저 정보
			model.addAttribute("userProjectList", userProjectList);
			//중복 제거한 프로젝트 정보
			model.addAttribute("selectedProjectHistoryList", selectedProjectHistoryList);
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
	
	
}

package com.stepup.agile.projectManage.model.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public interface ProjectService {

	List<Project> selectUserProject(Member m);

	List<Project> selectUserProject2(Member m);

	List<ProjectHistory> selectTimelineProject(Member m);

	int updateTimeline(HashMap<String, Object> map);

	int selectAlert(Member m);
	
	int selectSprintAlert(Member m);

	///////////////////////////////////////////////////////////////////////////////////

	//프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동) 
	List<UserProjectList> selectProjectList(Member m);
	
	//프로젝트 생성	
	Project insertProject(Project p);

	//프로젝트 생성 후 프로젝트 히스토리 자동 생성
	int insertProjectHistory(ProjectHistory projectHistory);
	
	//사용자프로젝트리스트 생성하기위해 member 정보 기준으로 사용자팀코드 가져오기
	UserTeamList selectUserTeamCode(Member m);
	
	//프로젝트 생성 후  사용자프로젝트리스트 생성(스크럼마스터 권한으로 생성)
	int insertUserProjectOne(Project project);

	//프로젝트 수정
	int updateProjectOne(ProjectHistory projectHistory);

	//프로젝트 멤버 추가를 위한 팀원 검색
	List<Member> searchTeamMember(Member m);

	//프로젝트 멤버 추가
	int insertUserProjectMember(Map<String, Object> map);

	//중복으로 추가되지 않도록 유저프로젝트 소속 여부 확인해보기
	UserProjectList checkBelongTo(Map<String, Object> map);

}


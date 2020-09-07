package com.stepup.agile.projectManage.model.service;

import java.util.HashMap;
import java.util.List;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;
import com.stepup.agile.userInfo.model.vo.Member;

public interface ProjectService {

	List<Project> selectUserProject(Member m);

	List<Project> selectUserProject2(Member m);
	///////////////////////////////////////////////////////////////////////////////////

	//프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동) 
	List<Project> selectProjectList(Member m);
	
	//프로젝트 생성	
	int insertProject(Project p);

	//진행률 계산식
	HashMap<String, Integer> selectProjectProceedingRate(int[] projectCodeArr);

	List<ProjectHistory> selectTimelineProject(Member m);

	int updateTimeline(HashMap<String, Object> map);

	
}

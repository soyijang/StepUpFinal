package com.stepup.agile.projectManage.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;
import com.stepup.agile.userInfo.model.vo.Member;

public interface ProjectDao {

	List<Project> selectUserProject(SqlSessionTemplate sqlSession, Member m);

	List<Project> selectUserProject2(SqlSessionTemplate sqlSession, Member m);
	
	///////////////////////////////////////////////////////////////////////////////////
	//프로젝트 생성
	int insertProject(SqlSessionTemplate sqlSession, Project p);

	//프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동) 	
	List<Project> selectProjectList(SqlSessionTemplate sqlSession, Member m);

	//진행률 계산식
	HashMap<String, Integer> selectProjectProceedingRate(SqlSessionTemplate sqlSession, int[] projectCodeArr);

	List<ProjectHistory> selectTimelineProject(SqlSessionTemplate sqlSession, Member m);

}

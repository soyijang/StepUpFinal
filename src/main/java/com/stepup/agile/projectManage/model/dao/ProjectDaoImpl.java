package com.stepup.agile.projectManage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

@Repository
public class ProjectDaoImpl implements ProjectDao{
	
	
	@Override
	public List<Project> selectUserProject(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectList("Project.selectUserProject", m.getUserEmail());
	}

	@Override
	public List<Project> selectUserProject2(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Project.selectUserProject2", m.getUserEmail());
	}
	
	///////////////////////////////////////////////////////////////////////////////////
	//프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동) 
	@Override
	public List<UserProjectList> selectProjectList(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Project.selectProjectList", m);
	}
	
	//프로젝트 생성
	@Override
	public Project insertProject(SqlSessionTemplate sqlSession, Project p) {
		sqlSession.insert("Project.insertProject", p);
		return p;
	}
	
	//프로젝트 생성 후 프로젝트 히스토리 자동 생성
	@Override
	public int insertProjectHistory(SqlSessionTemplate sqlSession, ProjectHistory projectHistory) {
		return sqlSession.insert("Project.insertProjectHistory", projectHistory);
	}
	
	//사용자프로젝트리스트 생성하기위해 member 정보 기준으로 사용자팀코드 가져오기
	@Override
	public UserTeamList selectUserTeamCode(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Project.selectUserTeamCode", m);
	}
	
	//프로젝트 생성 후  사용자프로젝트리스트 생성(스크럼마스터 권한으로 생성)
	@Override
	public int insertUserProjectOne(SqlSessionTemplate sqlSession, Project project) {
		return sqlSession.insert("Project.insertUserProjectOne", project);
	}
	



}
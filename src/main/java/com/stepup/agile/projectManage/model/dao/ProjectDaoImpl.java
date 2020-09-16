package com.stepup.agile.projectManage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;

import com.stepup.agile.userInfo.model.vo.AlertList;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

@Repository
public class ProjectDaoImpl implements ProjectDao{
	
	
	@Override
	public List<Project> selectUserProject(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectList("Project.selectUserProject", m);
	}

	@Override
	public List<Project> selectUserProject2(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Project.selectUserProject2", m);
	}

	@Override
	public List<ProjectHistory> selectTimelineProject(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Project.selectTimelineProject", m);
	}

	@Override
	public int updateTimeline(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("Project.updateTimeline", map);
	}

	@Override
	public int selectAlert(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Project.selectProjectAlert", m);
	}
	
	///////////////////////////////////////////////////////////////////////////////////
	//프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동) 
	@Override
	public List<UserProjectList> selectProjectList(SqlSessionTemplate sqlSession, Member m) {
		List<UserProjectList> list = sqlSession.selectList("Project.selectProjectList", m);
		System.out.println("list: " + list);
		return list;
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

	//프로젝트 수정
	@Override
	public int updateProjectOne(SqlSessionTemplate sqlSession, ProjectHistory projectHistory) {
		return sqlSession.insert("Project.insertProjectHistory", projectHistory);
	}

	//프로젝트 멤버 추가를 위한 팀원 검색
	@Override
	//public List<Member> searchTeamMember(SqlSessionTemplate sqlSession, Map<String, Object> map) {
	public List<Member> searchTeamMember(SqlSessionTemplate sqlSession, Member m) {
		//return sqlSession.selectList("Project.searchTeamMember", map);
		return sqlSession.selectList("Project.searchTeamMember", m);
	}

	//프로젝트 멤버 추가
	@Override
	public int insertUserProjectMember(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("Project.insertUserProjectMember", map);
	}

	//중복으로 추가되지 않도록 유저프로젝트 소속 여부 확인해보기
	@Override
	public UserProjectList checkBelongTo(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("Project.checkBelongTo", map);

	}
	



}

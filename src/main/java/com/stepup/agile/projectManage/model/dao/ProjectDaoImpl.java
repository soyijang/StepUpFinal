package com.stepup.agile.projectManage.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.vo.Member;

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
	//프로젝트 생성
	@Override
	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("Project.insertProject", p);
	}
	
	//프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동) 
	@Override
	public List<Project> selectProjectList(SqlSessionTemplate sqlSession, Member m) {
		System.out.println("ProjectDao m : " + m.getUserEmail());
		return sqlSession.selectList("Project.selectProjectList", m);
	}

	//진행률 계산식
	@Override
	public HashMap<String, Integer> selectProjectProceedingRate(SqlSessionTemplate sqlSession, int[] projectCodeArr) {
		return (HashMap<String, Integer>) sqlSession.selectList("Project.selectProjectList", projectCodeArr);
	}
	
	
}

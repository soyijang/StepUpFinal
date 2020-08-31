package com.stepup.agile.projectManage.model.dao;

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

	
	
}

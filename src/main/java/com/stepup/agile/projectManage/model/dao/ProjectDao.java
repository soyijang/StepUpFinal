package com.stepup.agile.projectManage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.vo.Member;

public interface ProjectDao {

	List<Project> selectUserProject(SqlSessionTemplate sqlSession, Member m);

	List<Project> selectUserProject2(SqlSessionTemplate sqlSession, Member m);
	
}

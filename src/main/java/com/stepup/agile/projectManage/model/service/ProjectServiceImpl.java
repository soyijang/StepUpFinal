package com.stepup.agile.projectManage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectManage.model.dao.ProjectDao;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.vo.Member;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProjectDao pd;
	
	@Override
	public List<Project> selectUserProject(Member m) {
		
		return pd.selectUserProject(sqlSession, m);
	}

	@Override
	public List<Project> selectUserProject2(Member m) {
		return pd.selectUserProject2(sqlSession, m);
	}

	
}

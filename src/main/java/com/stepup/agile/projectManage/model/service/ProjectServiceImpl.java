package com.stepup.agile.projectManage.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectManage.model.dao.ProjectDao;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;
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
	///////////////////////////////////////////////////////////////////////////////////

	//프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동) 
	@Override
	public List<Project> selectProjectList(Member m) {
		return pd.selectProjectList(sqlSession, m);
	}
	
	//프로젝트 생성
	@Override
	public int insertProject(Project p) {
		return pd.insertProject(sqlSession, p);
	}

	//진행률 계산식
	@Override
	public HashMap<String, Integer> selectProjectProceedingRate(int[] projectCodeArr) {
		return pd.selectProjectProceedingRate(sqlSession, projectCodeArr);
	}

	@Override
	public List<ProjectHistory> selectTimelineProject(Member m) {
		return pd.selectTimelineProject(sqlSession, m);
	}
	
	
	
}

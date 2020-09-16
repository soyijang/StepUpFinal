package com.stepup.agile.projectBacklog.model.service;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectBacklog.model.dao.BacklogDao;
import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.userInfo.model.vo.Member;

@Service
public class BacklogServiceImpl implements BacklogService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BacklogDao bd;
	
	@Override
	public List<Sprint> selectSprint(Member m, int projectCode) {
		
		return bd.selectSprint(sqlSession, m, projectCode);
	}

	@Override
	public int insertSprint(int userProjectCode) {
		return bd.insertSprint(sqlSession, userProjectCode);
	}

	@Override
	public SprintHistory selectSprintOne(Member m, int sprintCode) {
		// TODO Auto-generated method stub
		return bd.selectSprintOne(sqlSession, m, sprintCode);
	}

	@Override
	public List<TaskHistory> selectSprintTask(Member m, int sprintCode) {
		return bd.selectSprintTask(sqlSession, m, sprintCode);
	}

	@Override
	public int updateSprint(SprintHistory sprintHistory) {
		// TODO Auto-generated method stub
		return bd.updateSprint(sqlSession, sprintHistory);
	}


	@Override
	public int updateFinish(SprintHistory sprintHistory) {
		// TODO Auto-generated method stub
		return bd.updateFinish(sqlSession, sprintHistory);
	}

	@Override
	public int updateStart(SprintHistory sprintHistory) {
		// TODO Auto-generated method stub
		return bd.updateStart(sqlSession, sprintHistory);
	}

	@Override
	public int updateTask(int taskCode) {
		// TODO Auto-generated method stub
		return bd.updateTask(sqlSession, taskCode);
	}

	@Override
	public List<Sprint> searchSprint(Member m, String sprintName) {
		return bd.searchSprint(sqlSession, m, sprintName);
	}

}

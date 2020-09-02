package com.stepup.agile.projectTask.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.dao.TaskDao;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

@Service
public class TaskServiceImpl implements TaskService {
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Autowired
	public TaskDao td;
	
	@Override
	public int createTask(Member m, TaskList t) {
		
		return td.createTask(sqlSession, m, t);
	}

	@Override
	public int updateTitle(Member m, TaskHistory th) {

		return td.updateTitle(sqlSession, m, th);
	}

	@Override
	public String selectTitle(int taskHistCode, TaskHistory th) {
		
		return td.selectTitle(sqlSession, taskHistCode, th);
	}

	@Override
	public List<TaskHistory> selectUserTask(Member m) {
		return td.selectUserTask(sqlSession, m);
	}

	@Override
	public String selectPjNonTask(Map<String, Object> map) {
		return td.selectPjNonTask(sqlSession, map);
	}

	@Override
	public List<TaskHistory> selectBugTask(Member m) {
		return td.selectBugTask(sqlSession, m);
	}


	@Override
	public List<TaskList> selectBugCont(HashMap<String, Object> map) {
		return td.selectBugCont(sqlSession, map);
	}

	@Override
	public int insertCloneBug(HashMap<String, Object> map) {
		return td.insertCloneBug(sqlSession, map);
	}

	@Override
	public int insertCloneBug2(HashMap<String, Object> map2) {
		return td.insertCloneBug2(sqlSession, map2);
	}

	@Override
	public int deleteCloneBug(HashMap<String, Object> map) {
		return td.deleteCloneBug(sqlSession, map);
	}

	@Override
	public List<TaskHistory> searchBug(HashMap<String, Object> map) {
		return td.searchBug(sqlSession, map);	
	
	}

}

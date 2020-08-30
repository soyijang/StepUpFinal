package com.stepup.agile.projectTask.model.service;

import java.lang.annotation.Target;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	public int createTask(Member m) {
		System.out.println("service : " + m);
		return td.createTask(sqlSession, m);
	}

	@Override
	public int updateTitle(Member m) {
		
		return td.updateTitle(sqlSession, m);
	}

	@Override
	public List<TaskList> selectBugTask(Member m) {
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
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, rollbackFor = {Exception.class})
	public int insertCloneBug2(HashMap<String, Object> map2) {
	
		return td.insertCloneBug2(sqlSession, map2);
	}

	@Override
	public int deleteCloneBug(HashMap<String, Object> map) {
		return td.deleteCloneBug(sqlSession, map);
	}





}

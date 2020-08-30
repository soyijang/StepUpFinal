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
	public int createTask(Member m) {
		System.out.println("service : " + m);
		return td.createTask(sqlSession, m);
	}

	@Override
	public int updateTitle(Member m) {
		return td.updateTitle(sqlSession, m);
	}

	@Override
	public List<TaskHistory> selectUserTask(Member m) {
		return td.selectUserTask(sqlSession, m);
	}

	@Override
	public String selectPjNonTask(Map<String, Object> map) {
		return td.selectPjNonTask(sqlSession, map);
	}

	

	

}

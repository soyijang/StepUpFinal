package com.stepup.agile.projectTask.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	

}

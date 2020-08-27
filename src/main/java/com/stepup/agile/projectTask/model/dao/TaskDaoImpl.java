package com.stepup.agile.projectTask.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

@Repository	
public class TaskDaoImpl implements TaskDao {

	@Override
	public int createTask(SqlSessionTemplate sqlSession, TaskList t, Member m) {
		t.setTaskUser(m.getUserCode());
		return sqlSession.insert("Task.createTask", t);
	}
	
	@Override
	public int updateTitle(SqlSessionTemplate sqlSession, TaskHistory th) {
		
		return sqlSession.update("Task.updateTaskTitle", th);
	}

}

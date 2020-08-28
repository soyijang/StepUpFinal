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
	public int createTask(SqlSessionTemplate sqlSession, Member m, TaskList t) {
		t.setTaskUser(m.getUserCode());
		
		/* int taskCode = sqlSession.insert("Task.createTask", t); */
		sqlSession.insert("Task.createTask", t);
		
		int taskCode = t.getTaskCode();
		
		return taskCode;
	}
	
	@Override
	public int updateTitle(SqlSessionTemplate sqlSession, TaskHistory th) {
		
		return sqlSession.update("Task.updateTaskTitle", th);
	}

}

package com.stepup.agile.projectTask.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

@Repository	
public class TaskDaoImpl implements TaskDao {

	@Override
	public int createTask(SqlSessionTemplate sqlSession, Member m) {
		System.out.println("dao : " + sqlSession.insert("Task.createTask", m));
		return sqlSession.insert("Task.createTask", m);
	}
	
	@Override
	public int updateTitle(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("Task.updateTaskTitle", m);
	}

	@Override
	public List<TaskList> selectBugTask(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectList("Task.selectBugTask", m);
	}

	@Override
	public List<TaskList> selectBugCont(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectList("Task.selectBugCont", map);
	}

	@Override
	public int insertCloneBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("Task.insertCloneBug", map);
	}

	

	


}

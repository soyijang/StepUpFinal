package com.stepup.agile.projectTask.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectManage.model.vo.Project;
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
	public List<TaskList> selectUserTask(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Task.selectUserTaskTitle", m);
	}

	@Override
	public List<TaskList> selectUserTaskStatus(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Task.selectUserTaskStatus", m);
	}

	@Override
	public List<TaskList> selectIngTask(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Task.selectIngTask", m);
	}

	@Override
	public List<TaskList> selectNonTask(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Task.selectNonTask", m);
	}

	@Override
	public List<TaskList> selectComTask(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Task.selectComTask", m);
	}

	@Override
	public List<TaskList> selectSumTask(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Task.selectSumTask", m);
	}

	@Override
	public List<TaskList> selectTaskDate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Task.selectTaskDate", m);
	}

	@Override
	public TaskList selectPjNonTask(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("Task.selectPjNonTask", map);
	}


	

}

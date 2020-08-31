package com.stepup.agile.projectTask.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectManage.model.vo.Project;
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
	public List<TaskHistory> selectUserTask(SqlSessionTemplate sqlSession, Member m) {
		System.out.println(m.getUserCode());
		return sqlSession.selectList("Task.selectUserTaskTitle", m);
	}

	@Override
	public String selectPjNonTask(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		if(sqlSession.selectOne("Task.selectPjNonTask", map) == null) {
			return "0";
		} else {
			return sqlSession.selectOne("Task.selectPjNonTask", map);
		}
	}


	

}

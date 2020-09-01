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
	public List<TaskHistory> selectBugTask(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectList("Task.selectBugTask", m);
	}

	@Override
	public List<TaskList> selectBugCont(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectList("Task.selectBugCont", map);
	}

	@Override
	public int insertCloneBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		sqlSession.insert("Task.insertCloneBug", map);
		
		int taskCode = (int) map.get("taskCode") - 1;
		
		return taskCode;
	}

	@Override
	public int insertCloneBug2(SqlSessionTemplate sqlSession, HashMap<String, Object> map2) {
		int result = 0;
		int result1 = sqlSession.insert("Task.insertCloneBug2", map2);
		int result2 = sqlSession.insert("Task.insertCloneBug3", map2);
		int result3 = sqlSession.insert("Task.insertCloneBug4", map2);
		
		if(result1 > 0) {
			
			sqlSession.insert("Task.insertCloneBug3", map2);
			
			if(result2 > 0) {
				
				sqlSession.insert("Task.insertCloneBug4", map2);
				
				if(result3 > 0) {
					
					result = 3;
				}
			}
		}
		return result;
		
	}

	@Override
	public int deleteCloneBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.delete("Task.deleteCloneBug", map);
	}

	@Override
	public List<TaskHistory> searchBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectList("Task.searchBug", map);
	}


}

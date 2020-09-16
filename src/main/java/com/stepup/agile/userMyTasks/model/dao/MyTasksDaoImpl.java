package com.stepup.agile.userMyTasks.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.MyTask;
import com.stepup.agile.userMyTasks.model.vo.MyTaskShare;

@Repository
public class MyTasksDaoImpl implements MyTasksDao {

	@Override
	public List<MyTask> selectTaskList(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("MyTask.selectTaskList", m.getUserEmail());
	}

	@Override
	public int updateMyTaskYN(SqlSessionTemplate sqlSession, Member m, String myTasksTodoYN,
			int myTasksCode) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userEmail",  m.getUserEmail());
		map.put("myTasksTodoYN",  myTasksTodoYN);
		map.put("myTasksCode",  myTasksCode);
		
		return sqlSession.update("MyTask.updateMyTaskYN", map);
	}

	@Override
	public int updateMyTask(SqlSessionTemplate sqlSession, MyTask mytask) {
		return sqlSession.update("MyTask.updateMyTask", mytask);
	}

	@Override
	public int insertMyTask(SqlSessionTemplate sqlSession, MyTask mytask) {
		return sqlSession.insert("MyTask.insertMyTask", mytask);
	}

	@Override
	public int deleteMyTask(SqlSessionTemplate sqlSession, MyTask mytask) {
		return sqlSession.delete("MyTask.deleteMyTask", mytask);
	}

	@Override
	public List<MyTask> selectShareMyTasks(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("MyTask.selectShareMyTasks", m.getUserEmail());
	}

	@Override
	public int insertShareMyTask(SqlSessionTemplate sqlSession, MyTaskShare mytask) {
		return sqlSession.insert("MyTask.insertShareMyTask", mytask);
	}

}

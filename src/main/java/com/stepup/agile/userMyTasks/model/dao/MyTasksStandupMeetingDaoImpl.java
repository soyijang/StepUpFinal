package com.stepup.agile.userMyTasks.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.userMyTasks.model.vo.MyTask;

@Repository
public class MyTasksStandupMeetingDaoImpl implements MyTasksStandupMeetingDao{

	//공유 일정 가져오기	
	@Override
	public List<MyTask> selectMytaskShareList(SqlSessionTemplate sqlSession, int projectCode) {
		return sqlSession.selectList("MyTask.selectMytaskShareList", projectCode);
	}

	
	
	
}

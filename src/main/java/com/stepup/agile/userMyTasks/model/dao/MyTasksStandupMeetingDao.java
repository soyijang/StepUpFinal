package com.stepup.agile.userMyTasks.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.userMyTasks.model.vo.MyTask;

public interface MyTasksStandupMeetingDao {

	//공유 일정 가져오기	
	List<MyTask> selectMytaskShareList(SqlSessionTemplate sqlSession, int projectCode);

}

package com.stepup.agile.userMyTasks.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.userMyTasks.model.dao.MyTasksStandupMeetingDao;
import com.stepup.agile.userMyTasks.model.vo.MyTask;

@Service
public class MyTasksStandupMeetingServiceImpl implements MyTasksStandupMeetingService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyTasksStandupMeetingDao smd;
	
	//공유 일정 가져오기	
	@Override
	public List<MyTask> selectMytaskShareList(int projectCode) {
		return smd.selectMytaskShareList(sqlSession, projectCode);
	}
	
	
}

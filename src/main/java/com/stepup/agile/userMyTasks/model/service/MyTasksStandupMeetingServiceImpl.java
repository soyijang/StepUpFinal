package com.stepup.agile.userMyTasks.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.userMyTasks.model.dao.MyTasksStandupMeetingDao;

@Service
public class MyTasksStandupMeetingServiceImpl implements MyTasksStandupMeetingService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyTasksStandupMeetingDao smd;
	
	
	
}

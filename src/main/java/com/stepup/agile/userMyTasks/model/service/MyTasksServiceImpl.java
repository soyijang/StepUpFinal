package com.stepup.agile.userMyTasks.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.dao.MyTasksDao;
import com.stepup.agile.userMyTasks.model.vo.MyTask;

@Service
public class MyTasksServiceImpl implements MyTasksService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyTasksDao mtd;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	
	@Override
	public MyTask[] showMyTasks(Member m) {
		
		MyTask [] myTasks = mtd.selectMyTasks(sqlSession, m);
		
		return myTasks;
		
	}
	

}

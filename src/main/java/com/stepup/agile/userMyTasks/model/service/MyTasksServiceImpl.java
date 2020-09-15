package com.stepup.agile.userMyTasks.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.dao.MyTasksDao;
import com.stepup.agile.userMyTasks.model.vo.MyTask;
import com.stepup.agile.userMyTasks.model.vo.MyTaskShare;

@Service
public class MyTasksServiceImpl implements MyTasksService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyTasksDao mtd;

	@Override
	public List<MyTask> selectTaskList(Member m) {
		// TODO Auto-generated method stub
		return mtd.selectTaskList(sqlSession, m);
	}

	@Override
	public int updateMyTaskYN(Member m, String myTasksTodoYN, int myTasksCode) {
		return mtd.updateMyTaskYN(sqlSession, m, myTasksTodoYN, myTasksCode);
	}

	@Override
	public int updateMyTask(MyTask mytask) {
		return mtd.updateMyTask(sqlSession, mytask);
	}

	@Override
	public int insertMyTask(MyTask mytask) {
		return mtd.insertMyTask(sqlSession, mytask);
	}

	@Override
	public int deleteMyTask(MyTask mytask) {
		return mtd.deleteMyTask(sqlSession, mytask);
	}

	@Override
	public List<MyTask> selectShareMyTasks(Member m) {
		return mtd.selectShareMyTasks(sqlSession, m);
	}

	@Override
	public int insertShareMyTask(MyTaskShare mytask) {
		return mtd.insertShareMyTask(sqlSession, mytask);
	}

}



package com.stepup.agile.userMyTasks.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.MyTask;
import com.stepup.agile.userMyTasks.model.vo.MyTaskShare;


public interface MyTasksDao {

	public List<MyTask> selectTaskList(SqlSessionTemplate sqlSession, Member m);

	public int updateMyTaskYN(SqlSessionTemplate sqlSession, Member m, String myTasksTodoYN,
			int myTasksCode);

	public int updateMyTask(SqlSessionTemplate sqlSession, MyTask mytask);

	public int insertMyTask(SqlSessionTemplate sqlSession, MyTask mytask);

	public int deleteMyTask(SqlSessionTemplate sqlSession, MyTask mytask);

	public List<MyTask> selectShareMyTasks(SqlSessionTemplate sqlSession, Member m);

	public int insertShareMyTask(SqlSessionTemplate sqlSession, MyTaskShare mytask);

}

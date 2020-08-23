package com.stepup.agile.userMyTasks.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.MyTask;

@Repository
public class MyTasksDao {

	public MyTask[] selectMyTasks(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("MyTask.selectMyTask", m);
	}

}

package com.stepup.agile.projectTask.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskDao {

	int createTask(SqlSessionTemplate sqlSession, Member m);

	int updateTitle(SqlSessionTemplate sqlSession, Member m);

	List<TaskList> selectBugTask(SqlSessionTemplate sqlSession, Member m);

}

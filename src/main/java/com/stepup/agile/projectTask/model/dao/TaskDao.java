package com.stepup.agile.projectTask.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskDao {

	int createTask(SqlSessionTemplate sqlSession, Member m, TaskList t);

	int updateTitle(SqlSessionTemplate sqlSession, TaskHistory th);

}

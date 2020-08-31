package com.stepup.agile.projectTask.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskDao {

	int createTask(SqlSessionTemplate sqlSession, Member m);

	int updateTitle(SqlSessionTemplate sqlSession, Member m);

	List<TaskHistory> selectUserTask(SqlSessionTemplate sqlSession, Member m);

	String selectPjNonTask(SqlSessionTemplate sqlSession, Map<String, Object> map);



	List<TaskHistory> selectUserTask(SqlSessionTemplate sqlSession, Member m);

	String selectPjNonTask(SqlSessionTemplate sqlSession, Map<String, Object> map);



}

package com.stepup.agile.projectTask.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskDao {

	int createTask(SqlSessionTemplate sqlSession, Member m);

	int updateTitle(SqlSessionTemplate sqlSession, Member m);

	List<TaskList> selectUserTask(SqlSessionTemplate sqlSession, Member m);

	List<TaskList> selectUserTaskStatus(SqlSessionTemplate sqlSession, Member m);

	List<TaskList> selectIngTask(SqlSessionTemplate sqlSession, Member m);

	List<TaskList> selectNonTask(SqlSessionTemplate sqlSession, Member m);

	List<TaskList> selectComTask(SqlSessionTemplate sqlSession, Member m);

	List<TaskList> selectSumTask(SqlSessionTemplate sqlSession, Member m);

	List<TaskList> selectTaskDate(SqlSessionTemplate sqlSession, Member m);

	TaskList selectPjNonTask(SqlSessionTemplate sqlSession, Map<String, Object> map);



}

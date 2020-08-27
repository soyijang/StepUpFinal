package com.stepup.agile.projectBacklog.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.userInfo.model.vo.Member;

public interface BacklogDao {

	List<Sprint> selectSprint(SqlSessionTemplate sqlSession, Member m);

	int insertSprint(SqlSessionTemplate sqlSession, int userProjectCode);

	SprintHistory selectSprintOne(SqlSessionTemplate sqlSession, Member m, int sprintCode);
	
}

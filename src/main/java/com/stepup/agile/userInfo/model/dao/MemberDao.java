package com.stepup.agile.userInfo.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Member;

public interface MemberDao {
	
	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginFailedException;

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	Member selectMember(SqlSessionTemplate sqlSession, Member m);

	int insertJob(SqlSessionTemplate sqlSession, Map<String, Object> member);

	String selectUserProject(SqlSessionTemplate sqlSession, Member m);

}

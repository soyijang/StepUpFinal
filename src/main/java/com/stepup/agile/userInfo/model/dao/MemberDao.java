package com.stepup.agile.userInfo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Member;

public interface MemberDao {
	
	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginFailedException;

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	Member selectMember(SqlSessionTemplate sqlSession, Member m);

}

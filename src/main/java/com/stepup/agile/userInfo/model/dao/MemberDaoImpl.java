package com.stepup.agile.userInfo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("Member.selectPwd", m.getUserEmail());
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("Member.insertMember", m);
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectLoginUser", m);
	}
	
	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginFailedException {
		
		Member loginUser = sqlSession.selectOne("Member.loginCheck", m);
		
		System.out.println("dao loginUser : " + loginUser);
		
		if(loginUser == null) {
			throw new LoginFailedException("로그인 실패!");
		}
		
		return loginUser;
	}

}

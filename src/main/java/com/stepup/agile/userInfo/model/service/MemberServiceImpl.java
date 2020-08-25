package com.stepup.agile.userInfo.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.stepup.agile.userInfo.model.dao.MemberDao;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDao md;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public Member loginMember(Member m) throws LoginFailedException {
		
		Member loginUser = null;
		
		String encPassword = md.selectEncPassword(sqlSession, m);
		
		if(!passwordEncoder.matches(m.getUserPwd(), encPassword)) {
			System.out.println(m.getUserPwd());
			System.out.println(encPassword);
			System.out.println(m);
			throw new LoginFailedException("로그인 실패!");
		} else {
			loginUser = md.selectMember(sqlSession, m);
			System.out.println(loginUser);
		}
		
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		
		return md.insertMember(sqlSession, m);
	}

	@Override
	public int insertJob(Map<String, Object> member) {
		
		return md.insertJob(sqlSession, member);
	}

}

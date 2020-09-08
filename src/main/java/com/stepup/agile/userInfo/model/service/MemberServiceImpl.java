package com.stepup.agile.userInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.dao.MemberDao;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

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
	public String selectUserProject(Member m) {
		
		
		return md.selectUserProject(sqlSession, m);
	}
	//myInfo 팀원 리스트조회
	@Override
	public List<Member> selectTeamList(UserTeamList ul) {

		return md.selectTeamList(sqlSession, ul);
	}
	//프로젝트리스트 조회

	@Override
	public List<UserProjectList> selectProjectList(int userCode) {

		return md.userProjectList(sqlSession, userCode);
	}
	//직업등록
	@Override
	public int insertJob(HashMap<String, Object> map) {

		return md.insertJob(sqlSession, map);
	}

	@Override
	public Member selectJob(int userCode) {

		return md.selectJob(sqlSession, userCode);
	}

	@Override
	public int insertDept(HashMap<String, Object> map) {

		return md.insertDept(sqlSession, map);
	}

	@Override
	public Member selectDept(int userCode) {

		return md.selectDept(sqlSession, userCode);
	}
	//회사등록
	@Override
	public int insertCom(HashMap<String, Object> map) {
		System.out.println("serviceImpl"+md.insertCom(sqlSession, map));
		return md.insertCom(sqlSession, map);
	}

	@Override
	public Member selectCom(int userCode) {

		return md.selectCom(sqlSession, userCode);
	}


	

}

package com.stepup.agile.userInfo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginFailedException {
		
		Member loginUser = sqlSession.selectOne("Member.loginCheck", m);
		
		System.out.println("dao loginUser : " + loginUser);
		
		if(loginUser == null) {
			throw new LoginFailedException("로그인 실패!");
		}
		System.out.println("loginCheck : " + loginUser);
		return loginUser;
	}

	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Member m) {
		System.out.println("member.selectPwd" + sqlSession.selectOne("Member.selectPwd", m.getUserEmail()));
		return sqlSession.selectOne("Member.selectPwd", m.getUserEmail());
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("Member.insertMember", m);
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		System.out.println("member.selectLoginUSERT : " + sqlSession.selectOne("Member.selectLoginUser", m));
		return sqlSession.selectOne("Member.selectLoginUser", m);
	}

	@Override
	public String selectUserProject(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectUserProject");
	}
	//myInfo 팀원 리스트조회
	@Override
	public List<Member> selectTeamList(SqlSessionTemplate sqlSession, UserTeamList ul) {

		return sqlSession.selectList("Member.myTeamMemberList", ul);
	}
	//프로젝트 리스트 조회
	@Override
	public List<UserProjectList> userProjectList(SqlSessionTemplate sqlSession, int userCode) {

		return sqlSession.selectList("Member.myProjectList", userCode);
	}
	
	//직업등록
	@Override
	public int insertJob(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.update("Member.insertJob", map);
	}

	@Override
	public Member selectJob(SqlSessionTemplate sqlSession, int userCode) {

		return sqlSession.selectOne("Member.selectJob", userCode);
	}

	@Override
	public int insertDept(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.update("Member.insertDept", map);
	}

	@Override
	public Member selectDept(SqlSessionTemplate sqlSession, int userCode) {

		return sqlSession.selectOne("Member.selectDept", userCode);
	}

	@Override
	public int insertCom(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		System.out.println("daoImpl"+sqlSession.update("Member.insertCom", map));
		return sqlSession.update("Member.insertCom", map);
	}

	@Override
	public Member selectCom(SqlSessionTemplate sqlSession, int userCode) {
		
		return sqlSession.selectOne("Member.selectCom", userCode);
	}

	

}

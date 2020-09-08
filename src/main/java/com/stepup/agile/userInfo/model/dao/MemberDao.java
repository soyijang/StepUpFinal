package com.stepup.agile.userInfo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public interface MemberDao {
	
	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginFailedException;

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	Member selectMember(SqlSessionTemplate sqlSession, Member m);

	String selectUserProject(SqlSessionTemplate sqlSession, Member m);
	
	//myInfo 팀원 리스트조회
	List<Member> selectTeamList(SqlSessionTemplate sqlSession, UserTeamList ul);
	//프로젝트 리스트 조회
	List<UserProjectList> userProjectList(SqlSessionTemplate sqlSession, int userCode);
	//직업 등록
	int insertJob(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	Member selectJob(SqlSessionTemplate sqlSession, int userCode);
	//부서 등록
	int insertDept(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	Member selectDept(SqlSessionTemplate sqlSession, int userCode);
	//회사등록
	int insertCom(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
	
	Member selectCom(SqlSessionTemplate sqlSession, int userCode);

	

}

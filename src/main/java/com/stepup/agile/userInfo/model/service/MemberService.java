package com.stepup.agile.userInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public interface MemberService {

	Member loginMember(Member m) throws LoginFailedException;

	int insertMember(Member m);

	String selectUserProject(Member m);
	
	//myInfo 팀원 리스트조회
	List<Member> selectTeamList(UserTeamList ul);
	//프로젝트 리스트조회
	List<UserProjectList> selectProjectList(int userCode);
	//직업등록
	int insertJob(HashMap<String, Object> map);

	Member selectJob(int userCode);
	//부서등록
	int insertDept(HashMap<String, Object> map);

	Member selectDept(int userCode);
	//회사등록
	int insertCom(HashMap<String, Object> map);

	Member selectCom(int userCode);



}

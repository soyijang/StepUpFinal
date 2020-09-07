package com.stepup.agile.userInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public interface MemberService {

	Member loginMember(Member m) throws LoginFailedException;

	int insertMember(Member m);

	int insertJob(Map<String, Object> member);

	String selectUserProject(Member m);
	
	//myInfo 팀원 리스트조회
	List<Member> selectTeamList(UserTeamList ul);


}

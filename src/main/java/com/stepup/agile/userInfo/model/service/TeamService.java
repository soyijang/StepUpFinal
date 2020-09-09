package com.stepup.agile.userInfo.model.service;

import java.util.List;
import java.util.Map;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.Team;

public interface TeamService {

	List<Team> selectTeam(Team t);

	List<Member> selectUserList(Team t); 

	List<Member> selectAdministration(Member m);

	int insertTeam(Map<String, Object> t)throws Exception ;



}

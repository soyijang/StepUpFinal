package com.stepup.agile.userInfo.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectFeedback.model.vo.SurveyJoinList;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.Team;

public interface TeamDao {

	List<Team> selectTeam(SqlSessionTemplate sqlSession, Team t);

	List<Member> selectUserList(SqlSessionTemplate sqlSession, Team t);

	List<Member> selectAdministration(SqlSessionTemplate sqlSession, Member m);

	int insertTeam(SqlSessionTemplate sqlSession, Map<String,Object> t)throws Exception ;
	
	int insertTeamList(SqlSessionTemplate sqlSession, Map<String,Object> t)throws Exception ;

	int insertTeamJoin(SqlSessionTemplate sqlSession, Member str);

	
	
}

package com.stepup.agile.userInfo.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectFeedback.model.vo.SurveyJoinList;
import com.stepup.agile.userInfo.model.dao.TeamDao;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.Team;

@Service
public class TeamServiceImpl implements TeamService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TeamDao td;
	
	@Override
	public List<Team> selectTeam(Team t) {
		return td.selectTeam(sqlSession, t);
	}

	@Override
	public List<Member> selectUserList(Team t) {
		return td.selectUserList(sqlSession, t);
	}

	@Override
	public List<Member> selectAdministration(Member m) {
		return td.selectAdministration(sqlSession,m);
	}

	@Override
	public int insertTeam(Map<String, Object> t) throws Exception {
		
		int nRes = -1; 
		nRes = td.insertTeam(sqlSession, t);
		
		if(nRes > 0) {
			nRes = td.insertTeamList(sqlSession, t); 
		}
		
		return nRes;
	}

	@Override
	public int insertTeamJoin(Member str) {
		return td.insertTeamJoin(sqlSession, str);
	}

}

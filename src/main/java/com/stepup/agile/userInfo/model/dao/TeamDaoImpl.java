package com.stepup.agile.userInfo.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.Team;

@Repository
public class TeamDaoImpl implements TeamDao{

	@Override
	public List<Team> selectTeam(SqlSessionTemplate sqlSession, Team t) {
		
		return sqlSession.selectList("Team.selectTeam",t);
		
	}

	@Override
	public List<Member> selectUserList(SqlSessionTemplate sqlSession, Team t) {
		
		return sqlSession.selectList("Team.selectUserList",t);
	}

	@Override
	public List<Member> selectAdministration(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Team.selectAdministration");
	}

	@Override
	public int insertTeam(SqlSessionTemplate sqlSession, Map<String, Object> t) throws Exception {
		
		return sqlSession.insert("Team.insertTeam", t);
	}
	
	@Override
	public int insertTeamList(SqlSessionTemplate sqlSession, Map<String, Object> t)throws Exception  {
		
		return sqlSession.insert("Team.insertTeamList", t);
	}
}

package com.stepup.agile.projectFeedback.newsurvey.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.userInfo.model.vo.Member;

@Repository
public class NewSurveyDaoImpl implements NewSurveyDao{

	@Override
	public int insertNewSurvey(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("Survey.insertSurvey", map);
	}

	@Override
	public List<Sprint> selectEndSprint(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Sprint.selectEndSprint", m);
	}

	@Override
	public List<SprintHistory> selectSprintName(SqlSessionTemplate sqlSession, Map<String, Object> map2) {
		return sqlSession.selectList("Sprint.selectSprintName", map2);
	}

}

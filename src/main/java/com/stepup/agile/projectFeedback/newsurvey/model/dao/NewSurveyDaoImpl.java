package com.stepup.agile.projectFeedback.newsurvey.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectFeedback.model.vo.SurveyChoiceList;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.projectFeedback.model.vo.SurveyQuesList;
import com.stepup.agile.userInfo.model.vo.Member;

@Repository
public class NewSurveyDaoImpl implements NewSurveyDao{

	@Override
	public int insertNewSurvey(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("Survey.insertSurvey", map);
	}

	@Override
	public List<Sprint> selectEndSprint(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectList("Sprint.selectEndSprint", map);
	}

	@Override
	public List<SprintHistory> selectSprintName(SqlSessionTemplate sqlSession, Map<String, Object> map2) {
		return sqlSession.selectList("Sprint.selectSprintName", map2);
	}

	@Override
	public int insertNewSurveyMatch(SqlSessionTemplate sqlSession, int insertSurveyList) {
		return sqlSession.insert("Survey.insertNewSurveyMatch", insertSurveyList);
	}

	@Override
	public int insertNewQues(SqlSessionTemplate sqlSession, SurveyQuesList str) {
		return sqlSession.insert("Survey.insertNewQues", str);
	}

	@Override
	public int selectSurvey(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Survey.selectSurvey", m);
	}

	@Override
	public int insertNewChoice(SqlSessionTemplate sqlSession, SurveyChoiceList str) {
		return sqlSession.insert("Survey.insertNewChoice", str);
	}

	@Override
	public int insertQuesMatch(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("Survey.insertQuesMatch", map);
	}


}

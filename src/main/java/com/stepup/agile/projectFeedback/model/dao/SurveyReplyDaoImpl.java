package com.stepup.agile.projectFeedback.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectFeedback.model.vo.SurveyChoiceList;
import com.stepup.agile.projectFeedback.model.vo.SurveyJoinList;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.projectFeedback.model.vo.SurveyReplyList;

@Repository
public class SurveyReplyDaoImpl implements SurveyReplyDao {

	@Override
	public SurveyList selectSurveyOne(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("Survey.selectSurveyOne", map);
	}

	@Override
	public List<SurveyChoiceList> selectSurveyQues(SqlSessionTemplate sqlSession, int surveyCode) {
		return sqlSession.selectList("Survey.selectSurveyQues", surveyCode);
	}

	@Override
	public int insertSurveyReply(SqlSessionTemplate sqlSession, SurveyReplyList replyList) {
		sqlSession.update("Survey.updateJoinList", replyList);
		return sqlSession.insert("Survey.insertSurveyReply", replyList);
	}

	@Override
	public int insertSurveyJoin(SqlSessionTemplate sqlSession, SurveyJoinList str) {
		return sqlSession.insert("Survey.insertSurveyJoin", str);
	}

	
}

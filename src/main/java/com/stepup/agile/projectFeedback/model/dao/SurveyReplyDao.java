package com.stepup.agile.projectFeedback.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectFeedback.model.vo.SurveyChoiceList;
import com.stepup.agile.projectFeedback.model.vo.SurveyJoinList;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.projectFeedback.model.vo.SurveyQuesList;
import com.stepup.agile.projectFeedback.model.vo.SurveyReplyList;

public interface SurveyReplyDao {

	SurveyList selectSurveyOne(SqlSessionTemplate sqlSession, Map<String, Object> map);

	List<SurveyChoiceList> selectSurveyQues(SqlSessionTemplate sqlSession, int surveyCode);

	int insertSurveyReply(SqlSessionTemplate sqlSession, SurveyReplyList replyList);

	int insertSurveyJoin(SqlSessionTemplate sqlSession, SurveyJoinList str);

}

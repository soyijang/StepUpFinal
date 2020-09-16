package com.stepup.agile.projectFeedback.newsurvey.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectFeedback.model.vo.SurveyChoiceList;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.projectFeedback.model.vo.SurveyQuesList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface NewSurveyDao {

	int insertNewSurvey(SqlSessionTemplate sqlSession, Map<String, Object> map);

	List<Sprint> selectEndSprint(SqlSessionTemplate sqlSession, Member m);

	List<SprintHistory> selectSprintName(SqlSessionTemplate sqlSession, Map<String, Object> map2);

	int insertNewSurveyMatch(SqlSessionTemplate sqlSession, int insertSurveyList);

	int insertNewQues(SqlSessionTemplate sqlSession, SurveyQuesList str);

	int selectSurvey(SqlSessionTemplate sqlSession, Member m);

	int insertNewChoice(SqlSessionTemplate sqlSession, SurveyChoiceList str);

	int insertQuesMatch(SqlSessionTemplate sqlSession, Map<String, Object> map);

}

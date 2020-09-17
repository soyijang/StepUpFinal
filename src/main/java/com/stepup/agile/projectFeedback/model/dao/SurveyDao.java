package com.stepup.agile.projectFeedback.model.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface SurveyDao {

	List<SurveyList> selectSurvey(SqlSessionTemplate sqlSession, Member m);

	int updateSurvey(SqlSessionTemplate sqlSession, SurveyList surveyList);

	int deleteSurvey(SqlSessionTemplate sqlSession, int surveyCode);

	int selectSurveyCode(SqlSessionTemplate sqlSession, Map<String, Object> map);


}

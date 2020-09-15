package com.stepup.agile.projectFeedback.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.userInfo.model.vo.Member;

@Repository
public class SurveyDaoImpl implements SurveyDao{

	@Override
	public List<SurveyList> selectSurvey(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("SurveyList.selectSurveyList",m);
	}

	@Override
	public int deleteSurvey(SqlSessionTemplate sqlSession, int surveyCode) {
		return sqlSession.delete("SurveyList.deleteSurvey",surveyCode);
	}



}

package com.stepup.agile.projectFeedback.model.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.userInfo.model.vo.Member;

@Repository
public class SurveyDaoImpl implements SurveyDao{

	private SqlSessionTemplate sqlSession;

	@Override
	public List<SurveyList> selectSurvey(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Survey.selectSurveyList",m);
	}

	@Override
	public int updateSurvey(SqlSessionTemplate sqlSession, SurveyList surveyList) {
		
		return sqlSession.update("Survey.updateSurvey",surveyList);
	}

	@Override
	public int deleteSurvey(SqlSessionTemplate sqlSession, int surveyCode) {
		return sqlSession.delete("Survey.deleteSurvey",surveyCode);
	}

	@Override
	public int selectSurveyCode(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("Survey.selectSurveyCode", map);
	}

}

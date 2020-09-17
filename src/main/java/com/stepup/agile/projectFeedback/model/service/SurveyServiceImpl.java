package com.stepup.agile.projectFeedback.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectFeedback.model.dao.SurveyDao;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.userInfo.model.vo.Member;

@Service
public class SurveyServiceImpl implements SurveyService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SurveyDao sd;

	@Override
	public List<SurveyList> selectSurvey(Member m) {
		return sd.selectSurvey(sqlSession, m);
	}
	@Override
	public int updateSurvey(SurveyList surveyList) {
		
		return sd.updateSurvey(sqlSession, surveyList);
	}

	@Override
	public int deleteSurvey(int surveyCode) {
		return sd.deleteSurvey(sqlSession, surveyCode);
	}

	@Override
	public int selectSurveyCode(Map<String, Object> map) {
		return sd.selectSurveyCode(sqlSession, map);
	}



}

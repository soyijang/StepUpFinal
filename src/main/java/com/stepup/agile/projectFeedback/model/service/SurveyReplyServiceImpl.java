package com.stepup.agile.projectFeedback.model.service;

import java.util.List;
import java.util.Map; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectFeedback.model.dao.SurveyReplyDao;
import com.stepup.agile.projectFeedback.model.vo.SurveyChoiceList;
import com.stepup.agile.projectFeedback.model.vo.SurveyJoinList;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.projectFeedback.model.vo.SurveyQuesList;
import com.stepup.agile.projectFeedback.model.vo.SurveyReplyList;

@Service
public class SurveyReplyServiceImpl implements SurveyReplyService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SurveyReplyDao srd;

	@Override
	public SurveyList selectSurveyOne(Map<String, Object> map) {
		return srd.selectSurveyOne(sqlSession, map);
	}

	@Override
	public List<SurveyChoiceList> selectSurveyQues(int surveyCode) {
		return srd.selectSurveyQues(sqlSession, surveyCode);
	}

	@Override
	public int insertSurveyReply(SurveyReplyList replyList) {
		return srd.insertSurveyReply(sqlSession, replyList);
	}

	@Override
	public int insertSurveyJoin(SurveyJoinList str) {
		return srd.insertSurveyJoin(sqlSession, str);
	}
	
}

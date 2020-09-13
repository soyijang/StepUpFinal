package com.stepup.agile.projectFeedback.newsurvey.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectFeedback.model.vo.SurveyQuesList;
import com.stepup.agile.projectFeedback.newsurvey.model.dao.NewSurveyDao;
import com.stepup.agile.userInfo.model.vo.Member;

@Service
public class NewSurveyServiceImpl implements NewSurveyService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NewSurveyDao nd;
	
	@Override
	public int insertNewSurvey(Map<String, Object> map) {
		return nd.insertNewSurvey(sqlSession, map);
	}

	@Override
	public List<Sprint> selectEndSprint(Member m) {
		return nd.selectEndSprint(sqlSession, m);
	}

	@Override
	public List<SprintHistory> selectSprintName(Map<String, Object> map2) {
		return nd.selectSprintName(sqlSession, map2);
	}

	@Override
	public int insertNewSurveyMatch(int insertSurveyList) {
		return nd.insertNewSurveyMatch(sqlSession, insertSurveyList);
	}

	@Override
	public int insertMultiplechoice(String multichoice) {
		return nd.insertMultiplechoice(sqlSession, multichoice);
	}

	@Override
	public int insertshortanswer(String shortanswer) {
		return nd.insertshortanswer(sqlSession, shortanswer);
	}

	@Override
	public int insertNewQues(SurveyQuesList str) {
		return nd.insertNewQues(sqlSession, str);
	}

}

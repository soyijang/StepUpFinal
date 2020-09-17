package com.stepup.agile.projectFeedback.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface SurveyService {

	List<SurveyList> selectSurvey(Member m);

	int updateSurvey(SurveyList surveyList);

	int deleteSurvey(int surveyCode);

	int selectSurveyCode(Map<String, Object> map);


}

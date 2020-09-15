package com.stepup.agile.projectFeedback.model.service;

import java.util.List;

import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface SurveyService {

	List<SurveyList> selectSurvey(Member m);

	int deleteSurvey(int surveyCode);



	

}

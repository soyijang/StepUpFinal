package com.stepup.agile.projectFeedback.model.service;

import java.util.List;
import java.util.Map;

import com.stepup.agile.projectFeedback.model.vo.SurveyChoiceList;
import com.stepup.agile.projectFeedback.model.vo.SurveyJoinList;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.projectFeedback.model.vo.SurveyQuesList;
import com.stepup.agile.projectFeedback.model.vo.SurveyReplyList;

public interface SurveyReplyService {

	SurveyList selectSurveyOne(Map<String, Object> map);

	List<SurveyChoiceList> selectSurveyQues(int surveyCode);

	int insertSurveyReply(SurveyReplyList replyList);

	int insertSurveyJoin(SurveyJoinList str);
	
	
}

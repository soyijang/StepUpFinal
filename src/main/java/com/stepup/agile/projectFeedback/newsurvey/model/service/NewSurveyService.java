package com.stepup.agile.projectFeedback.newsurvey.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectFeedback.model.vo.SurveyChoiceList;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.projectFeedback.model.vo.SurveyQuesList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface NewSurveyService {

	int insertNewSurvey(Map<String, Object> map);

	List<Sprint> selectEndSprint(Map<String, Object> map2);

	List<SprintHistory> selectSprintName(Map<String, Object> map2);

	int insertNewSurveyMatch(int insertSurveyList);

	int insertNewQues(SurveyQuesList str);

	int selectSurvey(Member m);

	int insertNewChoice(SurveyChoiceList str);

	int insertQuesMatch(Map<String, Object> map);
}

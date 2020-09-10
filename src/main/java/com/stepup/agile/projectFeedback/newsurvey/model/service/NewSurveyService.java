package com.stepup.agile.projectFeedback.newsurvey.model.service;

import java.util.List;
import java.util.Map;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.userInfo.model.vo.Member;

public interface NewSurveyService {

	int insertNewSurvey(Map<String, Object> map);

	List<Sprint> selectEndSprint(Member m);

	List<SprintHistory> selectSprintName(Map<String, Object> map2);

}

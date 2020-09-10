package com.stepup.agile.projectFeedback.newsurvey.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.userInfo.model.vo.Member;

public interface NewSurveyDao {

	int insertNewSurvey(SqlSessionTemplate sqlSession, Map<String, Object> map);

	List<Sprint> selectEndSprint(SqlSessionTemplate sqlSession, Member m);

	List<SprintHistory> selectSprintName(SqlSessionTemplate sqlSession, Map<String, Object> map2);

}

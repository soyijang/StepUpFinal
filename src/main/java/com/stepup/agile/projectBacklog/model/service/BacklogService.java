package com.stepup.agile.projectBacklog.model.service;

import java.util.List;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.userInfo.model.vo.Member;

public interface BacklogService {

	List<Sprint> selectSprint(Member m, int projectCode);

	int insertSprint(int userProjectCode);

	SprintHistory selectSprintOne(Member m, int sprintCode);

	List<TaskHistory> selectSprintTask(Member m, int sprintCode);

	int updateSprint(SprintHistory sprintHistory);

	int updateFinish(SprintHistory sprintHistory);

	int updateStart(SprintHistory sprintHistory);

	int updateTask(int taskCode);

	List<Sprint> searchSprint(Member m, String sprintName);

}

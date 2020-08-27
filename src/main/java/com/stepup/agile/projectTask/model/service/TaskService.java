package com.stepup.agile.projectTask.model.service;

import java.util.List;

import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskService {
	
	int createTask(Member m);

	int updateTitle(Member m);

	List<TaskList> selectBugTask(Member m);

	

}

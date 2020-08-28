package com.stepup.agile.projectTask.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskService {
	
	int createTask(Member m);

	int updateTitle(Member m);

	List<TaskList> selectUserTask(Member m);

	List<TaskList> selectUserTaskStatus(Member m);

	List<TaskList> selectIngTask(Member m);

	List<TaskList> selectNonTask(Member m);

	List<TaskList> selectComTask(Member m);

	List<TaskList> selectSumTask(Member m);

	List<TaskList> selectTaskDate(Member m);

	TaskList selectPjNonTask(Map<String, Object> map);




	

}

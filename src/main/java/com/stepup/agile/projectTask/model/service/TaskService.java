package com.stepup.agile.projectTask.model.service;

import java.util.HashMap;
import java.util.List;

import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskService {
	
	int createTask(Member m);

	int updateTitle(Member m);

	List<TaskHistory> selectBugTask(Member m);

	List<TaskList> selectBugCont(HashMap<String, Object> map);

	int insertCloneBug(HashMap<String, Object> map);

	int insertCloneBug2(HashMap<String, Object> map2);

	int deleteCloneBug(HashMap<String, Object> map);

	List<TaskHistory> searchBug(HashMap<String, Object> map);
	

}

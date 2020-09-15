package com.stepup.agile.userMyTasks.model.service;

import java.util.List;

import com.stepup.agile.userMyTasks.model.vo.MyTask;

public interface MyTasksStandupMeetingService {

	//공유 일정 가져오기
	List<MyTask> selectMytaskShareList(int projectCode);

}

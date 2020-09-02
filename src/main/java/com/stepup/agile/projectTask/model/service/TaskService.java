package com.stepup.agile.projectTask.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskService {
	//1.Task생성
	int createTask(Member m, TaskList t);
    //2.Title 수정
	int updateTitle(Member m, TaskHistory th);

	String selectTitle(int taskHistCode, TaskHistory th);
	
	//3.Descript 수정
	int updateDescript(TaskHistory th);
	//3-1.Descript 조회
	TaskHistory selectDescript(int taskHistCode);
	//4.subTask생성
	int createSubTask(TaskList t);
	//4-1.subTask생성후 Title 수정
	int updateSubTitle(TaskHistory th);
	//4-2.subTask 조회
	TaskHistory selectSubTitle(int taskHistCode);
	//5.댓글생성
	int insertReply(ReplyList reply);
	//5-1.댓글 히스토리update
	int updateReplyHist(ReplyHistory history);
	//5-2.댓글 조회
	ReplyHistory selectReply(ReplyList reply);
	
	List<TaskHistory> selectUserTask(Member m);

	String selectPjNonTask(Map<String, Object> map);
	
	
	
	
	


}

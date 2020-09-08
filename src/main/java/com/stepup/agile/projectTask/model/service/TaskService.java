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
	TaskList selectTask(int taskCode);
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
	List<ReplyHistory> selectSubTitle(int headTaskCode);
	//5.댓글생성
	int insertReply(ReplyList replyList);
	//5-1.댓글 히스토리update
	int updateReplyHist(ReplyHistory history);
	//5-2.댓글 조회
	List<ReplyHistory> selectReply(Map<String, Object> map);
	//5-3.댓글 수정
	int updateReply(int replyCode);
	//5-4.댓글 삭제
	int deleteReply(int replyCode);
	//6.담당자 변경
	List<Member> selectTeam(int userCode);
	int taskUser(HashMap<String, Object> map);
//	int updateTaskList(int memberCode);
	//6-2.보고자변경
	List<Member> selectTeam2(int userCode);
	int taskMaster(HashMap<String, Object> map);
	int updateTaskList2(int masterCode);
	//7.레이블생성
	int createLabel(TaskHistory th);
	//7-1.레이블 조회
	TaskHistory selectLabel(int taskHistCode);
	//8.Story Point 생성
	int insertPoint(TaskHistory th);
	//8-1.Story Point 조회
	TaskHistory selectPoint(int taskHistCode);
	//9.최초예상시간 생성
	int createExpect(TaskHistory th);
	//9-1.최초예상시간 조회
	TaskHistory selectExpect(int taskHistCode);
	//11.우선순위
	int taskProperty1(TaskHistory t);
	TaskHistory taskPropertySelect1(int taskHistCode);
	int taskProperty2(TaskHistory t);
	TaskHistory taskPropertySelect2(int taskHistCode);
	int taskProperty3(TaskHistory t);
	TaskHistory taskPropertySelect3(int taskHistCode);
	//12.진행상태
	int taskStatus1(TaskHistory t);
	TaskHistory taskStatusSelect1(int result);
	int taskStatus2(TaskHistory t);
	TaskHistory taskStatusSelect2(int result);
	//13.복제클릭 이벤트
	int insertCloneTask(HashMap<String, Object> map);
	//13-1.복제클릭 이벤트(복제 TaskCode)
	int insertCloneTask2(HashMap<String, Object> map2);
	//14.삭제 이벤트
	int deleteCloneTask(HashMap<String, Object> map);
	
	
	//Bug
	List<TaskHistory> selectUserTask(Member m);
	
	String selectPjNonTask(Map<String, Object> map);
	
	List<TaskHistory> selectBugTask(Member m);

	List<TaskList> selectBugCont(HashMap<String, Object> map);

	int insertCloneBug(HashMap<String, Object> map);

	int insertCloneBug2(HashMap<String, Object> map2);

	int deleteCloneBug(HashMap<String, Object> map);

	List<TaskHistory> searchBug(HashMap<String, Object> map);












	



	
	
	
	
	
	
	
	
	
}

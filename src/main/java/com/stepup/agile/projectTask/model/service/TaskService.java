package com.stepup.agile.projectTask.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskService {
	
	int createTask(Member m, TaskList t);

	int updateTitle(Member m, TaskHistory th);

	String selectTitle(int taskHistCode, TaskHistory th);

	List<TaskHistory> selectUserTask(Member m);

	String selectPjNonTask(Map<String, Object> map);

	List<TaskHistory> selectBugTask(Member m);

	List<TaskList> selectBugCont(HashMap<String, Object> map);

	int insertCloneBug(HashMap<String, Object> map);

	int insertCloneBug2(HashMap<String, Object> map2);

	int deleteCloneBug(HashMap<String, Object> map);

	List<TaskHistory> searchBug(HashMap<String, Object> map);

	int insertReply(ReplyList reply);

	int updateReplyHist(ReplyHistory history);

	List<ReplyHistory> selectReply(Map<String, Object> map);
	
	//miso Kim's task ------------------------------------------------------------------------------------
	//테스크 리스트 조회 후 보드 메인 view로 이동(현재 진행중인 스프린트의 tasklist만 조회)
	List<TaskHistory> selectTaskList(HashMap<String, Object> map);
}

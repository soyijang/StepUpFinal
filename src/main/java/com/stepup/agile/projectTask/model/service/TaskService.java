package com.stepup.agile.projectTask.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

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
	
	//miso Kim's task ------------------------------------------------------------------------------------
	//테스크 리스트 조회 후 보드 메인 view로 이동(현재 진행중인 스프린트의 tasklist만 조회)
	List<TaskHistory> selectTaskList(HashMap<String, Object> map);
 	//플래그 추가
	int insertTaskHistoryFlagYes(TaskHistory taskHistory);
 	//플래그 제거
	int insertTaskHistoryFlagNo(TaskHistory taskHistory);
	//레이블 제거
	int insertTaskHistoryLabelNo(TaskHistory taskHistory);
	//테스크 삭제
	int insertTaskHistoryTaskDelete(TaskHistory taskHistory);
	//레이블 리스트 조회(레이블 추가 기능에서 기존 레이블 실시간 조회후 리스트 보여주기)
	List<TaskHistory> selectLabelList(Map<String, Object> map);
	//레이블 추가	
	int insertTaskHistoryLabelYes(TaskHistory taskHistory);
	//특정 테스크의 최근 담당자 및 관리자 조회(taskHistory insert시 필요한 정보)	
	TaskHistory selectTaskUserAndMaster(int taskCode);
	//스프린트 리스트 실시간 조회 (현재 프로젝트 코드 기준으로 테스크 상위항목 변경 위해 조회해온다.)	
	List<SprintHistory> selectSprintList(Map<String, Object> map);
	//테스크 진행상태 변경 (드래그앤드롭 기능)
	int insertTaskHistoryTaskProceeding(TaskHistory taskHistory);
	//하위 테스크 headTaskCode 업데이트 (드래그앤드롭 기능)	
	int updateTaskListHeadTaskCode(TaskList taskList);
	//사용자 팀코드 조회
	UserTeamList selectUserTeamCode(Member m);
	//팀 멤버 조회
	List<Member> selectUserMemberList(int teamCode);
	//팀코드 조회
	int selectTeamCode(int userTeamCode);
	//상위 항목 변경(테스크의 스프린트 변경)
	int updateTaskSprintCode(Map<String, Object> map);
	//최신 스프린트 히스토리 조회
	SprintHistory selectRecentSprintHistory(int sprintCode);
	//스프린트 종료
	int insertSprintHistorySprintType(SprintHistory sprintHistory);
   //하위 테스트 스프린트 업데이트
   int updateSubList(Map<String, Object> map);
	
}

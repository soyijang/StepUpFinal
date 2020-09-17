package com.stepup.agile.projectTask.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.Bookmark;
import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public interface TaskDao {
	//1.Task생성
	int createTask(SqlSessionTemplate sqlSession, Member m, TaskList t);
	TaskList selectTask(SqlSessionTemplate sqlSession, int taskCode);
	//2.Title 수정
	int updateTitle(SqlSessionTemplate sqlSession, Member m, TaskHistory th);

	String selectTitle(SqlSessionTemplate sqlSession, int taskHistCode, TaskHistory th);
	//3.Descript수정
	int updateDescript(SqlSessionTemplate sqlSession, TaskHistory th);
	//3-1.Descript 조회
	TaskHistory selectDescript(SqlSessionTemplate sqlSession, int taskHistCode);
	//4.subTask생성
	int createSubTask(SqlSessionTemplate sqlSession, TaskList t);
	//4-1.subTask생성 후 Title 수정
	int updateSubTitle(SqlSessionTemplate sqlSession, TaskHistory th);
	//4-2.subTask select
	List<ReplyHistory> selectSubTitle(SqlSessionTemplate sqlSession, int headTaskCode);
	//5.댓글생성
	int insertReply(SqlSessionTemplate sqlSession, ReplyList replyList);
	//5-1.댓글히스토리 업데이트
	int updateReplyHist(SqlSessionTemplate sqlSession, ReplyHistory history);
	//5-2.댓글조회
	List<ReplyHistory> selectReply(SqlSessionTemplate sqlSession, Map<String, Object> map);
	//5-3.댓글수정
	int updateReply(SqlSessionTemplate sqlSession, int replyCode);
	//5-4.댓글삭제
	int deleteReply(SqlSessionTemplate sqlSession, int replyCode);
	//6.담당자 변경
	List<Member> selectTeam(SqlSessionTemplate sqlSession, int userCode);
	int insertTaskUser(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
//	int updateTaskList(SqlSessionTemplate sqlSession, int memberCode);
	//6-1.보고자 변경
	List<Member> selectTeam2(SqlSessionTemplate sqlSession, int userCode);
	int insertMaster(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
	int updateTaskList2(SqlSessionTemplate sqlSession, int masterCode);
	//7.레이블생성
	int createLabel(SqlSessionTemplate sqlSession, TaskHistory th);
	//7-1.레이블조회
	TaskHistory selectLabel(SqlSessionTemplate sqlSession, int taskHistCode);
	//8.Story Point 생성
	int insertPoint(SqlSessionTemplate sqlSession, TaskHistory th);
	//8-1.Story Point 조회
	TaskHistory selectPoint(SqlSessionTemplate sqlSession, int taskHistCode);
	//9.최초예상시간입력
	int createExpect(SqlSessionTemplate sqlSession, TaskHistory th);
	//9-1.최초예상시간조회
	TaskHistory selectExpect(SqlSessionTemplate sqlSession, int taskHistCode);
	//11.우선순위
	int taskProperty1(SqlSessionTemplate sqlSession, TaskHistory t);
	TaskHistory taskPropertySelect1(SqlSessionTemplate sqlSession, int taskHistCode);
	int taskProperty2(SqlSessionTemplate sqlSession, TaskHistory t);
	TaskHistory taskPropertySelect2(SqlSessionTemplate sqlSession, int taskHistCode);
	int taskProperty3(SqlSessionTemplate sqlSession, TaskHistory t);
	TaskHistory taskPropertySelect3(SqlSessionTemplate sqlSession, int taskHistCode);
	//12.진행상태
	int taskStatus1(SqlSessionTemplate sqlSession, TaskHistory t);
	TaskHistory taskStatusSelect1(SqlSessionTemplate sqlSession, int result);
	int taskStatus2(SqlSessionTemplate sqlSession, TaskHistory t);
	TaskHistory taskStatusSelect2(SqlSessionTemplate sqlSession, int result);
	//13.복제 이벤트
	int insertClonTask(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
	//13-1.복제 이벤트(복제 TaskCode)
	int insertClonTask2(SqlSessionTemplate sqlSession, HashMap<String, Object> map2);
	//14.삭제 이벤트
	int deleteClonTask(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
	//15.버그모드
	int insertBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
	//16.북마크추가
	int checkBookmark(SqlSessionTemplate sqlSession, Bookmark bookmark);
	//17.북마크취소
	int deleteBookmark(SqlSessionTemplate sqlSession, int bookmarkCode);

	
	//Bug
	List<TaskHistory> selectUserTask(SqlSessionTemplate sqlSession, Member m);
	
	String selectPjNonTask(SqlSessionTemplate sqlSession, Map<String, Object> map);

	List<TaskHistory> selectBugTask(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	List<TaskList> selectBugCont(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	int insertCloneBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	int insertCloneBug2(SqlSessionTemplate sqlSession, HashMap<String, Object> map2);

	int deleteCloneBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	List<TaskHistory> searchBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map);



	//miso Kim's task ------------------------------------------------------------------------------------
	//테스크 리스트 조회 후 보드 메인 view로 이동(현재 진행중인 스프린트의 tasklist만 조회)
	List<TaskHistory> selectTaskList(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
 	//플래그 추가
	int insertTaskHistoryFlagYes(SqlSessionTemplate sqlSession, TaskHistory taskHistory);
 	//플래그 제거
	int insertTaskHistoryFlagNo(SqlSessionTemplate sqlSession, TaskHistory taskHistory);
	//레이블 제거
	int insertTaskHistoryLabelNo(SqlSessionTemplate sqlSession, TaskHistory taskHistory);
	//테스크 삭제
	int insertTaskHistoryTaskDelete(SqlSessionTemplate sqlSession, TaskHistory taskHistory);
	//레이블 리스트 조회(레이블 추가 기능에서 기존 레이블 실시간 조회후 리스트 보여주기)	
	List<TaskHistory> selectLabelList(SqlSessionTemplate sqlSession, Map<String, Object> map);
	//레이블 추가	
	int insertTaskHistoryLabelYes(SqlSessionTemplate sqlSession, TaskHistory taskHistory);
	//특정 테스크의 최근 담당자 및 관리자 조회(taskHistory insert시 필요한 정보)	
	TaskHistory selectTaskUserAndMaster(SqlSessionTemplate sqlSession, int taskCode);
	//스프린트 리스트 실시간 조회 (현재 프로젝트 코드 기준으로 테스크 상위항목 변경 위해 조회해온다.)	
	List<SprintHistory> selectSprintList(SqlSessionTemplate sqlSession, Map<String, Object> map);
	//테스크 진행상태 변경 (드래그앤드롭 기능)	
	int insertTaskHistoryTaskProceeding(SqlSessionTemplate sqlSession, TaskHistory taskHistory);
	//하위 테스크 headTaskCode 업데이트 (드래그앤드롭 기능)		
	int updateTaskListHeadTaskCode(SqlSessionTemplate sqlSession, TaskList taskList);
	//사용자 팀코드 조회
	UserTeamList selectUserTeamCode(SqlSessionTemplate sqlSession, Member m);
	//팀 멤버 조회
	List<Member> selectUserMemberList(SqlSessionTemplate sqlSession, int teamCode);
	//팀코드 조회
	int selectTeamCode(SqlSessionTemplate sqlSession, int userTeamCode);
	//상위 항목 변경(테스크의 스프린트 변경)	
	int updateTaskSprintCode(SqlSessionTemplate sqlSession, Map<String, Object> map);
	//최신 스프린트 히스토리 조회	
	SprintHistory selectRecentSprintHistory(SqlSessionTemplate sqlSession, int sprintCode);
	//스프린트 종료
	int insertSprintHistorySprintType(SqlSessionTemplate sqlSession, SprintHistory sprintHistory);
	








	


	



	
	

	
	
	
	
	
}

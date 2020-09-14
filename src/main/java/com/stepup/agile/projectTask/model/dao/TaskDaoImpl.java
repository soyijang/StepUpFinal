package com.stepup.agile.projectTask.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

@Repository	
public class TaskDaoImpl implements TaskDao {
	//1.Task생성
	@Override
	public int createTask(SqlSessionTemplate sqlSession, Member m, TaskList t) {
		t.setTaskUser(m.getUserCode());
		
		/* int taskCode = sqlSession.insert("Task.createTask", t); */
		sqlSession.insert("Task.createTask", t);
		
		int taskCode = t.getTaskCode();
		
		return taskCode;
	}
	@Override
	public TaskList selectTask(SqlSessionTemplate sqlSession, int taskCode) {

		
		return sqlSession.selectOne("Task.selectTask", taskCode);
	}

	//2.Title 수정
	@Override
	public int updateTitle(SqlSessionTemplate sqlSession, Member m, TaskHistory th) {

		return sqlSession.insert("Task.updateTaskTitle", th);
	}

	@Override
	public String selectTitle(SqlSessionTemplate sqlSession, int taskHistCode, TaskHistory th) {

		System.out.println(th);
		System.out.println(taskHistCode);
		return sqlSession.selectOne("Task.selectTaskTitle", th);
	}
	//3.Descript 수정
	@Override
	public int updateDescript(SqlSessionTemplate sqlSession, TaskHistory th) {

		return sqlSession.insert("Task.updateDescript", th);
	}
	//3-1.Descript 조회
	@Override
	public TaskHistory selectDescript(SqlSessionTemplate sqlSession, int taskHistCode) {

		return sqlSession.selectOne("Task.selectDescript", taskHistCode);
	}
	//4.subTask생성
	@Override
	public int createSubTask(SqlSessionTemplate sqlSession, TaskList t) {
		sqlSession.insert("Task.createSubTask", t);

		int subTaskCode = t.getTaskCode();
		return subTaskCode;
	}
	//4-1.subTask생성 후 Title 수정
	@Override
	public int updateSubTitle(SqlSessionTemplate sqlSession, TaskHistory th) {

		return sqlSession.insert("Task.updateSubTitle", th);
	}
	//4-2.subTask select
	@Override
	public List<ReplyHistory> selectSubTitle(SqlSessionTemplate sqlSession, int headTaskCode) {

		return sqlSession.selectList("Task.selectSubTitle", headTaskCode);
	}
	//5.댓글생성
	@Override
	public int insertReply(SqlSessionTemplate sqlSession, ReplyList replyList) {
		
		sqlSession.insert("Task.insertReply", replyList);
		int replyCode = replyList.getReplyCode();
		
		return replyCode;
	}
	//5-1.댓글히스토리 업데이트
	@Override
	public int updateReplyHist(SqlSessionTemplate sqlSession, ReplyHistory history) {
		
		sqlSession.update("Task.updateReplyHist", history);
		
		int histCode = history.getReplyHistCode();

		return histCode;
	}
	//5-2.댓글조회
	@Override
	public List<ReplyHistory> selectReply(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		return sqlSession.selectList("Task.selectReply", map);
	}
	//5-3.댓글수정
	@Override
	public int updateReply(SqlSessionTemplate sqlSession, int replyCode) {

		return sqlSession.update("Task.updateReply", replyCode);
	}
	//5-4.댓글삭제
	@Override
	public int deleteReply(SqlSessionTemplate sqlSession, int replyCode) {

		return sqlSession.delete("Task.deleteReply", replyCode);
	}
	
	//6.담당자 변경
	@Override
	public List<Member> selectTeam(SqlSessionTemplate sqlSession, int userCode) {

		return sqlSession.selectList("Task.selectTeam", userCode);
	}	
	@Override
	public int insertTaskUser(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.insert("Task.insertTaskUser", map);
	}
//	@Override
//	public int updateTaskList(SqlSessionTemplate sqlSession, int memberCode) {

//		return sqlSession.update("Task.updateTaskList", memberCode);
//	}
	//6-1.보고자변경
	@Override
	public List<Member> selectTeam2(SqlSessionTemplate sqlSession, int userCode) {

		return sqlSession.selectList("Task.selectTeam2", userCode);
	}
	@Override
	public int insertMaster(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.insert("Task.insertMaster", map);
	}
	@Override
	public int updateTaskList2(SqlSessionTemplate sqlSession, int masterCode) {

		return sqlSession.update("Task.updateTaskList2", masterCode);
	}
	//7.레이블생성
	@Override
	public int createLabel(SqlSessionTemplate sqlSession, TaskHistory th) {

		return sqlSession.insert("Task.insertLabel", th);
	}
	//7-1레이블조회
	@Override
	public TaskHistory selectLabel(SqlSessionTemplate sqlSession, int taskHistCode) {

		return sqlSession.selectOne("Task.selectLabel", taskHistCode);
	}
	//8.Story Point 생성
	@Override
	public int insertPoint(SqlSessionTemplate sqlSession, TaskHistory th) {

		return sqlSession.insert("Task.insertPoint", th);
	}
	//8.Story Point 조회
	@Override
	public TaskHistory selectPoint(SqlSessionTemplate sqlSession, int taskHistCode) {

		return sqlSession.selectOne("Task.selectPoint", taskHistCode);
	}

	//9.최초예상시간입력
	@Override
	public int createExpect(SqlSessionTemplate sqlSession, TaskHistory th) {

		return sqlSession.insert("Task.insertExpect", th);
	}
	//9-1.최초예상시간조회
	@Override
	public TaskHistory selectExpect(SqlSessionTemplate sqlSession, int taskHistCode) {

		return sqlSession.selectOne("Task.selectExpect", taskHistCode);
	}
	//11.우선순위
	@Override
	public int taskProperty1(SqlSessionTemplate sqlSession, TaskHistory t) {
		
		sqlSession.insert("Task.insertProperty1", t);
		
		int taskHistCode = t.getTaskHistCode();

		return taskHistCode;
	}
	@Override
	public TaskHistory taskPropertySelect1(SqlSessionTemplate sqlSession, int taskHistCode) {

		return sqlSession.selectOne("Task.selectProperty1", taskHistCode);
	}
	@Override
	public int taskProperty2(SqlSessionTemplate sqlSession, TaskHistory t) {
		
		sqlSession.insert("Task.insertProperty2", t);
		
		int taskHistCode = t.getTaskHistCode();
		return taskHistCode;
	}
	@Override
	public TaskHistory taskPropertySelect2(SqlSessionTemplate sqlSession, int taskHistCode) {

		return sqlSession.selectOne("Task.selectProperty3", taskHistCode);
	}
	@Override
	public int taskProperty3(SqlSessionTemplate sqlSession, TaskHistory t) {
		
		sqlSession.insert("Task.insertProperty3", t);
		
		int taskHistCode = t.getTaskHistCode();
		
		return taskHistCode;
	}
	@Override
	public TaskHistory taskPropertySelect3(SqlSessionTemplate sqlSession, int taskHistCode) {

		return sqlSession.selectOne("Task.selectProperty3", taskHistCode);
	}
	//12.진행상태
	@Override
	public int taskStatus1(SqlSessionTemplate sqlSession, TaskHistory t) {
		
//		if(th.getTaskHistValue().equals("work")) {
//			
//			System.out.println(sqlSession.insert("Task.taskStatus1", th));
//		} else if(th.getTaskHistValue().equals("done")) {
//			sqlSession.insert("Task.taskStatus2", th);
//			System.out.println(sqlSession.insert("Task.taskStatus2", th));
//		}
		sqlSession.insert("Task.taskStatus1", t);
		
		int taskHistCode = t.getTaskHistCode();
		
		return taskHistCode;	
	}
	@Override
	public TaskHistory taskStatusSelect1(SqlSessionTemplate sqlSession, int result) {

		return sqlSession.selectOne("Task.tastStatusSelect1", result);
	}
	@Override
	public int taskStatus2(SqlSessionTemplate sqlSession, TaskHistory t) {
		
		sqlSession.insert("Task.taskStatus2", t);
		
		int taskHistCode = t.getTaskHistCode();
		
		return taskHistCode;
	}
	@Override
	public TaskHistory taskStatusSelect2(SqlSessionTemplate sqlSession, int result) {

		return sqlSession.selectOne("Task.tastStatusSelect1", result);
	}
	//13.복제 이벤트
	@Override
	public int insertClonTask(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		sqlSession.insert("Task.insertCloneTask", map);
		
		int taskCode = (int) map.get("taskCode") - 1;
		
		return taskCode;
	}
	//13-1.복제 이벤트(복제 TaskCode)
	@Override
	public int insertClonTask2(SqlSessionTemplate sqlSession, HashMap<String, Object> map2) {

		int result = 0;
		int result1 = sqlSession.insert("Task.insertCloneTask2", map2);
		int result2 = sqlSession.insert("Task.insertCloneTask3", map2);
		int result3 = sqlSession.insert("Task.insertCloneTask4", map2);
		int result4 = sqlSession.insert("Task.insertCloneTask5", map2);
		int result5 = sqlSession.insert("Task.insertCloneTask6", map2);
		int result6 = sqlSession.insert("Task.insertCloneTask7", map2);
		int result7 = sqlSession.insert("Task.insertCloneTask8", map2);
		int result8 = sqlSession.insert("Task.insertCloneTask9", map2);
		int result9 = sqlSession.insert("Task.insertCloneTask10", map2);
		int result10 = sqlSession.insert("Task.insertCloneTask11", map2);
		int result11 = sqlSession.insert("Task.insertCloneTask12", map2);
		int result12 = sqlSession.insert("Task.insertCloneTask13", map2);
		int result13 = sqlSession.insert("Task.insertCloneTask14", map2);
		int result14 = sqlSession.insert("Task.insertCloneTask15", map2);
		int result15 = sqlSession.insert("Task.insertCloneTask16", map2);
		
		
		if(result1 > 0) {
			
			sqlSession.insert("Task.insertCloneTask3", map2);
			
			if(result2 > 0) {
				
				sqlSession.insert("Task.insertCloneTask4", map2);
				
				if(result3 > 0) {
					
					sqlSession.insert("Task.insertCloneTask5", map2);
					
					if(result4 > 0) {
						
						sqlSession.insert("Task.insertCloneTask6", map2);
						
						if(result5 > 0) {
							
							sqlSession.insert("Task.insertCloneTask7", map2);
							
							if(result6 > 0) {
								
								sqlSession.insert("Task.insertCloneTask8", map2);
								
								if(result7 > 0) {
									
									sqlSession.insert("Task.insertCloneTask9", map2);
									
									if(result8 > 0) {
										
										sqlSession.insert("Task.insertCloneTask10", map2);
										
										if(result9 > 0) {
											
											sqlSession.insert("Task.insertCloneTask11", map2);
											
											if(result10 > 0) {
												
												sqlSession.insert("Task.insertCloneTask12", map2);
												
												if(result11 > 0) {
													
													sqlSession.insert("Task.insertCloneTask13", map2);
													
													if(result12 > 0) {
														
														sqlSession.insert("Task.insertCloneTask14", map2);
														
														if(result13 > 0) {
															
															sqlSession.insert("Task.insertCloneTask15", map2);
															
															if(result14 > 0) {
																
																sqlSession.insert("Task.insertCloneTask16", map2);
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		return result;
	}
	//14.삭제 이벤트
	@Override
	public int deleteClonTask(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.delete("Task.deleteCloneTask", map);
	}

	
	
	
	//Bug
	@Override
	public List<TaskHistory> selectUserTask(SqlSessionTemplate sqlSession, Member m) {
		System.out.println(m.getUserCode());
		return sqlSession.selectList("Task.selectUserTaskTitle", m);
	}
	
	@Override
	public String selectPjNonTask(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		if(sqlSession.selectOne("Task.selectPjNonTask", map) == null) {
			return "0";
		} else {
			return sqlSession.selectOne("Task.selectPjNonTask", map);
		}
	}

	@Override
	public List<TaskHistory> selectBugTask(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectList("Task.selectBugTask", m);
	}

	@Override
	public List<TaskList> selectBugCont(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectList("Task.selectBugCont", map);
	}

	@Override
	public int insertCloneBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		sqlSession.insert("Task.insertCloneBug", map);
		
		int taskCode = (int) map.get("taskCode") - 1;
		
		return taskCode;
	}

	@Override
	public int insertCloneBug2(SqlSessionTemplate sqlSession, HashMap<String, Object> map2) {
		int result = 0;
		int result1 = sqlSession.insert("Task.insertCloneBug2", map2);
		int result2 = sqlSession.insert("Task.insertCloneBug3", map2);
		int result3 = sqlSession.insert("Task.insertCloneBug4", map2);
		
		if(result1 > 0) {
			
			sqlSession.insert("Task.insertCloneBug3", map2);
			
			if(result2 > 0) {
				
				sqlSession.insert("Task.insertCloneBug4", map2);
				
				if(result3 > 0) {
					
					result = 3;
				}
			}
		}
		return result;
		
	}

	@Override
	public int deleteCloneBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.delete("Task.deleteCloneBug", map);
	}

	@Override
	public List<TaskHistory> searchBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectList("Task.searchBug", map);
	}


	//miso Kim's task ------------------------------------------------------------------------------------
	//테스크 리스트 조회 후 보드 메인 view로 이동(현재 진행중인 스프린트의 tasklist만 조회)
	@Override
	public List<TaskHistory> selectTaskList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectList("Task.selectTaskList", map);
	}
 	//플래그 추가
	@Override
	public int insertTaskHistoryFlagYes(SqlSessionTemplate sqlSession, TaskHistory taskHistory) {
		return sqlSession.insert("Task.insertTaskHistoryFlagYes", taskHistory);
	}
 	//플래그 제거
	@Override
	public int insertTaskHistoryFlagNo(SqlSessionTemplate sqlSession, TaskHistory taskHistory) {
		return sqlSession.insert("Task.insertTaskHistoryFlagNo", taskHistory);
	}
	//레이블 제거
	@Override
	public int insertTaskHistoryLabelNo(SqlSessionTemplate sqlSession, TaskHistory taskHistory) {
		return sqlSession.insert("Task.insertTaskHistoryLabelNo", taskHistory);
	}
	//테스크 삭제
	@Override
	public int insertTaskHistoryTaskDelete(SqlSessionTemplate sqlSession, TaskHistory taskHistory) {
		return sqlSession.insert("Task.insertTaskHistoryTaskDelete", taskHistory);
	}
	//레이블 리스트 조회(레이블 추가 기능에서 기존 레이블 실시간 조회후 리스트 보여주기)	
	@Override
	public List<TaskHistory> selectLabelList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectList("Task.selectLabelList", map);
	}
	//레이블 추가
	@Override
	public int insertTaskHistoryLabelYes(SqlSessionTemplate sqlSession, TaskHistory taskHistory) {
		return sqlSession.insert("Task.insertTaskHistoryLabelYes", taskHistory);
	}
	//특정 테스크의 최근 담당자 및 관리자 조회(taskHistory insert시 필요한 정보)	
	@Override
	public TaskHistory selectTaskUserAndMaster(SqlSessionTemplate sqlSession, int taskCode) {
		return sqlSession.selectOne("Task.selectTaskUserAndMaster", taskCode);
	}
	//스프린트 리스트 실시간 조회 (현재 프로젝트 코드 기준으로 테스크 상위항목 변경 위해 조회해온다.)	
	@Override
	public List<SprintHistory> selectSprintList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectList("Task.selectSprintList", map);
	}
	//테스크 진행상태 변경 (드래그앤드롭 기능)
	@Override
	public int insertTaskHistoryTaskProceeding(SqlSessionTemplate sqlSession, TaskHistory taskHistory) {
		return sqlSession.insert("Task.insertTaskHistoryTaskProceeding", taskHistory);
	}
}

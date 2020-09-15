package com.stepup.agile.projectTask.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.dao.TaskDao;
import com.stepup.agile.projectTask.model.vo.Bookmark;
import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

@Service
public class TaskServiceImpl implements TaskService {
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Autowired
	public TaskDao td;
	//1.Task생성
	@Override
	public int createTask(Member m, TaskList t) {
		
		return td.createTask(sqlSession, m, t);
	}
	@Override
	public TaskList selectTask(int taskCode) {

		return td.selectTask(sqlSession, taskCode);
	}
	//2.Title 수정
	@Override
	public int updateTitle(Member m, TaskHistory th) {

		return td.updateTitle(sqlSession, m, th);
	}
    
	@Override
	public String selectTitle(int taskHistCode, TaskHistory th) {
		
		return td.selectTitle(sqlSession, taskHistCode, th);
	}
	//3.Descript 수정
	@Override
	public int updateDescript(TaskHistory th) {

		return td.updateDescript(sqlSession, th);
	}
	//3-1.Descript 조회
	@Override
	public TaskHistory selectDescript(int taskHistCode) {

		return td.selectDescript(sqlSession, taskHistCode);
	}
	//4.subTask생성
	@Override
	public int createSubTask(TaskList t) {
		
		return td.createSubTask(sqlSession, t);
	}
	//4-1.subTask생성 후 Title 수정
	@Override
	public int updateSubTitle(TaskHistory th) {

		return td.updateSubTitle(sqlSession, th);
	}
	//4-2.subTask select
	@Override
	public List<ReplyHistory> selectSubTitle(int headTaskCode) {
		return td.selectSubTitle(sqlSession, headTaskCode);
	}
	//5.댓글 생성
	@Override
	public int insertReply(ReplyList replyList) {

		return td.insertReply(sqlSession, replyList);
	}
	//5-1.댓글 히스토리 업데이트
	@Override
	public int updateReplyHist(ReplyHistory history) {

		return td.updateReplyHist(sqlSession, history);
	}
	//5-2.댓글 조회
	@Override
	public List<ReplyHistory> selectReply(Map<String, Object> map) {

		return td.selectReply(sqlSession, map);
	}
	//5-3.댓글 수정
	@Override
	public int updateReply(int replyCode) {

		return td.updateReply(sqlSession, replyCode);
	}
	//5-4.댓글 삭제
	@Override
	public int deleteReply(int replyCode) {

		return td.deleteReply(sqlSession, replyCode);
	}
	//6.담당자변경
	@Override
	public List<Member> selectTeam(int userCode) {
		
		return td.selectTeam(sqlSession, userCode);
	}
	@Override
	public int taskUser(HashMap<String, Object> map) {

		return td.insertTaskUser(sqlSession, map);
	}
//	@Override
//	public int updateTaskList(int memberCode) {

//		return td.updateTaskList(sqlSession, memberCode);
//	}
	//6-1.보고자변경
	@Override
	public List<Member> selectTeam2(int userCode) {

		return td.selectTeam2(sqlSession, userCode);
	}
	@Override
	public int taskMaster(HashMap<String, Object> map) {

		return td.insertMaster(sqlSession, map);
	}
	@Override
	public int updateTaskList2(int masterCode) {

		return td.updateTaskList2(sqlSession, masterCode);
	}
	//7.레이블생성
	@Override
	public int createLabel(TaskHistory th) {

		return td.createLabel(sqlSession, th);
	}
	//7-1.레이블조회
	@Override
	public TaskHistory selectLabel(int taskHistCode) {

		return td.selectLabel(sqlSession, taskHistCode);
	}
	//8.Story Point 생성
	@Override
	public int insertPoint(TaskHistory th) {

		return td.insertPoint(sqlSession, th);
	}
	//8-1.Story Point 조회
	@Override
	public TaskHistory selectPoint(int taskHistCode) {

		return td.selectPoint(sqlSession, taskHistCode);
	}
	//9.최초예상시간입력
	@Override
	public int createExpect(TaskHistory th) {

		return td.createExpect(sqlSession, th);
	}
	//9-1.최초예상시간조회
	@Override
	public TaskHistory selectExpect(int taskHistCode) {
		
		return td.selectExpect(sqlSession, taskHistCode);
	}
	//11.우선순위
	@Override
	public int taskProperty1(TaskHistory t) {

		return td.taskProperty1(sqlSession, t);
	}
	@Override
	public TaskHistory taskPropertySelect1(int taskHistCode) {

		return td.taskPropertySelect1(sqlSession, taskHistCode);
	}
	@Override
	public int taskProperty2(TaskHistory t) {

		return td.taskProperty2(sqlSession, t);
	}
	@Override
	public TaskHistory taskPropertySelect2(int taskHistCode) {

		return td.taskPropertySelect2(sqlSession, taskHistCode);
	}
	@Override
	public int taskProperty3(TaskHistory t) {

		return td.taskProperty3(sqlSession, t);
	}
	@Override
	public TaskHistory taskPropertySelect3(int taskHistCode) {

		return td.taskPropertySelect3(sqlSession, taskHistCode);
	}
	//12.진행상태
	@Override
	public int taskStatus1(TaskHistory t) {

		return td.taskStatus1(sqlSession, t);
	}
	@Override
	public TaskHistory taskStatusSelect1(int result) {

		return td.taskStatusSelect1(sqlSession, result);
	}

	@Override
	public int taskStatus2(TaskHistory t) {

		return td.taskStatus2(sqlSession, t);
	}
	@Override
	public TaskHistory taskStatusSelect2(int result) {

		return td.taskStatusSelect2(sqlSession, result);
	}
	//13.복제 이벤트
	@Override
	public int insertCloneTask(HashMap<String, Object> map) {
		
		return td.insertClonTask(sqlSession, map);
	}
	//13-1.복제 이벤트(복제 TaskCode)
	@Override
	public int insertCloneTask2(HashMap<String, Object> map2) {

		return td.insertClonTask2(sqlSession, map2);
	}
	//14.삭제 이벤트
	@Override
	public int deleteCloneTask(HashMap<String, Object> map) {

		return td.deleteClonTask(sqlSession, map);
	}
	
	
	//Bug
	@Override
	public List<TaskHistory> selectUserTask(Member m) {
		return td.selectUserTask(sqlSession, m);
	}
	
	@Override
	public String selectPjNonTask(Map<String, Object> map) {
		return td.selectPjNonTask(sqlSession, map);
	}

	
	@Override
	public List<TaskHistory> selectBugTask(Member m) {
		return td.selectBugTask(sqlSession, m);
	}


	@Override
	public List<TaskList> selectBugCont(HashMap<String, Object> map) {
		return td.selectBugCont(sqlSession, map);
	}

	@Override
	public int insertCloneBug(HashMap<String, Object> map) {
		return td.insertCloneBug(sqlSession, map);
	}

	@Override
	public int insertCloneBug2(HashMap<String, Object> map2) {
	
		return td.insertCloneBug2(sqlSession, map2);
	}

	@Override
	public int deleteCloneBug(HashMap<String, Object> map) {
		return td.deleteCloneBug(sqlSession, map);
	}

	@Override
	public List<TaskHistory> searchBug(HashMap<String, Object> map) {
		return td.searchBug(sqlSession, map);
	}


	//miso Kim's task ------------------------------------------------------------------------------------
	//테스크 리스트 조회 후 보드 메인 view로 이동(현재 진행중인 스프린트의 tasklist만 조회)
	@Override
	public List<TaskHistory> selectTaskList(HashMap<String, Object> map) {
		return td.selectTaskList(sqlSession, map);
	}



	











	
	
	



}

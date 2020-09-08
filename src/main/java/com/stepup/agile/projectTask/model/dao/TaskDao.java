package com.stepup.agile.projectTask.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskDao {

	int createTask(SqlSessionTemplate sqlSession, Member m, TaskList t);

	int updateTitle(SqlSessionTemplate sqlSession, Member m, TaskHistory th);

	String selectTitle(SqlSessionTemplate sqlSession, int taskHistCode, TaskHistory th);

	List<TaskHistory> selectUserTask(SqlSessionTemplate sqlSession, Member m);

	String selectPjNonTask(SqlSessionTemplate sqlSession, Map<String, Object> map);

	List<TaskHistory> selectBugTask(SqlSessionTemplate sqlSession, Member m);

	List<TaskList> selectBugCont(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	int insertCloneBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	int insertCloneBug2(SqlSessionTemplate sqlSession, HashMap<String, Object> map2);

	int deleteCloneBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	List<TaskHistory> searchBug(SqlSessionTemplate sqlSession, HashMap<String, Object> map);

	int insertReply(SqlSessionTemplate sqlSession, ReplyList reply);

	List<ReplyHistory> selectReply(SqlSessionTemplate sqlSession, Map<String, Object> map);

	int updateReplyHist(SqlSessionTemplate sqlSession, ReplyHistory history);

	
	//miso Kim's task ------------------------------------------------------------------------------------
	//테스크 리스트 조회 후 보드 메인 view로 이동(현재 진행중인 스프린트의 tasklist만 조회)
	List<TaskHistory> selectTaskList(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
}

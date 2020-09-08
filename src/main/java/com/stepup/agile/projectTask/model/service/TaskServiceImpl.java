package com.stepup.agile.projectTask.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectTask.model.dao.TaskDao;
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
	
	@Override
	public int createTask(Member m, TaskList t) {
		
		return td.createTask(sqlSession, m, t);
	}

	@Override
	public int updateTitle(Member m, TaskHistory th) {

		return td.updateTitle(sqlSession, m, th);
	}

	@Override
	public String selectTitle(int taskHistCode, TaskHistory th) {
		
		return td.selectTitle(sqlSession, taskHistCode, th);
	}

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

	@Override
	public int insertReply(ReplyList reply) {
		return td.insertReply(sqlSession, reply);
	}

	@Override
	public int updateReplyHist(ReplyHistory history) {
		return td.updateReplyHist(sqlSession, history);
	}

	@Override
	public List<ReplyHistory> selectReply(Map<String, Object> map) {
		return td.selectReply(sqlSession, map);
	}

	
	//miso Kim's task ------------------------------------------------------------------------------------
	//테스크 리스트 조회 후 보드 메인 view로 이동(현재 진행중인 스프린트의 tasklist만 조회)
	@Override
	public List<TaskHistory> selectTaskList(HashMap<String, Object> map) {
		return td.selectTaskList(sqlSession, map);
	}

}

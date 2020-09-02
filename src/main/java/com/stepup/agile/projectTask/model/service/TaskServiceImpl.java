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
	public TaskHistory selectSubTitle(int taskHistCode) {
		return td.selectSubTitle(sqlSession, taskHistCode);
	}
	//5.댓글 생성
	@Override
	public int insertReply(ReplyList reply) {

		return td.insertReply(sqlSession, reply);
	}
	//5-1.댓글 히스토리 업데이트
	@Override
	public int updateReplyHist(ReplyHistory history) {

		return td.updateReplyHist(sqlSession, history);
	}
	//5-2.댓글 조회
	@Override
	public ReplyHistory selectReply(ReplyList reply) {

		return td.selectReply(sqlSession, reply);
	}
	@Override
	public List<TaskHistory> selectUserTask(Member m) {
		return td.selectUserTask(sqlSession, m);
	}

	@Override
	public String selectPjNonTask(Map<String, Object> map) {
		return td.selectPjNonTask(sqlSession, map);
	}







	

	

}

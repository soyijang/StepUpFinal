package com.stepup.agile.projectTask.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

public interface TaskDao {
	//1.Task생성
	int createTask(SqlSessionTemplate sqlSession, Member m, TaskList t);
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
	TaskHistory selectSubTitle(SqlSessionTemplate sqlSession, int taskHistCode);
	//5.댓글생성
	int insertReply(SqlSessionTemplate sqlSession, ReplyList reply);
	//5-1.댓글히스토리 업데이트
	int updateReplyHist(SqlSessionTemplate sqlSession, ReplyHistory history);
	//5-2.댓글조회
	ReplyHistory selectReply(SqlSessionTemplate sqlSession, ReplyList reply);
	List<TaskHistory> selectUserTask(SqlSessionTemplate sqlSession, Member m);

	String selectPjNonTask(SqlSessionTemplate sqlSession, Map<String, Object> map);
	
	
	


}

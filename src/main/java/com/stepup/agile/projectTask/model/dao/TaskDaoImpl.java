package com.stepup.agile.projectTask.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	public TaskHistory selectSubTitle(SqlSessionTemplate sqlSession, int taskHistCode) {
		
		return sqlSession.selectOne("Task.selectSubTitle", taskHistCode);
	}
	//5.댓글생성
	@Override
	public int insertReply(SqlSessionTemplate sqlSession, ReplyList reply) {
		
		return sqlSession.insert("Task.insertReply", reply);
	}
	//5-1.댓글히스토리 업데이트
	@Override
	public int updateReplyHist(SqlSessionTemplate sqlSession, ReplyHistory history) {

		return sqlSession.update("Task.updateReplyHist", history);
	}
	//5-2.댓글조회
	@Override
	public ReplyHistory selectReply(SqlSessionTemplate sqlSession, ReplyList reply) {

		return sqlSession.selectOne("Task.selectReply", reply);
	}
	
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






	



	

}

package com.stepup.agile.projectTask.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectTask.model.vo.ReplyHistory;
import com.stepup.agile.projectTask.model.vo.ReplyList;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.projectTask.model.vo.TaskList;
import com.stepup.agile.userInfo.model.vo.Member;

@Repository	
public class TaskDaoImpl implements TaskDao {

	@Override
	public int createTask(SqlSessionTemplate sqlSession, Member m, TaskList t) {
		t.setTaskUser(m.getUserCode());
		
		/* int taskCode = sqlSession.insert("Task.createTask", t); */
		sqlSession.insert("Task.createTask", t);
		
		int taskCode = t.getTaskCode();
		
		return taskCode;
	}

	@Override
	public int updateTitle(SqlSessionTemplate sqlSession, Member m, TaskHistory th) {
		th.setUserCode(m.getUserCode());
		return sqlSession.insert("Task.updateTaskTitle", th);
	}

	@Override
	public String selectTitle(SqlSessionTemplate sqlSession, int taskHistCode, TaskHistory th) {
		
		
		System.out.println(th);
		System.out.println(taskHistCode);
		return sqlSession.selectOne("Task.selectTaskTitle", th);
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
		System.out.println(map.get("userCode"));
		System.out.println(map.get("taskCont"));
		System.out.println("리턴값 : " + sqlSession.selectList("Task.searchBug", map));
		
		return sqlSession.selectList("Task.searchBug", map);
	}

	//5.댓글생성
	@Override
	public int insertReply(SqlSessionTemplate sqlSession, ReplyList reply) {
	      
	    sqlSession.insert("Task.insertReply", reply);
	    int replyCode = reply.getReplyCode();
	      
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
	
	
	//miso Kim's task ------------------------------------------------------------------------------------
	//테스크 리스트 조회 후 보드 메인 view로 이동(현재 진행중인 스프린트의 tasklist만 조회)

	@Override
	public List<TaskHistory> selectTaskList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectList("Task.selectTaskList", map);
	}
	

}

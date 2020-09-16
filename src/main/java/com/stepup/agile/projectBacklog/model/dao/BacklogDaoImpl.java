package com.stepup.agile.projectBacklog.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.projectBacklog.model.vo.SprintHistory;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.userInfo.model.vo.Member;

@Repository
public class BacklogDaoImpl implements BacklogDao {

	@Override
	public List<Sprint> selectSprint(SqlSessionTemplate sqlSession, Member m, int projectCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectCode", projectCode);
		map.put("userEmail", m.getUserEmail());
		return sqlSession.selectList("Sprint.selectSprint", map);
	}

	@Override
	public int insertSprint(SqlSessionTemplate sqlSession, int userProjectCode) {
		return sqlSession.insert("Sprint.insertSprint", userProjectCode);
	}

	@Override
	public SprintHistory selectSprintOne(SqlSessionTemplate sqlSession, Member m, int sprintCode) {
		return sqlSession.selectOne("Sprint.selectSprintOne", sprintCode);
	}

	@Override
	public List<TaskHistory> selectSprintTask(SqlSessionTemplate sqlSession, Member m, int sprintCode) {
		
		return sqlSession.selectList("Sprint.selectSprintTask", sprintCode);
	}

	@Override
	public int updateSprint(SqlSessionTemplate sqlSession, SprintHistory sprintHistory) {
		return sqlSession.insert("Sprint.updateSprint", sprintHistory);
	}

	@Override
	public int updateFinish(SqlSessionTemplate sqlSession, SprintHistory sprintHistory) {
		
		int result = 0;
		List<TaskHistory> taskType = sqlSession.selectList("Sprint.selectTaskType", sprintHistory);
		
		for(int i=0; i<taskType.size(); i++) {
			//테스크 진행상태가 != 완료 이면 안됌
			if(!taskType.get(i).getTaskHistValue().equals("완료")) {
				result=2; break;
			}
		}
		if(result != 2) {
			result = sqlSession.insert("Sprint.updateFinish", sprintHistory);
		}
		return result;
		
	}

	@Override
	public int updateStart(SqlSessionTemplate sqlSession, SprintHistory sprintHistory) {
		
		int result = 0;
		List<SprintHistory> SprintType = sqlSession.selectList("Sprint.selectSprintType", sprintHistory);
		
		for(int i=0; i<SprintType.size(); i++) {
			if(SprintType.get(i).getSprintTypeYn().equals("02")) {
				result=2; break;
			}
		}
		if(result != 2) {
			result = sqlSession.insert("Sprint.updateStart", sprintHistory);
		}
		return result;
	}

	@Override
	public int updateTask(SqlSessionTemplate sqlSession, int taskCode) {
		return sqlSession.insert("Sprint.updateTask", taskCode);
	}

	@Override
	public List<Sprint> searchSprint(SqlSessionTemplate sqlSession, Member m, String sprintName) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sprintName", "%"+sprintName+"%");
		map.put("userEmail", m.getUserEmail());
		
		return sqlSession.selectList("Sprint.searchSprint", map);
	}

}













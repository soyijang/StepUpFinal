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
	public List<Sprint> selectSprint(SqlSessionTemplate sqlSession, Member m) {
		System.out.println(m.getUserEmail());
		return sqlSession.selectList("Sprint.selectSprint", m.getUserEmail());
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
		// TODO Auto-generated method stub
		return sqlSession.insert("Sprint.updateFinish", sprintHistory);
	}

	@Override
	public int updateStart(SqlSessionTemplate sqlSession, SprintHistory sprintHistory) {
		
		int result = 0;
		List<SprintHistory> SprintType = sqlSession.selectList("Sprint.selectSprintType", sprintHistory);
		System.out.println("스프린트 타입 리스트"+SprintType);
		
		for(int i=0; i<SprintType.size(); i++) {
			if(SprintType.get(i).getSprintTypeYn().equals("02")) {
				result=2; break;
			}
		}

		if(result != 2) {
			result = sqlSession.insert("Sprint.updateStart", sprintHistory);
		}
		
		System.out.println("돌려준 return : " + result);
		return result;
	}

	
}

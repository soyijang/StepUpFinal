package com.stepup.agile.userMyTasks.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.MyTask;
import com.stepup.agile.userMyTasks.model.vo.Rss;
import com.stepup.agile.userMyTasks.model.vo.RssHistory;

@Repository
public class MyTasksStandupMeetingDaoImpl implements MyTasksStandupMeetingDao{

	@Override
	public List<Rss> selectRssList(SqlSessionTemplate sqlSession, Member m, int projectCode) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", m.getUserCode());
		map.put("projectCode", projectCode);
		
		return sqlSession.selectList("Rss.selectRssList", map);
	}

	@Override
	public int updateRss(SqlSessionTemplate sqlSession, RssHistory rssHistory) {
		return sqlSession.update("Rss.updateRss", rssHistory);
	}
	//공유 일정 가져오기	
	@Override
	public List<MyTask> selectMytaskShareList(SqlSessionTemplate sqlSession, int projectCode) {
		return sqlSession.selectList("MyTask.selectMytaskShareList", projectCode);
	}

	@Override
	public int insertRss(SqlSessionTemplate sqlSession, RssHistory rssHistory) {
		return sqlSession.insert("Rss.insertRss", rssHistory);
	}
	
	
	
}

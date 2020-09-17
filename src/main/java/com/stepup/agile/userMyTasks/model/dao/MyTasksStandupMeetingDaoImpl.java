package com.stepup.agile.userMyTasks.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.Rss;
import com.stepup.agile.userMyTasks.model.vo.RssHistory;
import com.stepup.agile.userMyTasks.model.vo.MyTask;

@Repository
public class MyTasksStandupMeetingDaoImpl implements MyTasksStandupMeetingDao{

	@Override
	public List<Rss> selectRssList(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("Rss.selectRssList", m.getUserCode());
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

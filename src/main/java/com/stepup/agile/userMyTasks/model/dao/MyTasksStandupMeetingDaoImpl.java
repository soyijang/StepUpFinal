package com.stepup.agile.userMyTasks.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.Rss;
import com.stepup.agile.userMyTasks.model.vo.RssHistory;

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

	
	
	
}

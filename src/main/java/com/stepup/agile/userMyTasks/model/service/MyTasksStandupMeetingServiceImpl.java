package com.stepup.agile.userMyTasks.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.dao.MyTasksStandupMeetingDao;
import com.stepup.agile.userMyTasks.model.vo.Rss;
import com.stepup.agile.userMyTasks.model.vo.RssHistory;

@Service
public class MyTasksStandupMeetingServiceImpl implements MyTasksStandupMeetingService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyTasksStandupMeetingDao smd;

	@Override
	public List<Rss> selectRssList(Member m) {
		return smd.selectRssList(sqlSession, m);
	}

	@Override
	public int updateRss(RssHistory rssHistory) {
		return smd.updateRss(sqlSession, rssHistory);
	}
	
	
	
}

package com.stepup.agile.userMyTasks.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.Rss;
import com.stepup.agile.userMyTasks.model.vo.RssHistory;

public interface MyTasksStandupMeetingDao {

	List<Rss> selectRssList(SqlSessionTemplate sqlSession, Member m);

	int updateRss(SqlSessionTemplate sqlSession, RssHistory rssHistory);

}

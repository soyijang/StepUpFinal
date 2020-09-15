package com.stepup.agile.userMyTasks.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;


import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.Rss;
import com.stepup.agile.userMyTasks.model.vo.RssHistory;
import com.stepup.agile.userMyTasks.model.vo.MyTask;

public interface MyTasksStandupMeetingDao {

	List<Rss> selectRssList(SqlSessionTemplate sqlSession, Member m);

	int updateRss(SqlSessionTemplate sqlSession, RssHistory rssHistory);

	//공유 일정 가져오기	
	List<MyTask> selectMytaskShareList(SqlSessionTemplate sqlSession, int projectCode);

}

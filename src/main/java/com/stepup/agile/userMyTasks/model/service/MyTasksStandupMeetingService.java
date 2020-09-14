package com.stepup.agile.userMyTasks.model.service;

import java.util.List;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.Rss;
import com.stepup.agile.userMyTasks.model.vo.RssHistory;

public interface MyTasksStandupMeetingService {

	List<Rss> selectRssList(Member m);

	int updateRss(RssHistory rssHistory);

}

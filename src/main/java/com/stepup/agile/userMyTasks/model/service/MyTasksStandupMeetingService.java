package com.stepup.agile.userMyTasks.model.service;

import java.util.List;


import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.Rss;
import com.stepup.agile.userMyTasks.model.vo.RssHistory;
import com.stepup.agile.userMyTasks.model.vo.MyTask;

public interface MyTasksStandupMeetingService {

	List<Rss> selectRssList(Member m, int projectCode);

	int updateRss(RssHistory rssHistory);

	//공유 일정 가져오기
	List<MyTask> selectMytaskShareList(int projectCode);

	int insertRss(RssHistory rssHistory);

}

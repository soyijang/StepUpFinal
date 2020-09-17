package com.stepup.agile.userMyTasks.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.service.MyTasksStandupMeetingService;
import com.stepup.agile.userMyTasks.model.vo.RssHistory;
import com.stepup.agile.userMyTasks.model.vo.rss.Feed;
import com.stepup.agile.userMyTasks.model.vo.rss.FeedMessage;
import com.stepup.agile.userMyTasks.model.vo.rss.RSSFeedParser;

@SessionAttributes("loginUser")
@Controller
public class MytasksRSSController {
	
	@Autowired
	private MyTasksStandupMeetingService sms;
	
	//rss박스들
	@RequestMapping(value="showRssContent.mt",method=RequestMethod.POST)
	public ModelAndView selectProject(ModelAndView mv, @ModelAttribute("loginUser") Member m, String url) {
		  
		RSSFeedParser parser = new RSSFeedParser(url);
		Feed feed = parser.readFeed();
		System.out.println(feed);

		//메세지별로 담아서 list로 넘길용
		List<FeedMessage> rssContent = new ArrayList<FeedMessage>();
		
		//꺼내기
		for (FeedMessage message : feed.getMessages()) {
				System.out.println(message);
				rssContent.add(message);
		}
		
		mv.addObject("rssContent", rssContent);
		mv.addObject("feed", feed);
		mv.setViewName("jsonView");
		return mv;

	 }
	
	
	//구독정보수정
	@RequestMapping("updateRss.mt")
	public String updateRss(Model model, RssHistory rssHistory) {
		
		int result = 0;
		result = sms.updateRss(rssHistory);
		
		if(result>0) {
			return "redirect:showStandUpMeeting.mt";
		}else {
			model.addAttribute("msg", "rss 수정을 실패하였습니다!");
			return "common/errorPage";
		}
		
	}
	
	
	
	
	
}

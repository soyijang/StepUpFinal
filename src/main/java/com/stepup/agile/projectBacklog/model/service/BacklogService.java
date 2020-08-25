package com.stepup.agile.projectBacklog.model.service;

import java.util.List;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.userInfo.model.vo.Member;

public interface BacklogService {

	List<Sprint> selectSprint(Member m);
	
	
}

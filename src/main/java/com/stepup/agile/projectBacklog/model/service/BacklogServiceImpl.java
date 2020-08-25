package com.stepup.agile.projectBacklog.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectBacklog.model.dao.BacklogDao;
import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.userInfo.model.vo.Member;

@Service
public class BacklogServiceImpl implements BacklogService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BacklogDao md;
	
	@Override
	public List<Sprint> selectSprint(Member m) {
		
		List<Sprint> sprintList = null;
		
		
		
		
		return sprintList;
	}

}

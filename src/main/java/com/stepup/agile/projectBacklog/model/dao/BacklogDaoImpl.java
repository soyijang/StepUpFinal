package com.stepup.agile.projectBacklog.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectBacklog.model.vo.Sprint;
import com.stepup.agile.userInfo.model.vo.Member;

@Repository
public class BacklogDaoImpl implements BacklogDao {

	@Override
	public List<Sprint> selectSprint(SqlSessionTemplate sqlSession, Member m) {
		System.out.println(m.getUserEmail());
		return sqlSession.selectList("Sprint.selectSprint", m.getUserEmail());
	}


	
}

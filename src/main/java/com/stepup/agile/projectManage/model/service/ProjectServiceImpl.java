package com.stepup.agile.projectManage.model.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectManage.model.dao.ProjectDao;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectManage.model.vo.ProjectHistory;

import com.stepup.agile.userInfo.model.vo.AlertList;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProjectDao pd;
	
	@Override
	public List<Project> selectUserProject(Member m) {
		
		return pd.selectUserProject(sqlSession, m);
	}

	@Override
	public List<Project> selectUserProject2(Member m) {
		return pd.selectUserProject2(sqlSession, m);
	}
	
	@Override
	public List<ProjectHistory> selectTimelineProject(Member m) {
		return pd.selectTimelineProject(sqlSession, m);
	}

	@Override
	public int updateTimeline(HashMap<String, Object> map) {
		return pd.updateTimeline(sqlSession, map);
	}

	@Override
	public int selectAlert(Member m) {
		return pd.selectAlert(sqlSession, m);
	}
	
	@Override
	public int selectSprintAlert(Member m) {
		return pd.selectSprintAlert(sqlSession, m);
	}
	
	//miso's///////////////////////////////////////////////////////////////////////////////

   //프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동) 
   @Override
   public List<UserProjectList> selectProjectList(Member m) {
      return pd.selectProjectList(sqlSession, m);
   }
   
   //프로젝트 생성
   @Override
   public Project insertProject(Project p) {
      return pd.insertProject(sqlSession, p);
   }
   
   //프로젝트 생성 후 프로젝트 히스토리 자동 생성
   @Override
   public int insertProjectHistory(ProjectHistory projectHistory) {
      return pd.insertProjectHistory(sqlSession, projectHistory);
   }
   
   //사용자프로젝트리스트 생성하기위해 member 정보 기준으로 사용자팀코드 가져오기
   @Override
   public UserTeamList selectUserTeamCode(Member m) {
      return pd.selectUserTeamCode(sqlSession, m);
   }
   
   //프로젝트 생성 후  사용자프로젝트리스트 생성(스크럼마스터 권한으로 생성)
   @Override
   public int insertUserProjectOne(Project project) {
      return pd.insertUserProjectOne(sqlSession, project);
   }
   //프로젝트 수정
   @Override
   public int updateProjectOne(ProjectHistory projectHistory) {
      return pd.updateProjectOne(sqlSession, projectHistory);
   }
   //프로젝트 멤버 추가를 위한 팀원 검색
   @Override
   public List<Member> searchTeamMember(Member m) {
      return pd.searchTeamMember(sqlSession, m);
   }

   //프로젝트 멤버 추가
   @Override
   public int insertUserProjectMember(Map<String, Object> map) {
      return pd.insertUserProjectMember(sqlSession, map);
   }

   //중복으로 추가되지 않도록 유저프로젝트 소속 여부 확인해보기
   @Override
   public UserProjectList checkBelongTo(Map<String, Object> map) {
      return pd.checkBelongTo(sqlSession, map);
   }


	
}

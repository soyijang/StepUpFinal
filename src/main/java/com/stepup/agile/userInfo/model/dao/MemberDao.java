package com.stepup.agile.userInfo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.Bookmark;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Attachment;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public interface MemberDao {
	
	Member loginCheck(SqlSessionTemplate sqlSession, Member m) throws LoginFailedException;

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	Member selectMember(SqlSessionTemplate sqlSession, Member m);

	String selectUserProject(SqlSessionTemplate sqlSession, Member m);
	
	//myInfo 팀원 리스트조회
	List<Member> selectTeamList(SqlSessionTemplate sqlSession, UserTeamList ul);
	//프로젝트 리스트 조회
	List<UserProjectList> userProjectList(SqlSessionTemplate sqlSession, int userCode);
	//북마크조회
	List<TaskHistory> selectBookmark(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
	//썸네일 조회
	Attachment selectThumb(SqlSessionTemplate sqlSession, int userCode);
	//배경조회
	Attachment selectAttachment(SqlSessionTemplate sqlSession, int userCode);
	//직업 등록
	int insertJob(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
	Member selectJob(SqlSessionTemplate sqlSession, int userCode);
	//부서 등록
	int insertDept(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
	Member selectDept(SqlSessionTemplate sqlSession, int userCode);
	//회사등록
	int insertCom(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
	Member selectCom(SqlSessionTemplate sqlSession, int userCode);
	//썸네일 등록
	int insertThumbnail(SqlSessionTemplate sqlSession, Attachment attachment);

	/* Attachment selectThumbnail(SqlSessionTemplate sqlSession, int attachCode); */
	//비밀번호 변경
	int updatePwd(SqlSessionTemplate sqlSession, HashMap<String, Object> map);
	Member selectNewLogin(SqlSessionTemplate sqlSession, int userCode);
	//회원탈퇴
	int getout(SqlSessionTemplate sqlSession, Member m);
	//배경 등록
	int insertBackImg(SqlSessionTemplate sqlSession, Attachment attachment);
	//배경 조회
	/*
	 * Attachment selectBackImg(SqlSessionTemplate sqlSession, int attachCode);
	 */

	//메일인증
	int verifyMember(SqlSessionTemplate sqlSession, Member member);
	//인증 후 로그인
	Member loginverify(SqlSessionTemplate sqlSession, String userEmail);
	//임시비밀번호 생성시 정보찾기
	Member userInfo(SqlSessionTemplate sqlSession, String email);
	//임시비밀번호 db저장
	/* int updatetempPwd(SqlSessionTemplate sqlSession, Member me); */

	int tempPwd(SqlSessionTemplate sqlSession, Member member);

	

	

	

}

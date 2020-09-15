package com.stepup.agile.userInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.Bookmark;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.exception.UpdateFailedException;
import com.stepup.agile.userInfo.model.vo.Attachment;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

public interface MemberService {

	Member loginMember(Member m) throws LoginFailedException;

	int insertMember(Member m);

	String selectUserProject(Member m);
	
	//myInfo 팀원 리스트조회
	List<Member> selectTeamList(UserTeamList ul);
	//프로젝트 리스트조회
	List<UserProjectList> selectProjectList(int userCode);
	//MyInfo북마크 조회
	List<TaskHistory> selectBookmark(HashMap<String, Object> map);
	//썸네일조회
	Attachment selectThumnail(int userCode);
	//이미지 조회
	Attachment selectAttachment(int userCode);
	//직업등록
	int insertJob(HashMap<String, Object> map);
	Member selectJob(int userCode);
	//부서등록
	int insertDept(HashMap<String, Object> map);
	Member selectDept(int userCode);
	//회사등록
	int insertCom(HashMap<String, Object> map);
	Member selectCom(int userCode);
	//썸네일등록
	int insertThumbnail(Attachment attachment);

	/* Attachment selectThumbnail(int attachCode); */
	//비밀번호변경
	Member changePwd(Member m, String pwdChange, String pwdOrigin) throws UpdateFailedException;
	//회원탈퇴
	int getout(Member m);
	//배경이미지등록
	int insertBackImg(Attachment attachment);
	//배경이미지 조회
	/* Attachment selectBackImg(int attachCode); */
	//이메일 인증
	int verifyMember(Member member);
	//인증 후 로그인 확인
	Member loginverify(String userEmail);
	//입력받은 아이디 확인
	Member userInfo(String email);
	//임시비밀번호 db저장
	/* int updatetempPwd(Member me); */

	int tempPwd(Member member);

	
	

	
	




}

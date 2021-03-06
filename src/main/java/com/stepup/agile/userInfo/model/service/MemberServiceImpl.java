package com.stepup.agile.userInfo.model.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.projectTask.model.vo.Bookmark;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.userInfo.model.dao.MemberDao;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.exception.UpdateFailedException;
import com.stepup.agile.userInfo.model.vo.Attachment;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

@Service
public class MemberServiceImpl implements MemberService{

   @Autowired
   private SqlSessionTemplate sqlSession;
   @Autowired
   private MemberDao md;

   @Autowired
   private BCryptPasswordEncoder passwordEncoder;

   @Override
   public Member loginMember(Member m) throws LoginFailedException {

      Member loginUser = null;

      String encPassword = md.selectEncPassword(sqlSession, m);

      if(!passwordEncoder.matches(m.getUserPwd(), encPassword)) {
         System.out.println(m.getUserPwd());
         System.out.println(encPassword);
         System.out.println(m);
         throw new LoginFailedException("로그인 실패!");
      } else {
         loginUser = md.selectMember(sqlSession, m);
         System.out.println(loginUser);
      }

      return loginUser;
   }

   @Override
   public int insertMember(Member m) {

      return md.insertMember(sqlSession, m);
   }

   @Override
   public String selectUserProject(Member m) {


      return md.selectUserProject(sqlSession, m);
   }
   //myInfo 팀원 리스트조회
   @Override
   public List<Member> selectTeamList(UserTeamList ul) {

      return md.selectTeamList(sqlSession, ul);
   }
   //프로젝트리스트 조회

   @Override
   public List<UserProjectList> selectProjectList(int userCode) {

      return md.userProjectList(sqlSession, userCode);
   }
   //북마크 조회
   @Override
   public List<TaskHistory> selectBookmark(HashMap<String, Object> map) {

      return md.selectBookmark(sqlSession, map);
   }
   //썸네일 조회
   @Override
   public Attachment selectThumnail(int userCode) {

      return md.selectThumb(sqlSession, userCode);
   }
   //배경 조회
   @Override
   public Attachment selectAttachment(int userCode) {

      return md.selectAttachment(sqlSession, userCode);
   }
   //직업등록
   @Override
   public int insertJob(HashMap<String, Object> map) {

      return md.insertJob(sqlSession, map);
   }

   @Override
   public Member selectJob(int userCode) {

      return md.selectJob(sqlSession, userCode);
   }

   @Override
   public int insertDept(HashMap<String, Object> map) {

      return md.insertDept(sqlSession, map);
   }

   @Override
   public Member selectDept(int userCode) {

      return md.selectDept(sqlSession, userCode);
   }
   //회사등록
   @Override
   public int insertCom(HashMap<String, Object> map) {
      System.out.println("serviceImpl"+md.insertCom(sqlSession, map));
      return md.insertCom(sqlSession, map);
   }

   @Override
   public Member selectCom(int userCode) {

      return md.selectCom(sqlSession, userCode);
   }
   //썸네일 등록
   @Override
   public int insertThumbnail(Attachment attachment) {

      return md.insertThumbnail(sqlSession, attachment);
   }

   /*
    * @Override public Attachment selectThumbnail(int attachCode) {
    * 
    * return md.selectThumbnail(sqlSession, attachCode); }
    */

   //비밀번호 변경
   @Override
   public Member changePwd(Member m, String pwdChange, String pwdOrigin) throws UpdateFailedException {

      System.out.println(pwdChange);
      System.out.println(m);
      System.out.println(m.getUserPwd());
      System.out.println(pwdOrigin);
      Member loginUser;
      if(!passwordEncoder.matches(pwdOrigin, m.getUserPwd())) {

         throw new UpdateFailedException("비밀번호 변경 실패!");
      } else {

         String newPwd = passwordEncoder.encode(pwdChange);

         HashMap<String, Object>map = new HashMap();
         map.put("userPwd", newPwd);
         map.put("userCode", m.getUserCode());

         int result = md.updatePwd(sqlSession, map);
         System.out.println(result);

         loginUser = md.selectNewLogin(sqlSession, m.getUserCode());

      }

      return loginUser;
   }
   //회원탈퇴
   @Override
   public int getout(Member m) {

      return md.getout(sqlSession, m);
   }

   @Override
   public int insertBackImg(Attachment attachment) {

      return md.insertBackImg(sqlSession, attachment);
   }
   //배경 이미지 조회
   /*
    * @Override public Attachment selectBackImg(int attachCode) {
    * 
    * return md.selectBackImg(sqlSession, attachCode); }
    */
   //인증
   @Override
   public int verifyMember(Member member) {

      return md.verifyMember(sqlSession, member);
   }
   //임시 비밀번호 전송
   /*
    * @Override public void findPassword(HttpServletResponse response, Member m) {
    * 
    * response.setContentType("text/html;charset=utf-8");
    * 
    * PrintWriter out = response.getWriter(); // 아이디가 없으면
    * if(manager.check_id(m.getUserEmail()) == 0) { out.print("아이디가 없습니다.");
    * out.close();
    * 
    * // 가입에 사용한 이메일이 아니면 } else
    * if(!m.getUserEmail().equals(manager.login(m.getuseremail)){
    * out.print("잘못된 이메일 입니다."); out.close(); } else { // 임시 비밀번호 생성 String pw =
    * ""; for (int i = 0; i < 12; i++) { pw += (char) ((Math.random() * 26) + 97);
    * } member.setPw(pw); // 비밀번호 변경 manager.update_pw(member); // 비밀번호 변경 메일 발송
    * send_mail(member, "find_pw");
    * 
    * out.print("이메일로 임시 비밀번호를 발송하였습니다."); out.close(); } }
    */

   //인증 후 로그인
   @Override
   public Member loginverify(String userEmail) {

      return md.loginverify(sqlSession, userEmail);
   }
   //임시비번 필요한 유저정보
   @Override
   public Member userInfo(String email) {

      return md.userInfo(sqlSession, email);
   }
   //임시비번 수정
   /*
    * @Override public int updatetempPwd(Member me) {
    * 
    * return md.updatetempPwd(sqlSession, me); }
    */

   @Override
   public int tempPwd(Member member) {

      return md.tempPwd(sqlSession, member);
   }




}



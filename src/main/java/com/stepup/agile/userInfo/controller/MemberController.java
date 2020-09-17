package com.stepup.agile.userInfo.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.common.CommonUtils;
import com.stepup.agile.common.MailHandler;
import com.stepup.agile.common.TempKey;
import com.stepup.agile.projectTask.model.vo.TaskHistory;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.exception.UpdateFailedException;
import com.stepup.agile.userInfo.model.service.MemberService;
import com.stepup.agile.userInfo.model.vo.Attachment;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.UserProjectList;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
   @Autowired
   private MemberService ms;

   @Autowired
   private BCryptPasswordEncoder passwordEncoder;

   @Autowired
   private JavaMailSender mailSender;

   /*   @RequestMapping("login.me")
   public String loginCheck(Model model, Member m) {

      Member loginUser;
      try {
         loginUser = ms.loginMember(m);

         model.addAttribute("loginUser", loginUser);

         System.out.println(m);

         return "common/menubar";      
      } catch (LoginFailedException e) {
         model.addAttribute("msg", e.getMessage());

         return "common/errorPage";
      }



   }*/

   @RequestMapping("memberJoinForm.me")
   public String showMemberJoinForm() {
      return "userInfo/memberJoin/memberJoinForm";
   }

   /*
    * @RequestMapping("insert.me") public String insertMember(Model model, Member
    * m) {
    * 
    * m.setUserPwd(passwordEncoder.encode(m.getUserPwd()));
    * 
    * int result = ms.insertMember(m);
    * 
    * if(result > 0) { return "userInfo/memberJoin/mailForm"; } else {
    * model.addAttribute("msg", "회원 가입 실패!"); return "common/errorPage"; } }
    */

   @RequestMapping("backlogin.me")
   public String showloginPage() {
      return "userInfo/login";
   }

   @RequestMapping("logout.me")
   public String logout(SessionStatus status) {
      status.setComplete();

      return "userInfo/loginOut/login";
   }

   //팀원 및 프로젝트, 북마크 리스트 나열
   @RequestMapping("profile.me")
   public String profile(Model model, @ModelAttribute("loginUser") Member m) {

      UserTeamList ul = new UserTeamList();

      ul.setUserCode(m.getUserCode());
      ul.setTeamCode(1);      //팀코드 넣기

      List<Member> list = ms.selectTeamList(ul);
      model.addAttribute("list", list);
      System.out.println("리스트에뭐나옴?"+list);

      List<UserProjectList> project = ms.selectProjectList(m.getUserCode());
      model.addAttribute("project", project);


      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("userCode", m.getUserCode());
      //   map.put("userCompName", 팀코드넣기);
      System.out.println(map);

      List<TaskHistory> TaskHistory = ms.selectBookmark(map);
      model.addAttribute("TaskHistory", TaskHistory);      
      System.out.println("히스토리 모델"+model);
		/*
		 * Attachment attach = ms.selectThumnail(m.getUserCode());
		 * 
		 * Attachment backGround = ms.selectAttachment(m.getUserCode());
		 * 
		 * HashMap<String, Object> map2 = new HashMap<String, Object>();
		 * map2.put("attach", attach); map2.put("backGround", backGround);
		 * 
		 * model.addAttribute("map2", map2);
		 */
		/* System.out.println("모델"+model); */

      return "userInfo/myPage/myInfo";
   }
   //직업등록
   @RequestMapping("insertJob.me")
   public ModelAndView insertJob(ModelAndView mv, @ModelAttribute("loginUser") Member m, String userJob) {

      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("userCode", m.getUserCode());
      map.put("userCompJob", userJob);

      int reslt = ms.insertJob(map);

      Member member = ms.selectJob(m.getUserCode());

      mv.addObject("member", member);
      mv.setViewName("jsonView");
      System.out.println(mv);
      return mv;
   }
   //부서등록
   @RequestMapping("insertDept.me")
   public ModelAndView insertDept(ModelAndView mv, @ModelAttribute("loginUser") Member m, String userDept) {

      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("userCode", m.getUserCode());
      map.put("userCompDept", userDept);

      int reslt = ms.insertDept(map);

      Member member = ms.selectDept(m.getUserCode());

      mv.addObject("member", member);
      mv.setViewName("jsonView");
      System.out.println(mv);
      return mv;
   }
   //회사명 등록
   @RequestMapping("insertCom.me")
   public ModelAndView insertCom(ModelAndView mv, @ModelAttribute("loginUser") Member m, String company) {

      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("userCode", m.getUserCode());
      map.put("userCompName", company);
      System.out.println(map);
      int reslt = ms.insertCom(map);

      Member member = ms.selectCom(m.getUserCode());
      System.out.println(member);
      mv.addObject("member", member);
      mv.setViewName("jsonView");
      System.out.println(mv);
      return mv;
   }

   //썸네일 등록
   @RequestMapping("makeThumbnailImage.me")
   public String insertThumbnailImage(Model model, @ModelAttribute("loginUser") Member m, 
         HttpServletRequest request, MultipartFile photo) throws IOException { 

      System.out.println(m);
      System.out.println(photo);
      System.out.println(photo.getSize());
      String root = request.getSession().getServletContext().getRealPath("resources");

      System.out.println(root);

      String filePath = root + "\\uploadFiles";

      String originFileName = photo.getOriginalFilename();
      String ext = originFileName.substring(originFileName.lastIndexOf("."));
      String changeName = CommonUtils.getRandomString();

      Attachment attachment = new Attachment();
      attachment.setAttachOriginName(originFileName);
      attachment.setAttachChangeName(changeName);
      attachment.setAttachPath(filePath);
      attachment.setUserCode(m.getUserCode());
      attachment.setAttachSize(String.valueOf(photo.getSize()));

      try {
         photo.transferTo(new File(filePath + "\\" + changeName + ext));
         int result = ms.insertThumbnail(attachment);
         int attachCode = attachment.getAttachCode();

         Attachment attach = ms.selectThumnail(m.getUserCode());

         Attachment backGround = ms.selectAttachment(m.getUserCode());

         HashMap<String, Object> map2 = new HashMap<String, Object>();
         map2.put("attach", attach);
         map2.put("backGround", backGround);

         model.addAttribute("map2", map2);
         System.out.println("모델"+model);


      } catch (IllegalStateException | IOException e) {
         new File(filePath + "\\" + changeName + ext).delete();

      }

      UserTeamList ul = new UserTeamList();

      ul.setUserCode(m.getUserCode());
      //      ul.setTeamCode(teamCode);      

      List<Member> list = ms.selectTeamList(ul);
      model.addAttribute("list", list);

      List<UserProjectList> project = ms.selectProjectList(m.getUserCode());
      model.addAttribute("project", project);


      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("userCode", m.getUserCode());
      //   map.put("userCompName", 팀코드넣기);
      System.out.println(map);

      List<TaskHistory> TaskHistory = ms.selectBookmark(map);
      System.out.println(TaskHistory);
      model.addAttribute("TaskHistory", TaskHistory);
      System.out.println(model);

      return "userInfo/myPage/myInfo";
   }

   //비밀번호 변경
   @RequestMapping("changePwd.me")
   public String changePwd(Model model, @ModelAttribute("loginUser") Member m, 
         SessionStatus status, String pwdChange, String pwdOrigin){

      Member loginUser;
      try {
         loginUser = ms.changePwd(m, pwdChange, pwdOrigin);

         model.addAttribute(loginUser);

         System.out.println(m);

         status.setComplete();
         
         return "userInfo/loginOut/login";

      } catch (UpdateFailedException e) {
         model.addAttribute("msg", e.getMessage());

         return "common/errorPage";
      }

   }

   //회원탈퇴
   @RequestMapping("getOut.me")
   public String getOut(ModelAndView mv, @ModelAttribute("loginUser") Member m, String checkPwd) {

      int result = ms.getout(m);

      return "redirect:userInfo/loginOut/login";
   }
   //배경화면 변경
   @RequestMapping("makebackImage.me")
   public String makebackImage(Model model, @ModelAttribute("loginUser") Member m, 
         HttpServletRequest request, MultipartFile picture) throws IOException { 

      String root = request.getSession().getServletContext().getRealPath("resources");

      System.out.println(root);

      String filePath = root + "\\uploadFiles";

      String originFileName = picture.getOriginalFilename();
      String ext = originFileName.substring(originFileName.lastIndexOf("."));
      String changeName = CommonUtils.getRandomString();

      Attachment attachment = new Attachment();
      attachment.setAttachOriginName(originFileName);
      attachment.setAttachChangeName(changeName);
      attachment.setAttachPath(filePath);
      attachment.setUserCode(m.getUserCode());
      attachment.setAttachSize(String.valueOf(picture.getSize()));

      try {
         picture.transferTo(new File(filePath + "\\" + changeName + ext));
         int result = ms.insertBackImg(attachment);
         int attachCode = attachment.getAttachCode();

         Attachment attach = ms.selectThumnail(m.getUserCode());

         Attachment backGround = ms.selectAttachment(m.getUserCode());

         HashMap<String, Object> map2 = new HashMap<String, Object>();
         map2.put("attach", attach);
         map2.put("backGround", backGround);

         model.addAttribute("map2", map2);
         System.out.println("모델"+model);


      } catch (IllegalStateException | IOException e) {
         new File(filePath + "\\" + changeName + ext).delete();

      }

      UserTeamList ul = new UserTeamList();

      ul.setUserCode(m.getUserCode());
      //      ul.setTeamCode(teamCode);      

      List<Member> list = ms.selectTeamList(ul);
      model.addAttribute("list", list);

      List<UserProjectList> project = ms.selectProjectList(m.getUserCode());
      model.addAttribute("project", project);


      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("userCode", m.getUserCode());
      //   map.put("userCompName", 팀코드넣기);
      System.out.println(map);

      List<TaskHistory> TaskHistory = ms.selectBookmark(map);

      model.addAttribute("TaskHistory", TaskHistory);
      System.out.println(model);

      return "userInfo/myPage/myInfo";
   }

   /*
    * @RequestMapping("mailsend.me") public void sendMail(Model
    * model, @ModelAttribute("loginUser") Member m, HttpServletRequest request) {
    * 
    * String htmlStr = "<h2>안녕하세요 STEP UP 입니다!</h2><br><br>" + "<h3>" +
    * m.getUserName() + "님</h3>" + "<p>로그인 버튼을 누르시면 STEPUP 페이지에 로그인 하실 수 있습니다 : " +
    * "<a href='http://localhost:8080" + request.getContextPath() +
    * "/main/main'>로그인하기</a></p>" + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
    * 
    * String setfrom = "jungsoo8829@gmail.com"; String tomail =
    * request.getParameter(m.getUserEmail()); String title =
    * request.getParameter("[본인인증] STEPUP : 인증메일입니다"); String content =
    * request.getParameter(htmlStr);
    * 
    * try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
    * messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    * messageHelper.setFrom(setfrom); messageHelper.setTo(tomail);
    * messageHelper.setSubject(title); messageHelper.setText(content);
    * 
    * mailSender.send(message); } catch (MessagingException e) {
    * System.out.println(e); } }
    */

   @RequestMapping("insert.me")
   public String insertMember(Model model, Member m) throws MessagingException, UnsupportedEncodingException {

      m.setUserPwd(passwordEncoder.encode(m.getUserPwd()));

      int result = ms.insertMember(m);

      MailHandler sendMail = new MailHandler(mailSender);
      sendMail.setSubject("[STEPUP] 회원가입 이메일 인증");
      sendMail.setText(new StringBuffer().append("<h1>메일인증<h1>")
            .append("<a href='http://localhost:8001/agile/verify.me?userEmail=" + m.getUserEmail())
            .append("'target='_blank'>이메일 인증 확인</a>").toString());
      sendMail.setFrom("stepup9180@gmail.com", "스탭업");
      sendMail.setTo(m.getUserEmail());
      sendMail.send();

      return "userInfo/memberJoin/mailForm";
   }

   @RequestMapping(value="/verify.me", method=RequestMethod.GET)
   public String signSuccess(Model model, @RequestParam String userEmail) {
      System.out.println("이메일 인증기능 처리");
      System.out.println(userEmail);

      Member member = new Member();
      member.setUserEmail(userEmail);
      /* member.setDomain(domain); */

      int result = ms.verifyMember(member);
      System.out.println("인증확인?"+ result);

      /* loginUser = ms.loginMember(member); */
      Member loginUser = ms.loginverify(userEmail);
      System.out.println(loginUser);
      model.addAttribute("loginUser", loginUser);

      return "redirect:showProjectMain.pj";
   }

   @RequestMapping("login.me")
   public String loginCheck(Model model, Member m, HttpServletResponse response) throws IOException {
      System.out.println("로그인 인증 처리...");

      Member loginUser;
      try {
         loginUser = ms.loginMember(m);
         System.out.println("로그인 유저"+ loginUser);

         if(loginUser.getVerified().equals("Y")) {

            model.addAttribute("loginUser", loginUser);
            
            return "redirect:showProjectMain.pj"; 
         } else {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

            PrintWriter out = response.getWriter();

            out.println("<script>alert('메일 인증이 필요합니다.'); location.href='http://localhost:8001/agile';</script>");
             
            out.flush();
            
            return "userInfo/loginOut/login";
         }

      } catch (LoginFailedException e) {
         model.addAttribute("msg", e.getMessage());
          
         return "common/errorPage";
      }
   }

   @RequestMapping("findAccount.me")
   public String findAccount() {
      return "userInfo/findInfo/findId";
   }

   @RequestMapping("checkInfo.me")
   public ModelAndView checkInfo(String email, String phone, ModelAndView mv) {

      Member m = new Member();
      m.setUserEmail(email);
      m.setUserPhone(phone);

      mv.addObject("member", m);
      mv.setViewName("jsonView");

      return mv;
   }

   @RequestMapping("findPassword.me")
   public String findPassword(@RequestParam String phone, @RequestParam String email, Member m, HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
      // 8자리 암호화 번호 생성
      String authKey = new TempKey().getKey(8, false);
      System.out.println("오토키"+authKey);
      System.out.println(email);
      // 회원 이름 꺼내는 코드
      Member member = ms.userInfo(email);
      System.out.println("멤버"+member);
      
      String name = member.getUserName();
      System.out.println("이름"+name);
      
      
      //비밀번호 암호화 후 db저장
      /*
       * String key = passwordEncoder.encode(authKey);
       * System.out.println("암호화된키"+key); member.setUserPwd(key);
       * 
       * int result = ms.tempPwd(member);
       */

      /*
       * MimeMessage mail = mailSender.createMimeMessage(); String htmlStr =
       * "<h2>안녕하세요 '"+ name +"' 님</h2><br><br>" +
       * "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>" +
       * "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + authKey
       * +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>" +
       * "<h3><a href='http://localhost:8001/agile'>STEPUP으로 바로 가기</a></h3><br><br>" +
       * "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)"; try {
       * mail.setSubject("[STEPUP] 임시 비밀번호가 발급되었습니다", "utf-8"); mail.setText(htmlStr,
       * "utf-8", "html"); mail.setFrom(); mail.addRecipient(RecipientType.TO, new
       * InternetAddress(member.getUserEmail())); mailSender.send(mail); } catch
       * (MessagingException e) { e.printStackTrace(); }
       */

      
       MailHandler sendMail = new MailHandler(mailSender);
       sendMail.setSubject("[STEPUP] 회원가입 이메일 인증"); 
       
       sendMail.setText(new StringBuffer().append("<h1>메일인증<h1>") 
             .append("<h2>안녕하세요 '"+ name +"' 님</h2><br><br>") 
             .append("<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>")
             .append("<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + authKey)
             .append("'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>")
             .append("<a href='http://localhost:8001/agile'>로그인하러가기</a>").toString());
       sendMail.setFrom("stepup9180@gmail.com", "스탭업");
       sendMail.setTo(member.getUserEmail()); sendMail.send();
       
      
      // 비밀번호 암호화해주는 메서드
      String key = passwordEncoder.encode(authKey);
      System.out.println("암호화된키"+key);
      // 데이터 베이스 값은 암호한 값으로 저장시킨다.
      
      
      /*
       * HashMap<String, Object> map = new HashMap<>(); map.put("userEmail",
       * member.getUserEmail()); map.put("userPwd", key); System.out.println(map);
       */
      
      
      Member me = new Member();
      me.setUserEmail(member.getUserEmail());
      me.setUserPwd(key);
      
      int result = ms.tempPwd(me);
      System.out.println("리바이즈 됐나요?"+result);
      return "userInfo/memberJoin/mailForm";
   }

}
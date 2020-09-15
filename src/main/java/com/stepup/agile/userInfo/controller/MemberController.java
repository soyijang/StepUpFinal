package com.stepup.agile.userInfo.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.common.CommonUtils;
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
	
	@RequestMapping("login.me")
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
		
		
		
	}
	
	@RequestMapping("memberJoinForm.me")
	public String showMemberJoinForm() {
		return "userInfo/memberJoinForm";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Model model, Member m) {
		
		m.setUserPwd(passwordEncoder.encode(m.getUserPwd()));
		
		int result = ms.insertMember(m);
		
		if(result > 0) {
			return "main/main";
		} else {
			model.addAttribute("msg", "회원 가입 실패!");
			return "common/errorPage";
		}
	}
	
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
		ul.setTeamCode(1);		//팀코드 넣기
		
		List<Member> list = ms.selectTeamList(ul);
		model.addAttribute("list", list);
		System.out.println("리스트에뭐나옴?"+list);
		
		List<UserProjectList> project = ms.selectProjectList(m.getUserCode());
		model.addAttribute("project", project);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", m.getUserCode());
	//	map.put("userCompName", 팀코드넣기);
		System.out.println(map);
				
		List<TaskHistory> TaskHistory = ms.selectBookmark(map);
		model.addAttribute("TaskHistory", TaskHistory);		
		
		Attachment attach = ms.selectThumnail(m.getUserCode());
		
		Attachment backGround = ms.selectAttachment(m.getUserCode());
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("attach", attach);
		map2.put("backGround", backGround);
		
		model.addAttribute("map2", map2);
		System.out.println("모델"+model);
		
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
//		ul.setTeamCode(teamCode);		
		
		List<Member> list = ms.selectTeamList(ul);
		model.addAttribute("list", list);
		
		List<UserProjectList> project = ms.selectProjectList(m.getUserCode());
		model.addAttribute("project", project);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", m.getUserCode());
	//	map.put("userCompName", 팀코드넣기);
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
	public ModelAndView getOut(ModelAndView mv, @ModelAttribute("loginUser") Member m, String checkPwd) {
		
		int result = ms.getout(m);
		
		return mv;
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
//		ul.setTeamCode(teamCode);		
		
		List<Member> list = ms.selectTeamList(ul);
		model.addAttribute("list", list);
		
		List<UserProjectList> project = ms.selectProjectList(m.getUserCode());
		model.addAttribute("project", project);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userCode", m.getUserCode());
	//	map.put("userCompName", 팀코드넣기);
		System.out.println(map);
				
		List<TaskHistory> TaskHistory = ms.selectBookmark(map);

		model.addAttribute("TaskHistory", TaskHistory);
		System.out.println(model);
		
		return "userInfo/myPage/myInfo";
	}
	
	

}

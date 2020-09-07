package com.stepup.agile.userInfo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.service.MemberService;
import com.stepup.agile.userInfo.model.vo.Member;
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
		
		return "userInfo/login";
	}
	
	@RequestMapping("profile.me")
	public String profile(Model model, @ModelAttribute("loginUser") Member m, int teamCode) {
		
		UserTeamList ul = new UserTeamList();
		
		ul.setTeamCode(teamCode);		
		
		List<Member> list = ms.selectTeamList(ul);
		
		return "userInfo/myPage/myInfo";
	}

}

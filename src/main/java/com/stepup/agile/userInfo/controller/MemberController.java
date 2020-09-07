package com.stepup.agile.userInfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.service.MemberService;
import com.stepup.agile.userInfo.model.vo.Member;

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

}

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
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.service.MemberService;
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
	
	//팀원 및 프로젝트 리스트 나열
	@RequestMapping("profile.me")
	public String profile(Model model, @ModelAttribute("loginUser") Member m) {
		
		UserTeamList ul = new UserTeamList();
		
		ul.setUserCode(m.getUserCode());
//		ul.setTeamCode(teamCode);		
		
		List<Member> list = ms.selectTeamList(ul);
		model.addAttribute("list", list);
		
		List<UserProjectList> project = ms.selectProjectList(m.getUserCode());
		
		System.out.println("여긴가요?"+list);
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
		int reslt = ms.insertDept(map);
		
		Member member = ms.selectDept(m.getUserCode());
		System.out.println(member);
		mv.addObject("member", member);
		mv.setViewName("jsonView");
		System.out.println(mv);
		return mv;
	}

}

package com.stepup.agile.userInfo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.userInfo.model.service.TeamService;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.Team;

@SessionAttributes("loginUser")
@Controller
public class TeamController {
	
	@Autowired
	private TeamService ts;
	
	//User Team 조회용
	@RequestMapping("addTeam.tm")
	public String showAddTeam(Model model, Team t, @ModelAttribute("loginUser") Member m) {
		
		List<Team> teamList;
		List<Member> teamUserName = null;
		List<Member> Administration = null;
		
		try {
		teamList = ts.selectTeam(t);
		teamUserName = ts.selectUserList(t);
		Administration = ts.selectAdministration(m);
		
		model.addAttribute("teamList",teamList);
		model.addAttribute("teamUserName",teamUserName);
		model.addAttribute("Administration",Administration);
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		
		System.out.println("controller" +teamUserName+Administration);
		
		return "userInfo/addTeam";
	}
	
	//Team 생성
	@RequestMapping(value="insertTeam.tm")
	@ResponseBody
	public ResponseEntity insertTeam(Model model, Team t, @RequestParam Map<String, Object> paramMap) throws Exception {
		ResponseEntity entity = null; 
		System.out.println("controller insert Team : "+t);
		int result = ts.insertTeam(paramMap);
		
		if(result > 0) {
			return new ResponseEntity(result, HttpStatus.OK);
		} else {
			model.addAttribute("msg","Team 생성 실패하였습니다.");
			return new ResponseEntity(result, HttpStatus.BAD_REQUEST);
		}
		
	}
	


}











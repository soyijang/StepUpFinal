package com.stepup.agile.userInfo.controller;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectFeedback.model.vo.SurveyJoinList;
import com.stepup.agile.userInfo.model.service.TeamService;
import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userInfo.model.vo.Team;
import com.stepup.agile.userInfo.model.vo.UserTeamList;

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
	public String insertTeam(Model model, Team t, @RequestParam Map<String, Object> paramMap) throws Exception {
		System.out.println("controller insert Team : "+t);
		int result = ts.insertTeam(paramMap);
		
		if(result > 0) {
			return "redirect:addTeam.tm";
		} else {
			model.addAttribute("msg","Team 생성 실패하였습니다.");
			return "common/error";
		}
		
	}
	
	@RequestMapping(value="mailSender.tm",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView mailSender(ModelAndView mv, @RequestBody Member m) 
			throws AddressException, MessagingException {
		
		String host = "smtp.gmail.com"; 
		final String username = "stepup9180@gmail.com"; 
		final String password = "agile0918"; 
		int port=465; 
		System.out.println("m:" + m.getTeamJoinVOList());
		for(Member str : m.getTeamJoinVOList()) {
			int result = ts.insertTeamJoin(str);
	
			//메일발송
			String recipient = str.getUserEmail();
			String subject = str.getUserName() + "님! 스탭업에서 초대 메일이 발송되었습니다!";
			String body = username+"님으로 부터 메일을 받았습니다." 
					+ "http://localhost:8001/agile/addTeam.tm?email=" + str.getUserEmail()
					+"&surveyCode=" + str.getUserCode(); 
	
			Properties props = System.getProperties(); 
			
			// 정보를 담기 위한 객체 생성 // SMTP 서버 정보 설정 
			props.put("mail.smtp.host", host); 
			props.put("mail.smtp.port", port); 
			props.put("mail.smtp.auth", "true"); 
			props.put("mail.smtp.ssl.enable", "true"); 
			props.put("mail.smtp.ssl.trust", host); 
			
			//Session 생성 
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
				String un=username; 
				String pw=password; 
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
					return new javax.mail.PasswordAuthentication(un, pw); 
				} 
			}); 
			
			session.setDebug(true); 
			
			//for debug 
			Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
			mimeMessage.setFrom(new InternetAddress("stepup9180@gmail.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
			
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			mimeMessage.setSubject(subject); //제목셋팅 
			mimeMessage.setText(body); //내용셋팅 
			Transport.send(mimeMessage);
		}
		
		mv.setViewName("jsonView");
		
		return mv;
	}

	
	


}











package com.stepup.agile.projectFeedback.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.stepup.agile.projectFeedback.model.service.SurveyReplyService;
import com.stepup.agile.projectFeedback.model.vo.SurveyChoiceList;
import com.stepup.agile.projectFeedback.model.vo.SurveyJoinList;
import com.stepup.agile.projectFeedback.model.vo.SurveyList;
import com.stepup.agile.projectFeedback.model.vo.SurveyReplyList;

@SessionAttributes("loginUser")
@Controller
public class SurveyReplyController {
	
	@Autowired
	private SurveyReplyService rs;
	
	//응답페이지 메인용
	@RequestMapping("surveyReply.sv")
	public String selectSurveyOne(Model model, String email, int surveyCode) {
	/*	@ModelAttribute("loginUser") Member m, SurveyList s*/
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userEmail", email);
		map.put("surveyCode", surveyCode);
		SurveyList survey;
		survey = rs.selectSurveyOne(map);
		
		if(survey.getSurveyJoinList().getSurveyJoinReply().equals("Y")){
			model.addAttribute("alertmsg", "이미 응답한 설문입니다!");
			return "projectFeedback/feedbackAnswer/answerClose";
		}else {
			survey.setSurveyIntro(survey.getSurveyIntro().replace("\\r\\n", "<br>"));
			model.addAttribute("surveyOne", survey);
			return "projectFeedback/feedbackAnswer/answerMain";
		}
		/*
		 * if(survey == null) { model.addAttribute("alertmsg", "설문 참여 대상이 아닙니다!");
		 * model.addAttribute("url", "self.opener=self;\r\n" + "window.close();");
		 * return "common/alert"; }else
		 */
	
	}
	
	//응답페이지 두번째 next (문항)
	@RequestMapping(value="surveyReplyNext.sv",method=RequestMethod.POST)
	public ModelAndView selectSurveyQues(ModelAndView mv, int surveyCode) {
		//질문 및 문항 같이 조회
		System.out.println("두번째 페이지 코드: " + surveyCode);
		List<SurveyChoiceList> surveyChoiceList;
		surveyChoiceList = rs.selectSurveyQues(surveyCode);
		
		System.out.println("두번째 페이지 결과: " + surveyChoiceList);
		mv.addObject("surveyChoiceList", surveyChoiceList);
		mv.setViewName("jsonView");
		
		return mv;
	}	
	
	
	//응답페이지 제출용
	@RequestMapping("surveyReplyFin.sv")
	public ModelAndView insertSurveyReply(ModelAndView mv, @RequestBody SurveyReplyList replyList) {
		
		for(SurveyReplyList str : replyList.getSurveyReplyVOLists()) {
			int result = rs.insertSurveyReply(str);
		}
		mv.addObject("alertmsg", "설문에 참여해주셔서 감사합니다!👼🏻");
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//응답페이지 메인용
	@RequestMapping(value="mailSender.sv",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView mailSender(ModelAndView mv, @RequestBody SurveyJoinList joinList) 
			throws AddressException, MessagingException {

		int size = 0;
		String host = "smtp.gmail.com"; 
		final String username = "stepup9180@gmail.com"; 
		final String password = "agile0918"; 
		int port=465; 
		System.out.println("joinList:" + joinList.getSurveyJoinVOList());
		for(SurveyJoinList str : joinList.getSurveyJoinVOList()) {
			
			InetAddress local;
			String ip="";
			try { local = InetAddress.getLocalHost(); 
				 ip = local.getHostAddress(); 
				System.out.println("local ip : "+ip);
			} catch (UnknownHostException e1) { 
				e1.printStackTrace(); 
			}

			size++;
			int result = rs.insertSurveyJoin(str);
	
			//메일발송
			String recipient = str.getSurveyJoinEmail();
			String subject = str.getSurveyJoinName() + "님! 스탭업 스프린트 설문을 진행해주세요!";
			String body = "http://"+ ip +":8001/agile/surveyReply.sv?email=" + str.getSurveyJoinEmail()
					+"&surveyCode=" + str.getSurveyCode(); 
	
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
		
		mv.addObject("size", size);
		mv.setViewName("jsonView");
		
		return mv;
	}

	
		
}

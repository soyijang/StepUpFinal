package com.stepup.agile.userInfo.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.stepup.agile.util.SMTPUtil;


@RestController
@RequestMapping("/email")
@Component
public class EmailController {

    @Autowired
    SMTPUtil smtpUtil;

    HttpHeaders headers;

    /**
     * EmailController
     * HttpHeaders init
     */
    public EmailController() {
        headers = new HttpHeaders();
        this.headers.set("Content-Type", "application/json;charset=UTF-8");


    }


    @RequestMapping(value="send.tm")
    public ResponseEntity emailSend(@RequestParam(name = "userEmail") String userEmail,  HttpServletRequest request) {
        ResponseEntity entity = null;

//        String sEmail = "jyseo@msjco.co.kr";

        StringBuilder sbContent = new StringBuilder();
        sbContent.append("http://localhost:8001/agile");

        HashMap<String, Object> mailMap = new HashMap<String, Object>();

        mailMap.put("subject", "step up");
        mailMap.put("fromUser", "iinoasuka@naver.com");
        mailMap.put("toUser", "touser@m.co.kr");

        mailMap.put("fromUser", "gmail");
        mailMap.put("toUser", userEmail);
        mailMap.put("content", sbContent.toString());

        try {
            if (mailTranInsertProcess(mailMap) == 1)
                entity = new ResponseEntity(true, headers, HttpStatus.OK);
            else
                entity = new ResponseEntity(false, headers, HttpStatus.BAD_REQUEST);  
        } catch (Exception e) {
           e.printStackTrace();

            entity = new ResponseEntity(e.toString(), headers, HttpStatus.EXPECTATION_FAILED);
        }


        return entity;
    }



    //    sendMail(String subject, String content, String fromUser, String toUser, String[] toCc, String fileName, String filePath, String imgPath) {

    public int mailTranInsertProcess(HashMap<String, Object> paraMap) throws Exception {
        int result = 0;
        try {
            smtpUtil.sendMail(
                    (String) paraMap.get("subject")
                    , (String) paraMap.get("content")
                    , (String) paraMap.get("fromUser")
                    , (String) paraMap.get("toUser")
                    , null
                    , null
                    , null
                    , null
            );
            result = 1;
        } catch (Exception e) {
           e.printStackTrace();
            result = 0;
        }
        return result;
    }

}
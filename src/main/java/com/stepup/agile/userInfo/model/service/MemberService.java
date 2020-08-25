package com.stepup.agile.userInfo.model.service;

import java.util.Map;

import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginFailedException;

	int insertMember(Member m);

	int insertJob(Map<String, Object> member);

}

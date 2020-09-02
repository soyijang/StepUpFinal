package com.stepup.agile.userInfo.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.exception.LoginFailedException;
import com.stepup.agile.userInfo.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginFailedException;

	int insertMember(Member m);

	int insertJob(Map<String, Object> member);

	String selectUserProject(Member m);


}

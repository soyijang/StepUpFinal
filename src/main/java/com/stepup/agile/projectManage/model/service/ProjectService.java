package com.stepup.agile.projectManage.model.service;

import java.util.List;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.vo.Member;

public interface ProjectService {

	List<Project> selectUserProject(Member m);

	
}

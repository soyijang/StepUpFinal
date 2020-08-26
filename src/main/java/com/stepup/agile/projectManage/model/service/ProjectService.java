package com.stepup.agile.projectManage.model.service;

import java.util.ArrayList;
import java.util.List;

import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.vo.Member;

public interface ProjectService {

	List<Project> selectUserProject(Member m);

	List<Project> selectProject(Member m);





	
}
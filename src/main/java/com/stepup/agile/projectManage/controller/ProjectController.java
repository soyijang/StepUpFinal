package com.stepup.agile.projectManage.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.stepup.agile.projectManage.model.service.ProjectService;
import com.stepup.agile.projectManage.model.vo.Project;
import com.stepup.agile.userInfo.model.vo.Member;


@SessionAttributes("loginUser")
@Controller
public class ProjectController {
	@Autowired
	private ProjectService ps;
	
	//프로젝트 메인페이지로 포워딩 (해당 멤버의 project list 조회 후 view 이동) 
	@RequestMapping("showProjectMain.pj")
	public String selectProject(Model model,  @ModelAttribute("loginUser") Member m) {
		//System.out.println("controller" + m);
		List<Project> projectList;
		//프로젝트 리스트 (프로젝트 코드 정보 담김)
		projectList = ps.selectProjectList(m);
		//System.out.println("controller " + projectList);
		
		/*
		 * int[] projectCodeArr = new int [projectList.size()]; for(int i = 0; i <
		 * projectList.size(); i++) { System.out.println("projectCode : " +
		 * projectList.get(i).getProjectCode()); projectCodeArr[i] =
		 * projectList.get(i).getProjectCode(); } HashMap<String, Integer>
		 * projectProceegingRate; projectProceegingRate =
		 * ps.selectProjectProceedingRate(projectCodeArr);
		 */
		
		model.addAttribute("projectList", projectList);
		return "projectManage/projectList/projectList";
	}
	
	//프로젝트 생성
	@RequestMapping("insert.pj")
	public String insertProject(Model model, Project p) {
		int result = ps.insertProject(p);
		System.out.println(p);
		if(result > 0) {
			return "projectManage/projectList/projectList";
		} else {
			model.addAttribute("msg", "프로젝트 생성 실패!");
			return "common/errorPage";
		}
	}	
	
	
	
	
	
	
	
}

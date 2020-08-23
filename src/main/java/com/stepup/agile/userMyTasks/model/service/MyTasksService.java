package com.stepup.agile.userMyTasks.model.service;

import com.stepup.agile.userInfo.model.vo.Member;
import com.stepup.agile.userMyTasks.model.vo.MyTask;

public interface MyTasksService {

	MyTask [] showMyTasks(Member m);

	
}

package com.cloud.pt.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.cloud.pt.attendance.AttendanceService;

@Component
public class Scheduler {
	@Autowired
	private AttendanceService attendanceService;
	
	//매일 자정마다 실행
	@Scheduled(cron = "0 0 0 * * *", zone = "Asia/Seoul") //timezone 설정 
	public void setState() throws Exception {
		
	}
}

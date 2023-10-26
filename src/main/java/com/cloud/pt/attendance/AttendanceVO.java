package com.cloud.pt.attendance;

import java.sql.Date;
import java.sql.Time;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AttendanceVO {
	//근태번호
	private Long attendanceNum;
	//직원번호
	private Long employeeNum;
	//출근일
	private Date workDate;
	//출근시간
	private Time onTime;
	//퇴근시간
	private Time offTime;
	//상태 
	private String state;
	
	private AttendanceModifyVO attendanceModifyVO;
}

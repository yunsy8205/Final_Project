package com.cloud.pt.approval;

import java.sql.Date;
import java.sql.Timestamp;

import com.cloud.pt.employee.EmployeeVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ApprovalVO {
	private Long approvalNum;
	private String employeeNum;
	private String category;
	private String middle;
	private String last;
	private Date regDate;
	private String name;
	private String title;
	private String contents;
	private String state;
	private String reason;
	private Date middleDate;
	private Date finalDate;
	private Date startDate;
	private Date endDate;
	private String leaveKind;
	private Double useDate;
	private String halfKind;
	private EmployeeVO employeeVO;
	
}

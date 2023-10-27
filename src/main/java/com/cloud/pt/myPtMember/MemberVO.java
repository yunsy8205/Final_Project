package com.cloud.pt.myPtMember;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	
	private Long memberNum;
	private Long employeeNum;
	private String name;
	private String phone;
	private String gender;
	private Date birth;
	private Long ptCount;
}

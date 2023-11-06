package com.cloud.pt.registration;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RegistrationVO {
	private Long registrationNum;
	private Long memberNum;
	private Long membershipNum;
	private Date regDate;
}

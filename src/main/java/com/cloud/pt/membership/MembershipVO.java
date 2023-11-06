package com.cloud.pt.memberShip;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MembershipVO {
	
	private Long membershipNum;
	private String name;
	private Character type;
	private Date month;
	private Integer ptCount;
	private Integer price;
	
}

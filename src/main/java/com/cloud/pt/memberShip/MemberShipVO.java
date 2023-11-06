package com.cloud.pt.membership;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MembershipVO {
	//이용권번호
	private Long memberShipNum; 
	//이용권이름
	private String name;
	//이용권종류
	private Character type;
	//이용개월
	private Integer month;
	//피티횟수
	private Integer ptCount;
	//가격
	private Integer price;
}

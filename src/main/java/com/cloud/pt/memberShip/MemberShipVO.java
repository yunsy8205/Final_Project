package com.cloud.pt.memberShip;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberShipVO {
	//이용권번호
	private Long memberShipNum; 
	//이용권명
	private String name;
	//이용권종류
	private Character type;
	//이용개월
	private Date month;
	//피티횟수
	private Integer ptCount;
	//가격
	private Integer price;
}

package com.cloud.pt.ptLog;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PtTypeVO {
	
	private Long ptTypeNum;
	private String EmployeeNum;
	private String name;
	private String weight;
	private Long exCount;
	private Long ptSet;
	private boolean finish;
}

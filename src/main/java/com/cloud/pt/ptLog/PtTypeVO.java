package com.cloud.pt.ptLog;

import lombok.Getter;
import lombok.Setter;

public class PtTypeVO {

	@Getter
	@Setter
	private Long PtTypeNum;
	private String employeeNum;
	private String name;
	private String weight;
	private Long exCount;
	private Long ptSet;
	private boolean finish;
}

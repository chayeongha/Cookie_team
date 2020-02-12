package com.cookie.basic.calendar;

import java.sql.Date;
import lombok.Data;

@Data
public class CalVO {
	
	private Integer checkNum;
	private Integer memNum;
	private String memCheck;
	private Date checkDate;
}

package edu.kosmo.today.vo;

import java.sql.Date;

import lombok.Data;


/*
BID      NOT NULL NUMBER         
BTITLE            VARCHAR2(100)  
BCONTENT          VARCHAR2(2000) 
BDATE             DATE           
MNUM              NUMBER         
TNUM              NUMBER */
@Data
public class EventVO {
	private int bid;
	private String btitle;	
	private String bcontent;	
	private Date bdate;	
	private int mnum;	
	private int tnum;	

}

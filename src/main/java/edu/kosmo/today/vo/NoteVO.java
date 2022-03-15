package edu.kosmo.today.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


/*
BID      NOT NULL NUMBER         
BTITLE            VARCHAR2(100)  
BCONTENT          VARCHAR2(2000) 
BDATE             DATE           
MNUM              NUMBER         
TNUM              NUMBER */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class NoteVO {
	private int bid;
	private String btitle;	
	private String bcontent;	
	private Date bdate;	
	private int mnum;	
	private int tnum;	
}

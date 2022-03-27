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
public class NoteVO {
	private int bid;
	private String btitle;	
	private String bcontent;	
	private Date bdate;	
	private int mnum;	
	private int tnum;	
	private String mname;// 작성 회원 이름
	private String tname;//게시판 종류
	
	private int bgroup;	
	private int bstep;	
	private int bindent;	
}

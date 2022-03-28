package edu.kosmo.today.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//03-02찜기능 구현 김보람 (이용권VO)

/*
이름        널?       유형             
--------- -------- -------------- 
GNUM      NOT NULL NUMBER(20)     
MNUM               NUMBER(20)     
GNAME              VARCHAR2(200)  
GCATEGORY          VARCHAR2(100)  
GADRESS            VARCHAR2(2000) 
GPHONE             VARCHAR2(2000) 
GINFORM            VARCHAR2(2000) 
GTIME              VARCHAR2(2000) 
GFACILITY          VARCHAR2(2000) 
GSNS               VARCHAR2(2000) 
FILENAME           VARCHAR2(2000) 
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GymVO {

	private int gnum; //시설번호
	//private int mnum; //회원번호
	private String gname; //시설이름
	private String gcategory;  //시설분류(예> 요가,헬스,p.t전문점)
	private String gaddress; //주소
	private String gphone; //시설연락처
	private String ginform; //시설 설명
	private String gtime; //시설 운영시간
	private String gfacility;  //편의시설
	private String gsns;  //sns주소
	private String imagename; //시설사진
	private int pr;
	private String keyword;

	
}

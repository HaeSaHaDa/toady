package edu.kosmo.today.vo;

import java.util.List;

import lombok.Builder;
import lombok.Data;

//03-02찜기능 구현 김보람 (시설정보VO)

/*
GNUM      NOT NULL NUMBER         
MNUM               NUMBER         
GNAME              VARCHAR2(100)  
GADRESS            VARCHAR2(100)  
GPHONE             NVARCHAR2(100) 
GINFORM            VARCHAR2(3900) 
GTIME              VARCHAR2(1000) 
GFACILITY          VARCHAR2(1500) 
GSNS               VARCHAR2(1500) 
 */
@Data
@Builder
public class GymVO {

	private int gnum;//시설번호
	private int mnum; //회원번호
	private int gname; //헬스장이름
	private int gadress; //헬스장주소
	private int gphone; //헬스장 연락처
	private String ginform; //헬스장 소개
	private String gtime; //헬스장 운영시간
	private String gfactility; //헬스장 편의시설
	private String gsns; //헬스장 sns주소
	//private String gphoto; //시설이미지 나중에 컬럼 만들면 주석풀기
	
}

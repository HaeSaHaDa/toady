package edu.kosmo.today.vo;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//0311 FAQ게시판

/*
이름        널?       유형             
--------- -------- -------------- 
BID      NOT NULL NUMBER         
BTITLE            VARCHAR2(100)  
BCONTENT          VARCHAR2(2000) 
BDATE             DATE           
MNUM              NUMBER         
TNUM              NUMBER  
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FaqVO {

	private int bid; //글번호
	private String btitle; //글 제목
	private String bcontent; // 글 내용
	private Timestamp bdate; //작성일
	private int mnum; //작성회원
	private int tnum; //글 타입 예> 공지,이벤트,1:1문의

	
	
}

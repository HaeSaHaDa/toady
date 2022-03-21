package edu.kosmo.today.vo;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//0316 리뷰게시판 김보람

/*
 이름     널? 유형     
------ -- ------ 
GRSTAR    NUMBER 
GNUM      NUMBER 
BID       NUMBER 
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {

	private int bid; //글번호
	private String bcontent; // 글 내용
	private Timestamp bdate; //작성일
	private int mnum; //작성회원
	private int tnum; //글 타입 예> 공지,이벤트,1:1문의	
	
	private int grstar;//별점
	private int gnum; // 시설번호
	private int ordernum; //주문번호
	
	private int tknum; //티켓번호
	private String mnickname;
}

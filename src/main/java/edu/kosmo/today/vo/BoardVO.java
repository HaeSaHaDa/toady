package edu.kosmo.today.vo;

import java.sql.Date;
import java.util.List;

import lombok.Builder;
import lombok.Data;

//03-02찜기능 구현 김보람

/*
BID	NUMBER
BTITLE	VARCHAR2(100 BYTE)
BCONTENT	VARCHAR2(2000 BYTE)
BDATE	DATE
MNUM	NUMBER
TNUM	NUMBER
 */
@Data
@Builder
public class BoardVO {

	private int bid; //게시글번호
	private String btitle;//게시글제목
	private String bcontent;//게시글내용
	private Date bdate;//게시글작성일
	private int mnum;//작성회원번호
	private int tnum;//게시판타입번호
	
}

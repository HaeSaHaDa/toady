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
public class BoardTpyeVO {

	private int tnum;//게시판 타입번호
	private String tname;//게시판 타입명
	
}

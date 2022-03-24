package edu.kosmo.today.vo;

import java.sql.Date;
import java.sql.Timestamp;
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
public class RegiGymListVO {

	private int Storenum; //헬스장 등록 번호
	
	private String storename;//헬스장 등록 명
	private String storeadr;//헬스장 등록 주소
	private String storetel;//헬스장 등록 연락처
	private Date storedate;//헬스장 등록 날짜

	
}

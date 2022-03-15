package edu.kosmo.today.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//03-02찜기능 구현 김보람 (이용권VO)

/*
TNUM  NOT NULL NUMBER        
GNUM           NUMBER        
TCOST          NUMBER        
TDATE          NUMBER        
TNAME          VARCHAR2(100) 

 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TicketVO {

	private int tnum; //티켓번호
	private int gnum; //헬스장번호
	private int tcost; //이용권기본가격
	//private int tdate; //이용권 기간 (개월단위 ex> 1일경우 1개월로 취급함)
	private String tname; //이용권이름
	

	
	
}

package edu.kosmo.today.vo;

import java.util.List;

import lombok.Builder;
import lombok.Data;

//03-02찜기능 구현 김보람

/*
WISHNUM NOT NULL NUMBER 
MNUM             NUMBER 
TNUM             NUMBER 
 */
@Data
@Builder
public class WishVO {

	private int wishnum; //찜번호
	private int mnum; //회원번호
	private int tnum; //티켓번호

	private List<TicketVO> ticketList; //티켓정보를 가져오는 리스트
	
}

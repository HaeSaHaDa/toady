package edu.kosmo.today.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//03-02찜기능 구현 김보람

/*
WISHNUM NOT NULL NUMBER 
MNUM             NUMBER 
TNUM             NUMBER 
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class WishVO {

	private int wishnum; //찜번호
	private int mnum; //회원번호
	private int tknum; //티켓번호
	private int wdate; //찜목록에 담긴 이용권 기간

	private String gname; //헬스장 이름
	private String tname; //이용권이름
	private int tcost; //이용권 가격
	private int tdate; //이용권 기간
	
	private String imagename; //이미지 이름
	
}

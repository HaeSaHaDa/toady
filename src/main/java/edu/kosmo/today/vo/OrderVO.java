package edu.kosmo.today.vo;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//0314 이용권구매내역
/*
ORDERNUM  NOT NULL NUMBER 
MNUM               NUMBER 
ORDERDATE          DATE

디테일
이름       널? 유형     
-------- -- ------ 
TNUM        NUMBER 
COST        NUMBER 
ORDERNUM    NUMBER
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {

	private int ordernum; //주문번호
	private int mnum; //회원번호
	private Timestamp orderdate; //주문날짜
	
	//Db에 수량컬럼부분 추가하기
	
	private int tnum;
	private String tname;
	private int cost;
	
	private int gnum;
	private String gname;
	

	
}

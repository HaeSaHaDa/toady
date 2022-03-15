package edu.kosmo.today.vo;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//0314 이용권구매내역
/*
주문목록
이름        널? 유형            
--------- -- ------------- 
ORDERNUM     NUMBER        
MNUM         NUMBER        
ORDERDATE    DATE          
PAYID        VARCHAR2(100) 

주문상세(이용권정보)
이름        널? 유형     
--------- -- ------ 
TNUM         NUMBER 
COST         NUMBER 
ORDERNUM     NUMBER 
STARTDATE    DATE   
TDATE        NUMBER  

 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {

	private int ordernum; //주문번호
	private int mnum; //회원번호
	private Timestamp oderdate; //주문일
	private String payid; //
	
	
	
	

	
}

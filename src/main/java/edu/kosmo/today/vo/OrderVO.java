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
	
	//orderlist
	private int ordernum; //주문번호
	private int mnum; //회원번호
	private Timestamp orderdate; //주문일
	private String payid; //아임포트 결제 후 받은 결제번호
	//orderdetail
	private int tknum; //티켓번호
	private int cost; //해당 이용권의 결제가격
	private Timestamp startdate; //시작날짜
	private int tdate; //개월수(수량)	
	//조인 뒤 받을 컬럼들
	private String tname;//이용권이름
	private int gnum; //시설번호
	private String gname; //시설이름
	
		
}
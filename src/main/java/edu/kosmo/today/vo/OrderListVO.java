package edu.kosmo.today.vo;



import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
ORDERNUM  NOT NULL NUMBER 
MNUM               NUMBER 
ORDERDATE          DATE   
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OrderListVO {
	
	//orderlist, member, orderdetail, ticket, gympage
	private int mnum; //회원 번호
	private String memail; //회원 이메일
	private String mnickname; //회원 닉네임
	private String mphone; //회원 연락처
	private String mbirth; //회원 생일
	
	private Date orderdate; //구매 날짜
	
	private int tcost; //가격
	private String tname; //이용권 이름

}

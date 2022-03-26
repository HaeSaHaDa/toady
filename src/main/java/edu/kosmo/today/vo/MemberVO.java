package edu.kosmo.today.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

/*
MNUM      NOT NULL NUMBER        
MEMAIL             VARCHAR2(100) 
MPASSWORD          VARCHAR2(100) 
MNICKNAME          VARCHAR2(100) 
MPHONE             NUMBER        
MBIRTH             VARCHAR2(50)  
SOCIALID           VARCHAR2(100)
*/

public class MemberVO {	
	private Integer mnum;
	private String memail;
	private String mpassword;
	private String mnickname;
	private String mphone;
	private String mbirth;
	private String mid;

	private String auth;	

}

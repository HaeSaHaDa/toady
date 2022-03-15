package edu.kosmo.today.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
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
	private int mnum;
	private String memail;
	private String password;
	private String mnickname;
	private Integer mphone;
	private String mbirth;
	private String socialid;
	
	private String auth;

}

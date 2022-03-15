package edu.kosmo.today.vo;

import java.util.List;

import lombok.Builder;
import lombok.Data;

/*
MNUM      NOT NULL NUMBER        
MEMAIL             VARCHAR2(100) 
MPASSWORD          VARCHAR2(100) 
MNICKNAME          VARCHAR2(100) 
MPHONE             NUMBER        
MBIRTH             VARCHAR2(50)  
SOCIALID           VARCHAR2(100) 
 */
@Data
@Builder
public class UserVO {

	private Integer mnum;
	private String mid;
	private String mpassword;
	private String mnickname;
	private String mphone;
	private String mbirth;
	//private String socialid;
	private List<AuthVO> authList;
}

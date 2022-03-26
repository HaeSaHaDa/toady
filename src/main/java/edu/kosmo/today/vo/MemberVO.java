package edu.kosmo.today.vo;

import lombok.Data;

@Data
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

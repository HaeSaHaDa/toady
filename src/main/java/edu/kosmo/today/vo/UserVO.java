package edu.kosmo.today.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

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
@NoArgsConstructor
public class UserVO {

	private Integer mnum;
	private String mid;
	private String memail;
	private String mpassword;
	private String mnickname;
	private String mphone;
	private String mbirth;

	private List<AuthVO> authList;//memail, auth

	@Builder
	public UserVO(Integer mnum, String mid, String memail, String mpassword, String mnickname, String mphone,
			String mbirth, List<AuthVO> authList) {
		super();
		this.mnum = mnum;
		this.mid = mid;
		this.memail = memail;
		this.mpassword = mpassword;
		this.mnickname = mnickname;
		this.mphone = mphone;
		this.mbirth = mbirth;
		this.authList = authList;
	}
	

}

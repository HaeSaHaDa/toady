package edu.kosmo.today.vo;

//import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GymList { // 빈칸이나 Min Max 나중 구현 아직 안했음. ㅈㅅㅈㅅ

	private int gnum;
	private int mnum;
	private String gname;
	private String gcategory;
	private String gaddress;
	private String gphone;
	private String ginform;
	private String gtime;
	private String gfacility;
	private String gsns;
	
	private String keyword;

	//private String gimagename;
}// hibernate = jpa+ native


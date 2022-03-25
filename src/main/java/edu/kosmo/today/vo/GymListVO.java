package edu.kosmo.today.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class GymListVO {
	
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
	private MultipartFile gymimage;
	private String imagename; 
	private String ad;
}

package edu.kosmo.today.vo;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

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
	private String mpassword;
	private String mnickname;
	private int mphone;
	private String mbirth;
	private String socialid;

}

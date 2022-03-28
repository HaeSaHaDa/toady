package edu.kosmo.today.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//03-02찜기능 구현 김보람 (이용권VO)

/*
이름        널?       유형             
--------- -------- -------------- 
GNUM       NUMBER        
GTNAME     VARCHAR2(50)  
GTIMAGE    VARCHAR2(100) 
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TrainerVO {

	private int gnum; //시설번호
	private String gtname; //트레이너 이름
	private String gtimage; //트레이너이미지
	private String gtcareer; //트레이너 경력

	private String gname; //시설이름
	
	
}

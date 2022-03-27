package edu.kosmo.today.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//03-02찜기능 구현 김보람

/*
OSCNUM	NUMBER
OSCPAYID	VARCHAR2(500 BYTE)
OSCIMPID	VARCHAR2(500 BYTE)
MNUM	NUMBER
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CompleteVO {

	private int oscnum;
	private String oscpayid;
	private String oscimpid;
	private int mnum;
	
	
	
}

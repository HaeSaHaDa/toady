package edu.kosmo.today.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria2 {
	
	private int pagenum = 9; // 페이지 번호
	private int amount = 3; // 한페이지당 몇개의 데이터를 보여줄것인가?
	
	public Criteria2() {
		this(1,3);  //기본값 페이지 10개로 지정(디폴트)
	}
	public Criteria2(int pagenum,int amount) {
		this.pagenum = pagenum;
		this.amount = amount;
	}	
}

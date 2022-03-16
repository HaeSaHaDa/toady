package edu.kosmo.today.page;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageVO2 {
	private int startPage;// 화면에 보여지는 페이지 시작번호
	private int endPage;// 화면에 보여지는 페이지 끝번호
	private boolean pre,next; // 이전과 다음으로 이동가능한 링크표시
	private int total; // 전체 게시판 글수	
	private Criteria2 criteria;
	
	public PageVO2(Criteria2 criteria,int total) {
		this.criteria = criteria;
		this.total = total;
		
	
		this.endPage = (int) (Math.ceil(criteria.getPagenum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / criteria.getAmount()));

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}		
		
		this.pre = this.startPage > 1;		
		this.next = this.endPage < realEnd;		
		
	}

	public String makeQuery(int page) {
		
		UriComponents uriComponentsBuilder = UriComponentsBuilder.newInstance()
				.queryParam("pagenum", page) 														// 3
				.queryParam("amount", criteria.getAmount()) 
				.build(); 
		
		return uriComponentsBuilder.toUriString(); 
		
	}
	
	
}

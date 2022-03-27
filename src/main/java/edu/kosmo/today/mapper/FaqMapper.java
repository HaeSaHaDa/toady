package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.FaqVO;

/*
 * 0311 faq관리
 */

@Mapper
public interface FaqMapper {
	
	//회원번호 가져오기
	public int getMemberNum(String memail);

	//글 갯수(페이징)
	public int getTotal();
	//faq글 목록
	public List<FaqVO> faqList(Criteria criteria);

	//faq 작성
	public void insertFaqBoard(FaqVO vo);
	
	//faq 글보기
	public FaqVO getContent(int bid);
}

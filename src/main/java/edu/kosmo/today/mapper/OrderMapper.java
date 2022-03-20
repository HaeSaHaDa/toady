package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.Criteria2;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.OrderVO;
import edu.kosmo.today.vo.ReviewVO;
import edu.kosmo.today.vo.TicketVO;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;

/*
 * 0314 이용권
 */

@Mapper
public interface OrderMapper {
	
	//구매한 이용권 확인하기
	//public List<OrderVO> getTicketList(int mnum);
	
	//회원번호구하기
	public int getMemberNum(String memail);
	
	//구매한 이용권에 리뷰작성하기
	public void inserReview(ReviewVO vo);
	
	//리뷰작성했는지 체크하기
	public int checkReview(ReviewVO vo);
	
	//페이징
	//갯수(페이징)
	public int getTotal(int mnum);
	//faq글 목록
	public List<OrderVO> getTicketList(@Param("criteria")Criteria2 criteria,@Param("mnum")int mnum);
	
}

package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.Criteria2;
import edu.kosmo.today.vo.CompleteVO;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.OrderVO;
import edu.kosmo.today.vo.ReviewVO;
import edu.kosmo.today.vo.WishVO;

/*
 * 0314 이용권
 */

@Mapper
public interface OrderMapper {

	// 구매한 이용권 확인하기
	// public List<OrderVO> getTicketList(int mnum);

	// 회원번호구하기
	public int getMemberNum(String memail);

	// 구매한 이용권에 리뷰작성하기
	public void inserReview(ReviewVO vo);

	// 리뷰작성했는지 체크하기
	public int checkReview(ReviewVO vo);

	// 페이징
	// 갯수(페이징)
	public int getTotal(int mnum);

	// 이용권 목록
	public List<OrderVO> getTicketList(@Param("criteria") Criteria2 criteria, @Param("mnum") int mnum);

	// 환불요청하기
	public void requestPayback(String ment, int mnum);

	// 환불요청체크
	public int checkRequest(int mnum, String ment1, String ment2);

	// 환불요청 보기
	public List<FaqVO> requetList(Criteria cri);

	// 환불요청갯수
	public int totalRequet();

	// 결제완료 주문저장
	public void insertcomplete(CompleteVO completevo);
	
	// 페이징
	// 관리자 갯수(페이징)
	public int adminGetTotal(int mnum);

	// 이용권 목록======================================
	public List<OrderVO> adminnGetTicketList(@Param("criteria") Criteria criteria, @Param("mnum") int mnum);

	
	//주문상세 넣기
	public List<Integer> wishNumList(int mnum); //찜번호구하기
	public WishVO getWish(int wishnum);
	public void insertOrderDtl(OrderVO vo); //상세 넣기
	public void deleteWishTable(int wishnum); //결제 후 찜지우기
}

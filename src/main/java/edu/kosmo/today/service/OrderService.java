package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.OrderMapper;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.Criteria2;
import edu.kosmo.today.vo.CompleteVO;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.OrderVO;
import edu.kosmo.today.vo.ReviewVO;
import edu.kosmo.today.vo.WishVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 찜기능을 위한 Service작성 0302(김보람)
 * */

@Slf4j
@Service
public class OrderService {

	@Autowired
	private OrderMapper mapper;

	// 이용권갯수 구하기
	public int getTotal(String mid) {

		int mnum = mapper.getMemberNum(mid);

		log.info("이용권 총 갯수구하는 중" + mapper.getTotal(mnum));

		return mapper.getTotal(mnum);

	}

	// 리스트 가져오기
	public List<OrderVO> getTicketList(Criteria2 criteria, String mid) {
		log.info("이용권목록 뽑는중.." + criteria, mid);
		int mnum = mapper.getMemberNum(mid);
		System.out.println("....회원번호찾음" + mid);

		log.info(".." + mapper.getTicketList(criteria, mnum));

		return mapper.getTicketList(criteria, mnum);
	}

	/*
	 * //이용권 조회하기 public List<TicketVO> getTicketList(String mid){
	 * System.out.println(mid+"의 이용권 조회하는 중");
	 * 
	 * int mnum = mapper.getMemberNum(mid);
	 * 
	 * List<TicketVO> list = mapper.getTicketList(mnum);
	 * 
	 * return list; }
	 */
	//관리자용
	public int getTotal(int mnum) {
		System.out.println("...총갯수...."+mnum);
		

		return mapper.adminGetTotal(mnum);

	}
	
	//관리자용
	public List<OrderVO> getTicketList2(Criteria criteria, int mnum) {
		log.info("이용권목록 뽑는중.." + criteria, mnum);
	

		log.info(".." + mapper.adminnGetTicketList(criteria, mnum));

		return mapper.adminnGetTicketList(criteria, mnum);
	}

	
	// 리뷰작성하기
	public int insertReivew(ReviewVO vo) {
		System.out.println("리뷰 작성중.." + vo);

		int check = mapper.checkReview(vo);
		System.out.println("0이아니면 리뷰작성함 : " + check);

		if (check != 0) {
			return 1;
		} else {
			mapper.inserReview(vo);
			return 0;
		}

	}

	// 환불신청하기
	public void insertrequest(String payid, String ordernum, String tknum, int mnum) {
		log.info("환불신청중----" + ordernum + "0000" + mnum);

		String ment = "환불신청 회원번호 : " + mnum + " 주문번호 : " + ordernum + " 결제번호 : " + payid + " 이용권번호 : " + tknum;

		System.out.println(ment);

		mapper.requestPayback(ment, mnum);
	}

	// 환불요청확인하기
	public int checkRequst(int mnum, String ordernum, String tknum) {
		System.out.println("환불요청체크중");

		String ment1 = "%주문번호 : " + ordernum + "%";
		String ment2 = "%이용권번호 : " + tknum + "%";

		return mapper.checkRequest(mnum, ment1, ment2);
	}

	// 요청 리스트 보기
	public List<FaqVO> requestList(Criteria cri) {
		System.out.println("요청리스트보는 곳");

		return mapper.requetList(cri);
	}

	// 요청리스트 갯수
	public int totalRequest() {

		return mapper.totalRequet();
	}
	
	//결제정보 디비저장
	public void successpay(CompleteVO complete) {   
		   
		   
		mapper.insertcomplete(complete);
	}
	
	//주문상세관련
	public List<Integer> getWishnum(int mnum){
		System.out.println("찜번호리스트구하는중");
		
		return mapper.wishNumList(mnum);
	}
	public void insertDetail(OrderVO vo) {
		System.out.println("주문상세 넣는중...");
		
		mapper.insertOrderDtl(vo);		
	}
	public void deleteWishTable(int wishnum) {
		System.out.println("찜 삭제중...");
		
		mapper.deleteWishTable(wishnum);
	}
	public WishVO getWishTable(int wishnum) {
		System.out.println(wishnum+"..의 찜 품목구하는중..");
		
		return mapper.getWish(wishnum);
	}
}

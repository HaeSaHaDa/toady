package edu.kosmo.today.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.today.mapper.OrderMapper;
import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.mapper.WishMapper;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.Criteria2;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.OrderVO;
import edu.kosmo.today.vo.ReviewVO;
import edu.kosmo.today.vo.TicketVO;
import edu.kosmo.today.vo.UserVO;
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
		
		log.info("이용권 총 갯수구하는 중"+mapper.getTotal(mnum));

		return mapper.getTotal(mnum);

	}

	// 리스트 가져오기
	public List<OrderVO> getTicketList(Criteria2 criteria,String mid) {
		log.info("이용권목록 뽑는중.."+criteria,mid);
		int mnum = mapper.getMemberNum(mid);
		System.out.println("....회원번호찾음"+mid);
		
		log.info(".."+mapper.getTicketList(criteria, mnum));

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
	
	//환불신청하기
	public void insertrequest(String payid,String ordernum,String tknum,int mnum) {
		log.info("환불신청중----"+ordernum+"0000"+mnum);
		
		String ment = "환불신청 회원번호 : "+mnum+" 주문번호 : "+ordernum+" 결제번호 : "+payid
				+" 이용권번호 : "+tknum;
		
		System.out.println(ment);
		
		mapper.requestPayback(ment, mnum);
	}
	
	//환불요청확인하기
	public int checkRequst(int mnum,String ordernum,String tknum) {
		System.out.println("환불요청체크중");
		
		String ment1 = "%주문번호 : "+ordernum+"%";
		String ment2 = "%이용권번호 : "+tknum+"%";
		
		return mapper.checkRequest(mnum,ment1,ment2);
	}

}

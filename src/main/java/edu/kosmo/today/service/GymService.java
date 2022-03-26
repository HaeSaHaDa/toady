package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.GymMapper;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.Criteria2;
import edu.kosmo.today.vo.GymVO;
import edu.kosmo.today.vo.RegiGymListVO;
import edu.kosmo.today.vo.ReviewVO;
import edu.kosmo.today.vo.TicketVO;
import edu.kosmo.today.vo.TrainerVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 시설목록을 위한 작성 0310 김보람
 * */

@Slf4j
@Service
public class GymService {

	@Autowired
	private GymMapper mapper;

	public List<GymVO> gymList(Criteria cri) {
		log.info("시설 목록 불러오는 중");

		List<GymVO> gymList = mapper.gymList(cri);

		return gymList;
	}
	
	//이용권 토탈가져오는 중
	public int getGymTotal() {
		System.out.println("시설객수세는중");
		
		return mapper.getGymTotal();
	}

	public GymVO gympage(int gnum) {
		log.info(gnum + "의 시설정보 가져오는 중");

		return mapper.gymdetail(gnum);
	}

	// 이용권 가져오는 것
	public List<TicketVO> getTicketList(int gnum) {
		log.info(gnum + "이용권 가져오는 중");

		List<TicketVO> ticket = mapper.getticket(gnum);

		return ticket;
	}

	// 리뷰목록 가져오는 것
	public List<ReviewVO> getReview(Criteria2 cri, int gnum) {
		log.info(gnum + "..의 리뷰목록 불러오는 중");

		List<ReviewVO> list = mapper.getReivew(cri, gnum);

		log.info(list + "....");

		return list;
	}

	// 리뷰갯수구하기
	public int getReviewTotal(int gnum) {
		log.info("리뷰갯수 구하는 중");

		return mapper.getReviewTotal(gnum);
	}

	public List<Integer> getStarAvg(int gnum) {
		log.info("별점만 뽑아내는 중");

		List<Integer> starList = mapper.getstarAvg(gnum);

		return starList;
	}

	// 시설번호 뽑아내는중
	public int getGnum(int mnum) {
		System.out.println("시설번호 구하는중..");

		return mapper.getGnum(mnum);
	}

	// 리뷰관리용 목록
	public List<ReviewVO> getReviewlist(Criteria cri, int gnum) {
		log.info(gnum + "..의 리뷰목록 불러오는 중");

		List<ReviewVO> list = mapper.getReivewlist(cri, gnum);

		log.info(list + "....");

		return list;
	}

	// 리뷰삭제요청(오너)
	public void deleteRequset(int bid, int mnum) {
		System.out.println("리뷰삭제요청중...");

		String ment = "글번호 : " + bid + "의 리뷰를 삭제부탁바랍니다.";

		mapper.deleteRequest(ment, mnum);

	}

	// 삭제요청체크
	public int checkReqest(int bid, int mnum) {
		System.out.println("삭제요청체크");

		String ment = "%글번호 : " + bid + "%";

		return mapper.checkRequest(ment, mnum);
	}

	// 리뷰목록(관리자용)
	public List<ReviewVO> reviewList(Criteria cri) {
		System.out.println("관리자용 리뷰목록뽑는중");

		return mapper.getLeviewList(cri);
	}

	public int getTotal2() {

		return mapper.getTotal2();
	}

	// 리뷰삭제
	public void deleteReview(int bid) {
		System.out.println("리뷰삭제하기.." + bid);

		mapper.deleteReview1(bid);

		System.out.println("boardlist에서 삭제됨");

		mapper.deleteReview2(bid);

		System.out.println("gymreview테이블에서 삭제됨");
	}
	
	//트레이너 목록구하기
	public List<TrainerVO> getTrainerList(int gnum){
		System.out.println("시설 트레이너 뽑는 중...");
		
		return mapper.getTrainer(gnum);
	}
	
	//시설위치받기
	public List<GymVO> getAdress(){
		System.out.println("시설위치받기..");
		
		List<GymVO> list = mapper.gymAdress();
		
		return list;
		
	}
	
	
	//티켓 등록
	public void addTicket(TicketVO ticketVO) {
		
		mapper.addTicket(ticketVO);
	}
	
	//티켓 검색
	public TicketVO ticket(int tknum) {
		log.info(tknum + "이용권 가져오는 중");

		TicketVO ticket = mapper.ticket(tknum);

		return ticket;
	}
	
	public void ticketUp(TicketVO ticketVO) {
		log.info( "이용권 저장 중");

		mapper.ticketUp(ticketVO);
	}
	
	public void ticketDelete(int tknum) {
		log.info("티켓 삭제중");
		
		mapper.ticketDelete(tknum);
	}

	public List<RegiGymListVO> getregistList_admin(){
		log.info("신청한 헬스장 목록보기 - admin");//신청한 헬스장목록보기
		
		return mapper.getregistList_admin();
	}
	public void registRemove_admin(int storenum){//신청목록 삭제
		log.info("신청 목록 삭제 - admin");
		mapper.registRemove_admin(storenum);
	}
}

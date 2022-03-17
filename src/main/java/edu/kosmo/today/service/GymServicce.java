package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.today.mapper.GymMapper;
import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.mapper.WishMapper;
import edu.kosmo.today.page.Criteria2;
import edu.kosmo.today.vo.GymVO;
import edu.kosmo.today.vo.ReviewVO;
import edu.kosmo.today.vo.TicketVO;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 시설목록을 위한 작성 0310 김보람
 * */

@Slf4j
@Service
public class GymServicce {

	@Autowired
	private GymMapper mapper;

	public List<GymVO> gymList() {
		log.info("시설 목록 불러오는 중");

		List<GymVO> gymList = mapper.gymList();

		return gymList;
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
	
	public List<Integer> getStarAvg(int gnum){
		log.info("별점만 뽑아내는 중");
		
		List<Integer> starList = mapper.getstarAvg(gnum);
		
		return starList;
	}
	
}

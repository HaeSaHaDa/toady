package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.Criteria2;
import edu.kosmo.today.vo.GymVO;
import edu.kosmo.today.vo.ReviewVO;
import edu.kosmo.today.vo.TicketVO;
import edu.kosmo.today.vo.TrainerVO;

/*
 *0310 시설페이지 (김보람)
 */

@Mapper
public interface GymMapper {

	// 시설 목록 뽑기
	public List<GymVO> gymList(Criteria cri);
	//시설갯수
	public int getGymTotal();

	// 시설상세화면
	public GymVO gymdetail(int gnum);

	// 시설에 딸린 이용권 추출
	public List<TicketVO> getticket(int gnum);

	// 시설에 해당하는 리뷰뽑기
	public List<ReviewVO> getReivew(@Param("criteria") Criteria2 criteria, @Param("gnum") int gnum);

	// 리뷰갯수구하기
	public int getReviewTotal(int gnum);

	// 리뷰 평점 구하기
	public List<Integer> getstarAvg(int gnum);

	// 시설번호 구하기
	public int getGnum(int mnum);

	// 시설에 해당하는 리뷰뽑기(관리용)
	public List<ReviewVO> getReivewlist(@Param("criteria") Criteria criteria, @Param("gnum") int gnum);

	// 해당 리뷰 삭제요청하기
	public void deleteRequest(@Param("ment") String ment, @Param("mnum") int mnum);

	// 리뷰삭제요청체크
	public int checkRequest(String ment, int mnum);

	// 리뷰목록(관리자용)
	public List<ReviewVO> getLeviewList(Criteria cri);

	public int getTotal2();

	// 리뷰삭제
	public void deleteReview1(int bid);

	public void deleteReview2(int bid);
	
	//트레이너
	public List<TrainerVO> getTrainer(int gnum);
	
	//시설위치구하기
	public List<GymVO> gymAdress();

}

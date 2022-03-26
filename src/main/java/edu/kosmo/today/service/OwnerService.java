package edu.kosmo.today.service;

import java.util.List;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.GymListVO;
import edu.kosmo.today.vo.OrderListVO;
import edu.kosmo.today.vo.RegiGymListVO;
import edu.kosmo.today.vo.RegiGymVO;
import edu.kosmo.today.vo.TrainerVO;

public interface OwnerService {
	//티켓 목록 가져오기 회원번호를 이용하여 로그인한 회원의 구매를 가져온다
	public List<OrderListVO> getOrderList(int mnum);
	public void memberRemove(int mnum); //회원 목록삭제
	
	public List<TrainerVO> getTrainer(int gnum);//트레이너 목록보기
	public void registerTrainer(TrainerVO vo);//트레이너 등록하기
	public void updateTrainer(TrainerVO vo); //트레이너 정보수정
	public void deleteTrainer(TrainerVO vo);
	public void insertStore(RegiGymVO regigymVO); //헬스장 등록신청
	public List<RegiGymListVO> getregistList(int mnum);	//신청한 헬스장목록보기
	public void remove(int storenum);	//신청목록 삭제
	public int getGymTotal(int mnum);
	public List<GymListVO> getGym(Criteria criteria,int mnum);//헬스장 페이징

}

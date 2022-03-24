package edu.kosmo.today.service;

import java.util.List;

import edu.kosmo.today.vo.OrderListVO;
import edu.kosmo.today.vo.RegiGymListVO;
import edu.kosmo.today.vo.RegiGymVO;


public interface OwnerService {
	//티켓 목록 가져오기 회원번호를 이용하여 로그인한 회원의 구매를 가져온다
	public List<OrderListVO> getOrderList(int mnum);
	public void memberRemove(int mnum); //회원 목록삭제
	
	public void insertStore(RegiGymVO regigymVO);
	List<RegiGymListVO> getregistList();
	public void remove(int storenum);
}

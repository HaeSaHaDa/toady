package edu.kosmo.today.service;

import java.util.List;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.AuthVO;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.OrderListVO;


public interface OwnerService {
	//티켓 목록 가져오기 회원번호를 이용하여 로그인한 회원의 구매를 가져온다
	public List<OrderListVO> getOrderList(int mnum);
	public void memberRemove(int mnum); //회원 목록삭제
	
}

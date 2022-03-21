package edu.kosmo.today.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.OrderListVO;


@Mapper
public interface OwnerMapper {
	
	public List<OrderListVO> getOrderList(int mnum);  //회원번호를 이용하여 로그인한 회원의 구매관련 정보를 가져온다
	
	public void memberDelete(int mnum);               //헬스장 오너페이지 회원 탈퇴
	

}

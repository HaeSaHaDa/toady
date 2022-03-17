package edu.kosmo.today.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.OrderListVO;


@Mapper
public interface OwnerMapper {
	//티켓 목록 가져오기 회원번호를 이용하여 로그인한 회원의 구매를 가져온다
	public List<OrderListVO> getOrderList(int mnum); 
	

}

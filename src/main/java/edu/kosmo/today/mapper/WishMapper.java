package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;

/*
 * 0302 김보람 찜기능 mapper
 */

@Mapper
public interface WishMapper {

	//회원번호 가져오기
	public int getMemberNum(String memail);
	
	//찜 목록 가져오기 회원번호를 이용하여 로그인한 회원의 찜목록을 가져온다
	public List<WishVO> getWishList(int mnum); 
	//찜목록의 이용권들의 가격만 리스트로 뽑아오는 mapper
	public List<Integer> priceList(int mnum);
	  
	//찜 선택한 것 한개만 삭제하는 것
	public int deleteWishTicket(int wishNum);
	
	//찜 목록 전체 삭제
	public void deleteWishList(int mnum);
	
	//찜 수량 수정
	public void updateWishList(WishVO wish);
	
	//찜에 이용권 담기
	public void insertWish(int mnum,int tknum);
	
	//찜에 이용권이 담겼는지 확인하기
	public int checkWish(@Param("mnum")int mnum,@Param("tknum")int tknum);
	
	//찜 수량
	public void updateWish(int mnum,int tknum);

}

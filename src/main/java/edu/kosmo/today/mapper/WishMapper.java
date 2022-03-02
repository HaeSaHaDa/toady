package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

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
	  
	  

}

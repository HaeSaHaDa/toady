package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.TicketVO;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;

/*
 * 0314 이용권
 */

@Mapper
public interface OrderMapper {
	
	//구매한 이용권 확인하기
	public List<TicketVO> getTicketList(int mnum);
	
	//회원번호구하기
	public int getMemberNum(String memail);
	
	
	
}

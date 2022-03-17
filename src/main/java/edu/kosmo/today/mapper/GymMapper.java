package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.GymVO;
import edu.kosmo.today.vo.TicketVO;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;

/*
 *0310 시설페이지 (김보람)
 */

@Mapper
public interface GymMapper {

	//시설 목록 뽑기
	public List<GymVO> gymList();
	
	//시설상세화면
	public GymVO gymdetail(int gnum);
	
	//시설에 딸린 이용권 추출
	public List<TicketVO> getticket(int gnum);
	
}

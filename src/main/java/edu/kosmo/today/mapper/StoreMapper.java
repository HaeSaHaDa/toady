package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.BoardVO;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.RequestBoardVO;
import edu.kosmo.today.vo.RequestVO;

@Mapper
public interface StoreMapper { 
	
	public void registration(RequestVO requestVO);  
	public List<RequestBoardVO> getRequestList();
	
	
	
}

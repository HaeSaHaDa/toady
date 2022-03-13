package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.BoardVO;
import edu.kosmo.today.vo.MemberVO;

@Mapper
public interface BoardMapper { 
	public List<BoardVO> getList();  //게시판 전체 조회
	
	
	
}

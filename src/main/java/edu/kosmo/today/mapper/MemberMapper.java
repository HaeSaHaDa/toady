package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.UserVO;

@Mapper
public interface MemberMapper { 
	public List<MemberVO> getList();  //회원 목록 전체조회
	public MemberVO read(int mnum);   //회원 목록 상세보기
	public void delete(int mnum);      //회원 삭제
		
	public int getTotalCount();  //페이징 처리 관련
	public List<MemberVO> getListWithPaging(Criteria criteria);
	
	
}

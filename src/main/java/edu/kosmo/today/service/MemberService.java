package edu.kosmo.today.service;

import java.util.List;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.NoteVO;




public interface MemberService {
	public List<MemberVO> getList();
	public MemberVO get(int mnum);
	
	public void remove(int mnum);
		
	public int getTotal();  //페이징 처리 함수

			
	public int getUserTotalCount();  
	public int getOwnerTotalCount();  
	
	public List<MemberVO> getListPage(Criteria criteria);

	public void modify(MemberVO memberVO); 
	public void nboardRegister(NoteVO NoteVO);	
	
	
	public List<MemberVO> getOwnerList(Criteria criteria); 
	public MemberVO ownerGet(int mnum);  //관리자 페이지 헬스장 오너회원 상세보기
}

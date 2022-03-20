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
	public List<MemberVO> getListPage(Criteria criteria);
	public void modify(MemberVO memberVO); //권한 수정
	public void nboardRegister(NoteVO NoteVO); //쪽지 작성 	
}

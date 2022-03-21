package edu.kosmo.today.service;

import java.util.List;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.NoteVO;
import edu.kosmo.today.vo.UserVO;


public interface MemberService {
	public List<UserVO> getList();
	public UserVO get(int mnum);
	public void remove(int mnum);
		
	public int getTotal();  //페이징 처리 함수
	public List<UserVO> getListPage(Criteria criteria);
	public void modify(UserVO memberVO); //권한 수정
	public void nboardRegister(NoteVO NoteVO); //쪽지 작성 	
}

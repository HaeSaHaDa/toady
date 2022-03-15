package edu.kosmo.today.service;

import java.util.List;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.UserVO;

public interface MemberService {
	public List<MemberVO> getList();
	public MemberVO get(int mnum);
	public void remove(int mnum);
	
	
	
	public int getTotal();  //페이징 처리 함수
	public List<MemberVO> getList(Criteria criteria);
}

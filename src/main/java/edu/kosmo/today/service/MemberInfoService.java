package edu.kosmo.today.service;

import edu.kosmo.today.vo.MemberVO;


public interface MemberInfoService {
	public int getInfoNum(String memail);
	public MemberVO getInfoList(int mnum);	
	void memberInfoModify(MemberVO memberVO); // 회원정보 수정


	
	public void authDelete(String memail);
	public void remove(String memail); 
}

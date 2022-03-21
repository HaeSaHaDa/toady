package edu.kosmo.today.service;

import edu.kosmo.today.vo.MemberVO;


public interface MemberInfoService {
	public int getInfoNum(String memail);
	public MemberVO getInfoList(int mnum);	
	void memberInfoModify(MemberVO memberVO); // 회원정보 수정
	
	public void authDelete(String memail);//권한 삭제
	public void remove(String memail); // 회원정보 탈퇴	
}

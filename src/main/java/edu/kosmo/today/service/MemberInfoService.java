package edu.kosmo.today.service;

import edu.kosmo.today.vo.MemberVO;


public interface MemberInfoService {
	public int getInfoNum(String mid);
	public MemberVO getInfoList(int mnum);	
	void memberInfoModify(MemberVO memberVO); // 회원정보 수정

	
	public void authDelete(String mid);//권한 삭제
	public void remove(String mid); // 회원정보 탈퇴	
}

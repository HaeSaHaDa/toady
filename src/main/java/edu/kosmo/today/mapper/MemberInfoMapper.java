package edu.kosmo.today.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.MemberVO;

@Mapper
public interface MemberInfoMapper { 
	

	public int getMemberInfoNum(String memail);  //이메일을 통해 회원번호 가져오기
	public MemberVO getMemberInfoList(int mnum); //회원 정보 조회, 회원번호를 이용해서 로그인한 회원의 정보를 가져온다
	void memberInfoUpdate(MemberVO memberVO); // 닉네임 수정


	
	public void authDelete(String mid);//권한 삭제
	public void delete(String mid); // 회원 탈퇴
	//public void authDelete(String memail);//마이페이지에서 회원탈퇴를 위한 권한 삭제
	//public void delete(String memail); // 회원탈퇴
}

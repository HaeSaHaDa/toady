package edu.kosmo.today.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.UserVO;


@Mapper
public interface MemberInfoMapper { 
	
	public int getMemberInfoNum(String memail);  //회원번호 가져오기
	public UserVO getMemberInfoList(int mnum); //회원 정보 조회, 회원번호를 이용해서 로그인한 회원의 정보를 가져온다
	void memberInfoUpdate(UserVO memberVO); // 닉네임 수정
	
	public void authDelete(String memail);//권한 삭제
	public void delete(String memail); // 회원 탈퇴
}

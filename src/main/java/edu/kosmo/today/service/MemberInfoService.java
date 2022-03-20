package edu.kosmo.today.service;

<<<<<<< HEAD
import edu.kosmo.today.vo.MemberVO;


public interface MemberInfoService {
	public int getInfoNum(String mid);
	public MemberVO getInfoList(int mnum);	
	void memberInfoModify(MemberVO memberVO); // 회원정보 수정
=======
import edu.kosmo.today.vo.UserVO;


public interface MemberInfoService {
	public int getInfoNum(String memail);
	public UserVO getInfoList(int mnum);	
	void memberInfoModify(UserVO memberVO); // 회원정보 수정
>>>>>>> 44c3f050df83ab8f9b078ff5e96e8d90ea7b9370
	
	public void authDelete(String mid);//권한 삭제
	public void remove(String mid); // 회원정보 탈퇴	
}

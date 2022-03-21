package edu.kosmo.today.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.NoteVO;
import edu.kosmo.today.vo.OrderVO;


@Mapper
public interface MemberMapper {

	public List<MemberVO> getList(); //관리자 페이지 회원목록 조회 

	public MemberVO read(int mnum);  //관리자 페이지 회원목록 상세보기

	public void delete(int mnum);    //관리자 페이지 회원 탈퇴

	public int getUserTotalCount();  //관리자 페이지 일반 회원목록 페이징 처리를 위한 총 개수 구하기
	
	public int getOwnerTotalCount();  //관리자 페이지 헬스장 오너 회원목록 페이징 처리를 위한 총 개수 구하기

	public List<MemberVO> getListPage(Criteria criteria); //관리자 페이지 회원목록 페이징 처리

	void update(MemberVO memberVO);   //관리자 페이지 회원구분 수정

	public void nboardinsert(NoteVO noteVO);  //쪽지 작성
	
	public List<MemberVO> getOwnerListPage(Criteria criteria); //관리자 페이지 헬스장 오너 목록조회 
	
	public MemberVO ownerRead(int mnum);  //관리자 페이지 헬스장 오너회원 상세보기
	
	
	
}

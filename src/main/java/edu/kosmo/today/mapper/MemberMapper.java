package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.page.Criteria;
<<<<<<< HEAD
import edu.kosmo.today.vo.MemberVO;
=======
>>>>>>> 44c3f050df83ab8f9b078ff5e96e8d90ea7b9370
import edu.kosmo.today.vo.NoteVO;
import edu.kosmo.today.vo.UserVO;

@Mapper
public interface MemberMapper {

	public List<UserVO> getList(); // 회원 목록 전체조회

	public UserVO read(int mnum); // 회원 목록 상세보기

	public void delete(int mnum); // 회원 삭제

	public int getTotalCount(); // 페이징 처리 관련

	public List<UserVO> getListPage(Criteria criteria);


	void update(UserVO memberVO); // 권한 수정

	public void nboardinsert(NoteVO noteVO);//// 쪽지 작성


}

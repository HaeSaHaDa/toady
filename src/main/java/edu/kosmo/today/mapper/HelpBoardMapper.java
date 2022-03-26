package edu.kosmo.today.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.NoteVO;
import edu.kosmo.today.vo.OrderVO;


@Mapper
public interface HelpBoardMapper {

	public int getBoardMemberNum(String memail); // 회원 번호 가져오기
	public List<NoteVO> getBoardList(int mnum);  //1:1 문의 목록 가져오기, 회원번호를 이용하여 로그인한 회원의 1:1 문의 목록을 가져온다
	public MemberVO HelpBoardMemberRead(int mnum);  //1:1문의 페이지 진입 후 회원 정보 불러오기
	

	public void hboardinsert(NoteVO noteVO);  //1:1문의 작성
	
	public List<NoteVO> getHelpBoardPage(Criteria criteria);//1:1문의 페이지
	public int getHelpBoardTotalCount(); //1:1문의 처리를 위한 페이징
	

}

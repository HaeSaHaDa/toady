package edu.kosmo.today.service;

import java.util.List;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.AuthVO;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.NoteVO;


public interface HelpBoardService {
	public int getBoardMemberNum(String memail); // 회원 번호 가져오기
	public List<NoteVO> getBoardList(int mnum);
}

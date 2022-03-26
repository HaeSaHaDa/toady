package edu.kosmo.today.service;

import java.util.List;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.EventVO;
import edu.kosmo.today.vo.NoteVO;

public interface EventService {

	public int getTotal();// 총 갯수구하기

	public List<NoteVO> getNoticeboardList(Criteria cri);// 공지 리스트 가져오기

	public List<NoteVO> getEventboardList(Criteria cri);// 이벤트 리스트 가져오기

	
	public void insertNoticeboard(NoteVO vo);// notice작성

	public int getMemberNum(String memail);// 회원번호 구하기

	public NoteVO getContent(int bid);// notice글보기

	public void updateBoard(NoteVO noteVO);//글 업데이트

	public void deleteBoard(int bid);// 글 삭제
}

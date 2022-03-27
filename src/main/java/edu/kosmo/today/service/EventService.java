package edu.kosmo.today.service;

import java.util.List;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.NoteVO;

public interface EventService {
	
	public int getTotal();// 총 갯수구하기
	
	public List<NoteVO> getNoticeboardList(Criteria cri);// 리스트 가져오기
	
	public void insertNoticeboard(NoteVO vo);//notice작성
	
	public int getMemberNum(String memail);//회원번호 구하기
	
	public NoteVO getContent(int bid);//notice글보기
}

package edu.kosmo.today.service;

import java.util.List;

import edu.kosmo.today.vo.NoteVO;

public interface NoteService {
	
	public int getMemberNum(String memail);
	
	public List<NoteVO> getNoteList(int mnum); //쪽지 목록 가져오기 회원번호를 이용하여 로그인한 회원의 쪽지목록을 가져온다
}

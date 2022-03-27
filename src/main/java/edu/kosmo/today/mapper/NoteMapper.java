package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.NoteVO;

@Mapper
public interface NoteMapper { 
		
	public int getMemberNum(String memail);     //회원번호 가져오기
	
	public List<NoteVO> getNoteList(int mnum);  //쪽지목록 가져오기 회원번호를 이용하여 로그인한 회원의 쪽지목록을 가져온다
}

package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.NoteVO;


@Mapper
public interface HelpBoardMapper {

	public int getBoardMemberNum(String memail); // 회원 번호 가져오기
	public List<NoteVO> getBoardList(int mnum);  //1:1 문의 목록 가져오기, 회원번호를 이용하여 로그인한 회원의 1:1 문의 목록을 가져온다
	
	

}

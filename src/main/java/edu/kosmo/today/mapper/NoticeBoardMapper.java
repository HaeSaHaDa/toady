package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.EventVO;
import edu.kosmo.today.vo.NoteVO;


@Mapper
public interface NoticeBoardMapper {
   
   //회원번호 가져오기
   public int getMemberNum(String memail); 

   //글 갯수(페이징)
   public int getTotal(); 
   
   //글 목록
   public List<NoteVO> getNoticeboardList(Criteria criteria);

   public List<NoteVO> getEventboardList(Criteria cri);// 이벤트 리스트 가져오기

   
   //작성
   public void insertNoteBoard(NoteVO vo); 
   
   //글보기
   public NoteVO getContent(int bid); 
   
   //글 업데이트
   public void updateBoard(NoteVO noteVO);
   
   //글 삭제
   public void deleteBoard(int bid);

}
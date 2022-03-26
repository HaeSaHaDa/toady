package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.NoticeBoardMapper;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.EventVO;
import edu.kosmo.today.vo.NoteVO;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@Service
public class EventServiceImpl implements EventService{

   @Autowired
   private NoticeBoardMapper mapper;

   // 총 갯수구하기
   @Override
   public int getTotal() {
      log.info("noticeList 게시판 총 갯수구하는 중");

      return mapper.getTotal();

   }

   // 리스트 가져오기
   @Override
   public List<NoteVO> getNoticeboardList(Criteria cri){
      log.info("noticeList게시판 목록 뽑는중..");
      
      return mapper.getNoticeboardList(cri);
   }
   
   @Override
   public List<NoteVO> getEventboardList(Criteria cri){
      log.info("noticeList게시판 목록 뽑는중..");
      
      return mapper.getEventboardList(cri);
   }
   
   //notice작성
   @Override
   public void insertNoticeboard(NoteVO vo) {
      log.info("noticeList입력중..");

      mapper.insertNoteBoard(vo);
   }

   //회원번호 구하기
   @Override
   public int getMemberNum(String memail) {
      log.info("회원번호 구하기");
      
      return mapper.getMemberNum(memail);
   }
   
   //notice글보기
   @Override
   public NoteVO getContent(int bid){
      log.info("noticeList글보기");
      
      NoteVO notice = mapper.getContent(bid);
      
      return notice;
      
   }
   
   //notice업데이트
   @Override
   public void updateBoard(NoteVO noteVO){
      log.info("noticeList 글 업데이트");
      
      mapper.updateBoard(noteVO);
      
      
   }
   
   //notice글보기
   @Override
   public void deleteBoard(int bid){
      log.info("noticeList 글 삭제");
      
      mapper.deleteBoard(bid);
      
      
   }
}
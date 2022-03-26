package edu.kosmo.today.cotroller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.EventService;
import edu.kosmo.today.vo.EventVO;
import edu.kosmo.today.vo.NoteVO;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class EventBoardController {

	@Autowired
	private EventService eventService;

	//유저 이벤트/공지 리스트
	@GetMapping("/user/eventBoard")
	public ModelAndView getEventList(Criteria cri, ModelAndView mav) {

		System.out.println("eventboardlist");
		log.info("eventList() ..");
		log.info("Criteria" + cri);

		mav.addObject("noteList", eventService.getNoticeboardList(cri));

		log.info("noteList(cri)" + eventService.getNoticeboardList(cri));

		int total = eventService.getTotal();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.setViewName("user/eventBoardList");

		return mav;
	}
	//공지 이벤트게시판 글읽기
	@GetMapping("/user/eventBoardView")
	public ModelAndView UnoticeBoardView(int bid,ModelAndView mav) {
		log.info("eventBoardView()..");
		
		NoteVO noteVO = new NoteVO();
		
		noteVO=eventService.getContent(bid);
		
		mav.addObject("getBoard",noteVO);
		mav.setViewName("user/eventBoardView");
		
		
		return mav;
	}
	
	
	
	//관리자 공지/이벤트 리스트
	@GetMapping("/admin/eventBoard") 
	public ModelAndView getnoticeList(Criteria cri, ModelAndView mav) {
		  
		System.out.println("noticeboardlist"); log.info("noteList() ..");
		log.info("Criteria" + cri);
		  
		mav.addObject("noteList", eventService.getNoticeboardList(cri));
		  
		log.info("noteList(cri)" + eventService.getNoticeboardList(cri));
				  
		int total = eventService.getTotal(); log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.setViewName("admin/eventBoardList");
		  
		return mav;
	}
	//해당 게시물 글 보기	  
	@GetMapping("/admin/eventBoardView/{bid}")
	public ModelAndView adminEventBoardView(@PathVariable int bid,ModelAndView mav) {
		log.info("adminEventBoardView()..");
		
		NoteVO noteVO = new NoteVO();
		
		noteVO=eventService.getContent(bid);
		
		mav.addObject("getBoard",noteVO);
		mav.setViewName("admin/eventBoardView");

				
		return mav;
	}
	//게시글 쓰는 페이지 이동
	@GetMapping("/admin/adminWriteBoardView")
	public ModelAndView adminwriteBoard(ModelAndView mav) {
		log.info("adminwriteBoardView()..");

		mav.setViewName("admin/adminWriteBoardView");
				
		return mav;
	}
	//글 작성
	@RequestMapping(value = "/admin/WriteEventBoard", method = RequestMethod.POST)
	public String writeEventBoard(NoteVO noteVO) {
		System.out.println("여기서 확인하겠다 " );
		log.info("========noteVO : " + noteVO);

		eventService.insertNoticeboard(noteVO);
		
		return "redirect:/admin/eventBoard";
	}
	//글 업데이트
	@RequestMapping(value = "/admin/updateEventBoard", method = RequestMethod.POST)
	public String updateEventBoard(NoteVO noteVO) {
		System.out.println("여기서 확인하겠다 " );
		System.out.println("도대체 뭐가 가나?? " +  noteVO);
		eventService.updateBoard(noteVO);
		
		return "redirect:/admin/eventBoard";
	}
	//글 삭제
	@RequestMapping(value = "/admin/deleteEventBoard/{bid}", method = RequestMethod.GET)
	public String deleteEventBoard(@PathVariable int bid) {
		System.out.println("여기서 확인하겠다 " );
		log.info("========bid : " + bid);

		eventService.deleteBoard(bid);
		
		return "redirect:/admin/eventBoard";
	}	
}

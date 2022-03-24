package edu.kosmo.today.cotroller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.service.HelpBoardService;
import edu.kosmo.today.service.MemberService;
import edu.kosmo.today.service.NoteService;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.NoteVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
@RequestMapping("/user/")
public class HelpBoardController {
	
	@Autowired HelpBoardService helpBoardService;
	
	//1:1 문의 페이지 진입
	@GetMapping("/helpBoard")
	public ModelAndView noteList(ModelAndView mav) {
		log.info("1:1 문의 페이지 진입");
	
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
		int mnum = helpBoardService.getBoardMemberNum(member.getUsername()); // 회원 번호 가져오기	
		
		//List<NoteVO> noteVO = noteService.getNoteList(mnum); // 1:1 문의 목록 가져오기
		List<NoteVO> boardVO = helpBoardService.getBoardList(mnum); // 1:1 문의 목록 가져오기
	
		System.out.println("회원번호는" + mnum);		
		mav.setViewName("/user/helpBoard");
		//mav.addObject("noteList", noteService.getNoteList(mnum));
		mav.addObject("helpBoardList", helpBoardService.getBoardList(mnum));
	
		return mav;		
	}
	
	// 1:1 문의 남기기 페이지 진입
		@GetMapping("/helpBoardPost/{mnum}")
		public ModelAndView notePostList(MemberVO memberVO, ModelAndView mav) {
			log.info("1:1 문의 남기기 페이지 진입");

			mav.setViewName("/user/helpBoardPost");
			
			//mav.addObject("notePostList", memberService.get(memberVO.getMnum()));
			//log.info("memberService :" + memberService.get(memberVO.getMnum()));
			return mav;
		}
		
}

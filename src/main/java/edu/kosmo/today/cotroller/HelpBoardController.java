package edu.kosmo.today.cotroller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
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

	@Autowired
	HelpBoardService helpBoardService;

	/*
	 1:1 문의 페이지 진입 + 페이징
	@GetMapping("/helpBoard")
	public ModelAndView noteList(ModelAndView mav, Criteria cri) {
		log.info("1:1 문의 페이지 진입");

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = helpBoardService.getBoardMemberNum(member.getUsername()); // 회원 번호 가져오기
		// List<NoteVO> noteVO = noteService.getNoteList(mnum); // 1:1 문의 목록 가져오기
		List<NoteVO> boardVO = helpBoardService.getBoardList(mnum); // 1:1 문의 목록 가져오기

		// mav.addObject("helpReplyList", memberService.getHelpListPage(cri));

		System.out.println("회원번호는" + mnum);
		mav.setViewName("/user/helpBoard");
		mav.addObject("helpBoardList", helpBoardService.getBoardList(mnum));

		return mav;
	}
	
	*/
	
	@GetMapping("/helpBoard")
	public ModelAndView noteList(ModelAndView mav, Criteria cri) {
		log.info("1:1 문의 페이지 진입");

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = helpBoardService.getBoardMemberNum(member.getUsername()); // 회원 번호 가져오기
		
		List<NoteVO> boardVO = helpBoardService.getBoardList(mnum); // 1:1 문의 목록 가져오기

		System.out.println("회원번호는" + mnum);
		mav.setViewName("/user/helpBoard");
		mav.addObject("helpBoardList", helpBoardService.getHelpBoardPage(cri));

		int total = helpBoardService.getHelpBoardTotalCount();
		
		mav.addObject("pageMaker", new PageVO(cri, total));
		return mav;
	}

	

	// 1:1 문의 남기기 페이지 진입
	@GetMapping("/helpBoardPost/{mnum}")
	public ModelAndView notePostList(MemberVO memberVO, ModelAndView mav) {
		log.info("1:1 문의 남기기 페이지 진입");

		mav.setViewName("/user/helpBoardPost");

		mav.addObject("HelpMemberList", helpBoardService.HelpBoardMemberRead(memberVO.getMnum()));
		return mav;
	}

	// 1:1문의 남기기 (insert)
	@PostMapping("/helpBoardPost")
	public ModelAndView notePost(NoteVO noteVO, ModelAndView mav) {
		log.info("helpBoardPost()..");
		log.info("NoteVO:" + noteVO);

		helpBoardService.hboardRegister(noteVO);

		// helpBoardService.hboardReplyInsert(NoteVO);
		// memberService.nboardRegister(NoteVO);
		mav.setViewName("/common/home");

		return mav;
	}

}

package edu.kosmo.today.cotroller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.HelpBoardService;
import edu.kosmo.today.service.MemberService;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.NoteVO;
import edu.kosmo.today.vo.TicketVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private MemberService memberService;
	private HelpBoardService helpBoardService;

	/*
	 * @GetMapping("/manageMember") public ModelAndView memberList(ModelAndView mav)
	 * { log.info("memberList()");
	 * 
	 * mav.setViewName("/admin/manageMember"); mav.addObject("memberList",
	 * memberService.getList()); return mav; }
	 */

	// 페이징 + 관리자페이지 회원조회
	@GetMapping("/manageMember")
	public ModelAndView getListPage(Criteria cri, ModelAndView mav) {

		System.out.println("pageList");
		log.info("pagelist() ..");
		log.info("Criteria" + cri);

		mav.setViewName("/admin/manageMember");
		mav.addObject("memberList", memberService.getListPage(cri));

		log.info("memberService.getList(cri)" + memberService.getListPage(cri));

		int total = memberService.getUserTotalCount();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		return mav;
	}

	// 관리자페이지 회원삭제
	@DeleteMapping("/manageMember/{mnum}")
	public ResponseEntity<String> delete(MemberVO memberVO, Model model) {
		ResponseEntity<String> entity = null;
		log.info("delete()..");

		try {
			memberService.remove(memberVO.getMnum());

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// 관리자페이지 회원 상세보기
	@GetMapping("/manageMember/{mnum}")
	public ModelAndView memberDetail(MemberVO memberVO, ModelAndView mav) {

		log.info("memberDetail()..");

		// UserCustomDetails member = (UserCustomDetails)
		// SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// int mnum = memberService.getMemberNum(member.getUsername());

		// memberService.getTicketList();

		mav.setViewName("/admin/manageMemberView");
		mav.addObject("memberDetail", memberService.get(memberVO.getMnum()));

		log.info("memberService :" + memberService.get(memberVO.getMnum()));

		return mav;
	}

	// 관리자페이지 회원구분 수정 ex(ROLE_USER -> ROLE_BUSINESS)
	@PutMapping("/manageMember/{memail}")
	public ResponseEntity<String> authUpdate(@RequestBody MemberVO memberVO, Model model) {

		ResponseEntity<String> entity = null;
		log.info("authUpdate.. memberVO" + memberVO);

		try {
			memberService.modify(memberVO);
			// 수정 성공하면 성공 상태메시지 저장
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// 업데이트가 실패하면 실패 상태메시지 저장
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 업데이트처리 HTTP 상태 메시지 리턴
		return entity;

	}

	// 관리자페이지 쪽지 작성 페이지 진입
	@GetMapping("/notePost/{mnum}")
	public ModelAndView notePostList(MemberVO memberVO, ModelAndView mav) {
		log.info("notePostList..()");

		mav.setViewName("/admin/notePost");
		mav.addObject("notePostList", memberService.get(memberVO.getMnum()));

		log.info("memberService :" + memberService.get(memberVO.getMnum()));
		return mav;
	}

	// 관리자페이지 쪽지 작성(발송)
	@PostMapping("/notePost")
	public ModelAndView notePost(NoteVO NoteVO, ModelAndView mav) {
		log.info("notePost()..");
		log.info("NoteVO:" + NoteVO);

		memberService.nboardRegister(NoteVO);
		mav.setViewName("/common/home");

		return mav;
	}

	// 페이징 + 관리자페이지 헬스장 오너 회원조회
	@GetMapping("/ownerList")
	public ModelAndView getOwnerListPage(Criteria cri, ModelAndView mav) {

		System.out.println("ownerPageList");
		log.info("ownerPageList() ..");
		log.info("Criteria" + cri);

		mav.setViewName("/admin/ownerList");
		// mav.addObject("ownerMemberList", memberService.getListPage(cri));
		mav.addObject("ownerMemberList", memberService.getOwnerList(cri));

		// log.info("memberService.getList(cri)" + memberService.getListPage(cri));

		int total = memberService.getOwnerTotalCount();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		return mav;
	}

	// 관리자페이지 헬스장오너 회원 상세보기
	@GetMapping("/ownerList/{mnum}")
	public ModelAndView ownerMemberDetail(MemberVO memberVO, ModelAndView mav) {

		log.info("ownerMemberDetail()..");

		mav.setViewName("/admin/ownerListView");
		// mav.addObject("ownerMemberDetail", memberService.get(memberVO.getMnum()));
		mav.addObject("ownerMemberDetail", memberService.ownerGet(memberVO.getMnum()));

		log.info("memberService :" + memberService.get(memberVO.getMnum()));

		return mav;
	}

	// 관리자페이지 헬스장 오너 회원구분 수정 ex(ROLE_USER -> ROLE_BUSINESS)
	@PutMapping("/ownerList/{memail}")
	public ResponseEntity<String> ownerAuthUpdate(@RequestBody MemberVO memberVO, Model model) {

		ResponseEntity<String> entity = null;

		try {
			memberService.modify(memberVO);
			// 수정 성공하면 성공 상태메시지 저장
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// 업데이트가 실패하면 실패 상태메시지 저장
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 업데이트처리 HTTP 상태 메시지 리턴
		return entity;

	}
	
	
	//1:1문의 조회 페이지 진입 + 페이징
	@GetMapping("/helpList")
	public ModelAndView helpList(ModelAndView mav, Criteria cri) {
		log.info("1:1 문의 페이지 진입");
			
		
		mav.setViewName("/admin/helpList");
		mav.addObject("helpReplyList", memberService.getHelpListPage(cri));
		memberService.readReplyList();
				
		int total = memberService.getHelpListTotalCount();
		
		mav.addObject("pageMaker", new PageVO(cri, total));
	
		return mav;		
	}
	
	//답변 페이지 진입
	@GetMapping("/helpReview")
	public ModelAndView helpReview(NoteVO noteVO, ModelAndView mav) {
		
	
		log.info("1:1 문의 답변 페이지 진입");
		mav.addObject("helpReplyView", memberService.readReplyListView(noteVO.getBid()));
		
		log.info("helpReplyView : " + memberService.readReplyListView(noteVO.getBid())); 	
		mav.setViewName("/admin/helpReview");
		return mav;	
		
	}
	
	
	//답변
	@PostMapping("/reply")
	public ModelAndView reply(NoteVO noteVO, ModelAndView mav) {
		
		log.info("reply() ..");
		log.info("noteVO : " + noteVO);
		memberService.readReplyListView(noteVO.getBid());
		mav.addObject("helpReplyList", memberService.readReplyList());
			
		memberService.insertReply(noteVO);
		mav.setViewName("redirect:/admin/helpList");
		
		return mav;
		
	}
	
}

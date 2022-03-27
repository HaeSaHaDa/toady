package edu.kosmo.today.cotroller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.FaqService;
import edu.kosmo.today.service.GymService;
import edu.kosmo.today.service.HelpBoardService;
import edu.kosmo.today.service.MemberService;
import edu.kosmo.today.service.OrderService;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.NoteVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private FaqService faqService;
	
	@Autowired
	private HelpBoardService helpBoardService;


	/*
	 * @GetMapping("/manageMember") public ModelAndView memberList(ModelAndView mav)
	 * { log.info("memberList()");
	 * 
	 * mav.setViewName("/admin/manageMember"); mav.addObject("memberList",
	 * memberService.getList()); return mav; }
	 */


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
	public ModelAndView memberDetail(MemberVO memberVO,Criteria criteria ,ModelAndView mav) {

		log.info("memberDetail()..");
		System.out.println("mid는 무엇인가???" + memberVO.getMnum());
		int mnum = Integer.valueOf(memberVO.getMnum());
		// UserCustomDetails member = (UserCustomDetails).
		// SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// int mnum = memberService.getMemberNum(member.getUsername());

		// memberService.getTicketList();

		System.out.println(memberVO.getMnum() + "의 이용권 가져오는 중");
		int total = orderService.getTotal(mnum);
		log.info("total:..." + total);
	
		mav.addObject("myTicket", orderService.getTicketList2(criteria, mnum));	
		
		mav.addObject("pageMaker", new PageVO(criteria, total));
		
		mav.addObject("memberDetail", memberService.get(mnum));
		
		
		System.out.println("===================" + orderService.getTicketList2(criteria, mnum));
		
		mav.setViewName("/admin/manageMemberView");
		
		log.info("memberService :=======================" + memberService.get(mnum));

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



	// FAQ목록
	@GetMapping("/faqpage")
	public ModelAndView getFaqList(Criteria cri, ModelAndView mav) {

		System.out.println("faqList");
		log.info("faqList() ..");
		log.info("Criteria" + cri);

		mav.setViewName("/admin/faqWriterView");
		mav.addObject("faqList", faqService.getFaqList(cri));

		log.info("faqList(cri)" + faqService.getFaqList(cri));

		int total = faqService.getTotal();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		return mav;
	}

	// FAQ글 입력
	@RequestMapping(value = "/insertfaq", method = RequestMethod.POST)
	public ResponseEntity<String> insertFaq(@RequestBody FaqVO faq) {
		System.out.println("faq입력중");
		ResponseEntity<String> entity = null;

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = faqService.getMemberNum(member.getUsername());

		log.info("insertFaq..." + faq);

		try {
			faq.setMnum(mnum);
			faqService.insertFaq(faq);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// FAQ글보기
	@RequestMapping(value = "/faqpage/{bid}", method = RequestMethod.POST)
	public FaqVO getFaqContent(@PathVariable("bid") int bid) {
		System.out.println("faq글보기");
		FaqVO vo = faqService.getContent(bid);		
		
		return vo;
	}
	
	@Autowired
	private OrderService orderService;
	
	//환불요청 및 리뷰삭제 요청보기
	@GetMapping("/requestpr")
	public ModelAndView getRequetList(Criteria cri,ModelAndView mav) {
		log.info("환불/리뷰삭제요청 목록뽑아내는중");
		
		mav.setViewName("/admin/requsetPR");
		mav.addObject("requsetList",orderService.requestList(cri) );

		log.info("requsetList(cri)" + orderService.requestList(cri));

		int total = orderService.totalRequest();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));
		
		return mav;
	}
	
	@Autowired
	private GymService gymService;
	
	//리뷰목록보기
	@GetMapping("/manageReivew")
	public ModelAndView manageReview(ModelAndView mav,Criteria cri) {
		System.out.println("관리자 리뷰목록");		
		
		
		mav.setViewName("/admin/helpReview");
		mav.addObject("reviewList",gymService.reviewList(cri));
		
		int total = gymService.getTotal2();
		log.info("리뷰갯수는.."+total);
		
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("totalReiew",total);
		
		return mav;

	}
	
	//리뷰삭제하기
	@RequestMapping("/deleteReview/{bid}")
	@ResponseBody
	public ResponseEntity<String> deleteWish(@PathVariable("bid") String bid) {
		ResponseEntity<String> entity = null;
		System.out.println("리뷰삭제중..." + bid + ">>리뷰번호");
		int bnum = Integer.parseInt(bid);

		try {
			gymService.deleteReview(bnum);
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}

		return entity;
	}
	
	
	// 페이징 + 관리자페이지 헬스장 오너 회원조회
	@GetMapping("/ownerList")
	public ModelAndView getOwnerListPage(Criteria cri, ModelAndView mav) {

		System.out.println("ownerPageList");
		log.info("ownerPageList() ..");
		log.info("Criteria" + cri);

		mav.setViewName("/admin/ownerList");
		//mav.addObject("ownerMemberList", memberService.getListPage(cri));
		mav.addObject("ownerMemberList", memberService.getOwnerList(cri));

		//log.info("memberService.getList(cri)" + memberService.getListPage(cri));
		
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
			//mav.addObject("ownerMemberDetail", memberService.get(memberVO.getMnum()));
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
		
		@GetMapping("/registListView")
		public ModelAndView registlist(ModelAndView mv) {
				
		log.info("->owner Controller...");
		log.info("->registlist()...");
				
		mv.addObject("registList",gymService.getregistList_admin());
		mv.setViewName("/admin/registListView");	
		
		return mv;
		}	 
		
		//등록 신청 삭제
		@RequestMapping(value="/deleteRegister/{storenum}", method=RequestMethod.GET)
		public ResponseEntity<String> deleteRegister(@PathVariable("storenum")String storenum){
			log.info("탑니까?-1");
			ResponseEntity<String> entity = null;
			int storenum1 = Integer.valueOf(storenum);
			try {
				log.info("탑니까?-s2");
				gymService.registRemove_admin(storenum1);
				// 삭제가 성공하면 성공 상태메시지 저장
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				log.info("탑니까?-3");
				e.printStackTrace();
				// 댓글 삭제가 실패하면 실패 상태메시지 저장
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			// 삭제 처리 HTTP 상태 메시지 리턴
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
		@GetMapping("/adminReview")
		public ModelAndView adminReview(NoteVO noteVO, ModelAndView mav) {
			
		
			log.info("1:1 문의 답변 페이지 진입");
			mav.addObject("helpReplyView", memberService.readReplyListView(noteVO.getBid()));
			
			log.info("helpReplyView : " + memberService.readReplyListView(noteVO.getBid())); 	
			mav.setViewName("/admin/adminReview");
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

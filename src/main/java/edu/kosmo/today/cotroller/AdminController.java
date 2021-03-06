package edu.kosmo.today.cotroller;


import java.util.List;

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
import edu.kosmo.today.vo.GymListVO;
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

	// ????????? + ?????????????????? ????????????
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


	// ?????????????????? ????????????
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


	// ?????????????????? ?????? ????????????
	@GetMapping("/manageMember/{mnum}")
	public ModelAndView memberDetail(MemberVO memberVO,Criteria criteria ,ModelAndView mav) {

		log.info("memberDetail()..");
		System.out.println("mid??? ???????????????" + memberVO.getMnum());
		int mnum = Integer.valueOf(memberVO.getMnum());
		// UserCustomDetails member = (UserCustomDetails).
		// SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// int mnum = memberService.getMemberNum(member.getUsername());

		// memberService.getTicketList();

		System.out.println(memberVO.getMnum() + "??? ????????? ???????????? ???");
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


	// ?????????????????? ???????????? ?????? ex(ROLE_USER -> ROLE_BUSINESS)
	@PutMapping("/manageMember/{mid}")
	public ResponseEntity<String> authUpdate(@RequestBody MemberVO memberVO, Model model) {

		ResponseEntity<String> entity = null;
		log.info("authUpdate.. memberVO" + memberVO);

		try {
			memberService.modify(memberVO);
			// ?????? ???????????? ?????? ??????????????? ??????
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// ??????????????? ???????????? ?????? ??????????????? ??????
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// ?????????????????? HTTP ?????? ????????? ??????
		return entity;

	}
	// ?????????????????? ????????? ?????? ???????????? ?????? ex(ROLE_USER -> ROLE_BUSINESS)
	@PutMapping("/ownerList/{mid}")
	public ResponseEntity<String> ownerAuthUpdate(@RequestBody MemberVO memberVO, Model model) {

		ResponseEntity<String> entity = null;
		
		try {
			memberService.modify(memberVO);
			// ?????? ???????????? ?????? ??????????????? ??????
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// ??????????????? ???????????? ?????? ??????????????? ??????
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// ?????????????????? HTTP ?????? ????????? ??????
		return entity;

	}
	
	// ?????????????????? ?????? ?????? ????????? ??????
	@GetMapping("/notePost/{mnum}")
	public ModelAndView notePostList(MemberVO memberVO, ModelAndView mav) {
		log.info("notePostList..()");

		mav.setViewName("/admin/notePost");
		mav.addObject("notePostList", memberService.get(memberVO.getMnum()));

		log.info("memberService :" + memberService.get(memberVO.getMnum()));
		return mav;
	}

	// ?????????????????? ?????? ??????(??????)
	@PostMapping("/notePost")
	public ModelAndView notePost(NoteVO NoteVO, ModelAndView mav) {
		log.info("notePost()..");
		log.info("NoteVO:" + NoteVO);
		
		memberService.nboardRegister(NoteVO);	
		mav.setViewName("/common/home");
			
		return mav;		
	}	



	// FAQ??????
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

	// FAQ??? ??????
	@RequestMapping(value = "/insertfaq", method = RequestMethod.POST)
	public ResponseEntity<String> insertFaq(@RequestBody FaqVO faq) {
		System.out.println("faq?????????");
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

	// FAQ?????????
	@RequestMapping(value = "/faqpage/{bid}", method = RequestMethod.POST)
	public FaqVO getFaqContent(@PathVariable("bid") int bid) {
		System.out.println("faq?????????");
		FaqVO vo = faqService.getContent(bid);		
		
		return vo;
	}
	
	@Autowired
	private OrderService orderService;
	
	//???????????? ??? ???????????? ????????????
	@GetMapping("/requestpr")
	public ModelAndView getRequetList(Criteria cri,ModelAndView mav) {
		log.info("??????/?????????????????? ?????????????????????");
		
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
	
	//??????????????????
	@GetMapping("/manageReivew")
	public ModelAndView manageReview(ModelAndView mav,Criteria cri) {
		System.out.println("????????? ????????????");		
		
		
		mav.setViewName("/admin/helpReview");
		mav.addObject("reviewList",gymService.reviewList(cri));
		
		int total = gymService.getTotal2();
		log.info("???????????????.."+total);
		
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("totalReiew",total);
		
		return mav;

	}
	
	//??????????????????
	@RequestMapping("/deleteReview/{bid}")
	@ResponseBody
	public ResponseEntity<String> deleteWish(@PathVariable("bid") String bid) {
		ResponseEntity<String> entity = null;
		System.out.println("???????????????..." + bid + ">>????????????");
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
	
	
	// ????????? + ?????????????????? ????????? ?????? ????????????
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
	
	// ?????????????????? ??????????????? ?????? ????????????
		@GetMapping("/ownerList/{mnum}")
		public ModelAndView ownerMemberDetail(MemberVO memberVO, ModelAndView mav) {

			log.info("ownerMemberDetail()..");

			mav.setViewName("/admin/ownerListView");
			//mav.addObject("ownerMemberDetail", memberService.get(memberVO.getMnum()));
			mav.addObject("ownerMemberDetail", memberService.ownerGet(memberVO.getMnum()));
			
			log.info("memberService :" + memberService.get(memberVO.getMnum()));

			return mav;
		}
		

		
		//?????? ?????? ???
		@GetMapping("/registListView")
		public ModelAndView registlist(ModelAndView mv) {
				
		log.info("->owner Controller...");
		log.info("->registlist()...");
				
		mv.addObject("registList",gymService.getregistList_admin());
		mv.setViewName("/admin/registListView");	
		
		return mv;
		}	 
		
		//?????? ?????? ??????
		@RequestMapping(value="/deleteRegister/{storenum}", method=RequestMethod.GET)
		public ResponseEntity<String> deleteRegister(@PathVariable("storenum")String storenum){
			log.info("??????????-1");
			ResponseEntity<String> entity = null;
			int storenum1 = Integer.valueOf(storenum);
			try {
				log.info("??????????-s2");
				gymService.registRemove_admin(storenum1);
				// ????????? ???????????? ?????? ??????????????? ??????
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				log.info("??????????-3");
				e.printStackTrace();
				// ?????? ????????? ???????????? ?????? ??????????????? ??????
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			// ?????? ?????? HTTP ?????? ????????? ??????
			return entity;
		}
		
		//1:1?????? ?????? ????????? ?????? + ?????????
		@GetMapping("/helpList")
		public ModelAndView helpList(ModelAndView mav, Criteria cri) {
			log.info("1:1 ?????? ????????? ??????");
				
			
			mav.setViewName("/admin/helpList");
			mav.addObject("helpReplyList", memberService.getHelpListPage(cri));
			memberService.readReplyList();
					
			int total = memberService.getHelpListTotalCount();
			
			mav.addObject("pageMaker", new PageVO(cri, total));
		
			return mav;		
		}
		
		//?????? ????????? ??????
		@GetMapping("/adminReview")
		public ModelAndView adminReview(NoteVO noteVO, ModelAndView mav) {
			
		
			log.info("1:1 ?????? ?????? ????????? ??????");
			mav.addObject("helpReplyView", memberService.readReplyListView(noteVO.getBid()));
			
			log.info("helpReplyView : " + memberService.readReplyListView(noteVO.getBid())); 	
			mav.setViewName("/admin/adminReview");
			return mav;	
			
		}
		
		
		//??????
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

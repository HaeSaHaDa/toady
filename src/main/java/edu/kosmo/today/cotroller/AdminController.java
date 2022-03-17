package edu.kosmo.today.cotroller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.FaqService;
import edu.kosmo.today.service.MemberService;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private FaqService faqService;

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

		int total = memberService.getTotal();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		return mav;
	}

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

	@GetMapping("/manageMember/{mnum}")
	public ModelAndView memberDetail(MemberVO memberVO, ModelAndView mav) {

		log.info("memberDetail()..");

		mav.setViewName("/admin/manageMemberView");
		mav.addObject("memberDetail", memberService.get(memberVO.getMnum()));

		log.info("memberService :" + memberService.get(memberVO.getMnum()));

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

}

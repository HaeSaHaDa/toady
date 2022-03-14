package edu.kosmo.today.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.PrincipalDetail;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.FaqService;
import edu.kosmo.today.service.OrderService;
import edu.kosmo.today.service.TicketService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {
	
	@Autowired
	private FaqService service;
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/common/signup")
	public String joinForm() {
		System.out.println("user컨트롤러 - signup");
		return "common/signUp";
	}
	@GetMapping("/common/login")
	public String loginForm() {
		System.out.println("user컨트롤러 - login");
		return "common/login";
	}
	
	@GetMapping("/user/myTicket")
	public ModelAndView mypage(ModelAndView mav) {
		System.out.println("마이페이지 이동중...");
		PrincipalDetail member = (PrincipalDetail) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		
		mav.setViewName("/user/myTicket");
		mav.addObject("ticket",orderService.getTicketList(member.getUsername()));
		
		return mav;
	}
	
	@GetMapping("/user/faqboard")
	public ModelAndView faqBoardList(ModelAndView mav,Criteria cri) {
		log.info("FAQ보는 중");
		
		mav.setViewName("/user/faqBoard");
		mav.addObject("faqList", service.getFaqList(cri));
		
		int total = service.getTotal();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));
		
		return mav;
	}
}

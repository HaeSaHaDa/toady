package edu.kosmo.today.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.FaqService;
import edu.kosmo.today.service.OrderService;
import edu.kosmo.today.userservice.UserService;
import edu.kosmo.today.vo.OrderVO;
import edu.kosmo.today.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	FaqService faqService;
	
	@Autowired
	OrderService orderService;

	@Autowired
	private AuthenticationManager authenticationManager;

	@GetMapping("/common/signup")
	public String joinForm() {
		return "common/signUp";
	}

	@GetMapping("/common/login")
	public String loginForm() {
		System.out.println("user컨트롤러 - login");
		return "common/login";
	}

	@GetMapping("/user/memberupdate")
	public String memberInfo(UserVO user) {
		System.out.println(user.getMnum());
		System.out.println("user컨트롤러 - login");
		return "user/memberupdate";
	}

	@GetMapping("/user/updatePassword")
	public String updatePassword() {
		System.out.println("user컨트롤러 - login");
		return "user/updatePassword";
	}

	// FAQ목록
	@GetMapping("/user/faqboard")
	public ModelAndView getFaqList(Criteria cri, ModelAndView mav) {

		System.out.println("faqList");
		log.info("faqList() ..");
		log.info("Criteria" + cri);

		mav.setViewName("/user/faqBoard");
		mav.addObject("faqList", faqService.getFaqList(cri));

		log.info("faqList(cri)" + faqService.getFaqList(cri));

		int total = faqService.getTotal();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		return mav;
	}
	
	//내 이용권 조회
	@GetMapping("/user/myTicket")
	public ModelAndView getTicketList(ModelAndView mav) {
		
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		
		System.out.println(member.getUsername()+"의 이용권 가져오는 중");
		
		
		
		mav.setViewName("/user/myTicket");
		mav.addObject("myTicket", orderService.getTicketList(member.getUsername()));
		
		return mav;
	}
	
}

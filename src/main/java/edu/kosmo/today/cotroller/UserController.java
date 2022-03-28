package edu.kosmo.today.cotroller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetailService;
import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.Criteria2;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.page.PageVO2;
import edu.kosmo.today.service.FaqService;
import edu.kosmo.today.service.OrderService;
import edu.kosmo.today.userservice.UserService;
import edu.kosmo.today.vo.ReviewVO;
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
	@GetMapping("/common/faqboard")
	public ModelAndView getFaqList(Criteria cri, ModelAndView mav) {

		System.out.println("faqList");
		log.info("faqList() ..");
		log.info("Criteria" + cri);

		mav.addObject("faqList", faqService.getFaqList(cri));

		log.info("faqList(cri)" + faqService.getFaqList(cri));

		int total = faqService.getTotal();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.setViewName("/common/faqBoard");

		return mav;
	}

	// 내 이용권 조회
	@GetMapping("/user/myTicket")
	public ModelAndView getTicketList(Criteria2 criteria, ModelAndView mav) {

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		System.out.println(member.getUsername() + "의 이용권 가져오는 중");
		int total = orderService.getTotal(member.getUsername());
		log.info("total:..." + total);

		mav.setViewName("/user/myTicket");
		mav.addObject("myTicket", orderService.getTicketList(criteria, member.getUsername()));

		mav.addObject("pageMaker", new PageVO2(criteria, total));

		return mav;
	}

	// 리뷰작성
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	public ResponseEntity<String> insertReivew(@RequestBody ReviewVO vo) {
		System.out.println("Reivew입력중");
		ResponseEntity<String> entity = null;

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = faqService.getMemberNum(member.getUsername());
		System.out.println("회원번호..." + mnum);

		log.info("insert review.." + vo);

		try {
			vo.setMnum(mnum);

			int success = orderService.insertReivew(vo);

			if (success == 0) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("already", HttpStatus.OK);
			}

		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "idcheck";
	}

	@RequestMapping(value = "/common/idcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(UserVO user) throws Exception {
		log.info("idCheck: " + user.getMid());
		Map<String, Object> map = new HashMap<String, Object>();

		/* 테스트를 위해 임의로 false를 대입했습니다. */
		boolean flag;
		UserVO user2s = userService.findUser(user.getMid());
		if (user2s != null) {
			flag = true;
		} else {
			flag = false;
		}

		/*
		 * 중복인지 아닌지 검사해 반환하는 함수를 만들어주세요. 중복확인 로직은 DAO에서 selectOne()으로 구현합니다. 이 함수는 하나라도
		 * 있으면 1, 없으면 0을 반환합니다
		 */

		map.put("flag", flag);

		return map;
	}

	// 환불신청하기
	@RequestMapping(value = "/insertBack", method = RequestMethod.POST)
	public ResponseEntity<String> insertRequestPaybak(@RequestBody Map<String, Object> data) {
		System.out.println("환불입력중..." + data);
		ResponseEntity<String> entity = null;

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = faqService.getMemberNum(member.getUsername());

		log.info("insert review.." + data);

		System.out.println("--" + data.get("payid") + "--주문번호 타입은.." + data.get("ordernum").getClass().getName());

		try {

			int check = orderService.checkRequst(mnum, (String) data.get("ordernum"), (String) data.get("tknum"));

			if (check != 0) {
				entity = new ResponseEntity<String>("already", HttpStatus.OK);

			} else {
				orderService.insertrequest((String) data.get("payid"), (String) data.get("ordernum"),
						(String) data.get("tknum"), mnum);
				entity = new ResponseEntity<String>("ok", HttpStatus.OK);
			}

		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>("notok", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}

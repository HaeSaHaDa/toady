package edu.kosmo.today.cotroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.service.CompleteService;
import edu.kosmo.today.service.WishService;
import edu.kosmo.today.vo.CompleteVO;
import edu.kosmo.today.vo.WishVO;
import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONObject;

/*
 * 찜 기능을 위한 controller 0302 작성(김보람)
 * */

@Slf4j
@Controller
public class WishController {

	@Autowired
	private WishService wishServise; // 찜 기능을 수행할 서비스
	@Autowired
	private CompleteService cservice;

	// 찜 목록을 불러오기
	@GetMapping("/user/wishlist")
	public ModelAndView wishList(ModelAndView mav) {

		log.info("wishList...controller");

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = wishServise.getMemberNum(member.getUsername());
		List<WishVO> wishlist = wishServise.getWishList(mnum);

		System.out.println("회원번호는" + mnum);

		List<Integer> cost = wishServise.getPriceWish(mnum);
		log.info("......" + cost);
		int sum = 0;

		for (Integer i : cost) {
			sum += i;
		}
		log.info("찜최종가격은" + sum);

		mav.setViewName("user/wishList");
		mav.addObject("wishList", wishlist);
		mav.addObject("wishPrice", sum);

		return mav;
	}

	// 찜에 담긴 이용권 한개만 삭제
	@DeleteMapping("/deleteWish/{wishnum}")
	@ResponseBody
	public ResponseEntity<String> deleteWish(@PathVariable("wishnum") String wishnum) {
		ResponseEntity<String> entity = null;
		System.out.println("찜 하나 삭제중..." + wishnum + ">>이용권번호");
		int wnum = Integer.parseInt(wishnum);

		try {
			wishServise.deleteWishTicket(wnum);
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}

		return entity;
	}

	// 찜목록 전체 삭제
	@GetMapping("/deletewishall")
	public String deleteWish() {
		log.info("찜목록비우는중...");

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = wishServise.getMemberNum(member.getUsername());

		wishServise.deleteWishList(mnum);

		return "redirect:/user/wishlist";
	}
	
	@RequestMapping(value = "/insertWish/{tnum}" , method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> insertWish(@PathVariable("tnum") String tnum){
		ResponseEntity<String> entity = null;
		System.out.println("이용권 찜하는중..."+tnum+">>이용권번호");
		int ticket = Integer.parseInt(tnum);

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = wishServise.getMemberNum(member.getUsername());
		try {
			wishServise.insertWish(mnum, ticket);
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}

		return entity;
	}

	// 주문하기(결제페이지로 이동)
	@GetMapping("/user/checkoutpage")
	public ModelAndView goCheckOut(ModelAndView mav) {

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = wishServise.getMemberNum(member.getUsername()); // 회원번호 구하기
		List<WishVO> wishlist = wishServise.getWishList(mnum); // 해당회원의 찜목록 불러오기

		log.info(mnum + "회원의 결제페이지로 가는중");

		mav.setViewName("user/checkOut");
		mav.addObject("checklist", wishlist);

		return mav;
	}
	@RequestMapping("/completePay")
	@ResponseBody
	public String success(HttpServletRequest request ) {
		log.info("controller - success");
		JSONObject result = new JSONObject();
				
		String  payid = request.getParameter("merchantid");
		String impid = request.getParameter("impid");
		String mnum1 = request.getParameter("mnum");
		String tamount1 = request.getParameter("tamount");
		int mnum = Integer.valueOf(mnum1);
		int tamount = Integer.valueOf(tamount1);
		
		if(tamount1 == null) {
			//결제 금액 파라미터 값이 null 일시 결제실패
			result.put("successPayment", false);
		}else if(tamount == 0){
			//결제 금액 파라미터 값이 0 일시 결제실패
			result.put("successPayment", false);
		}else {
			//그 외 결제 성공
			CompleteVO comVO = new CompleteVO();
			comVO.setOscpayid(payid);
			comVO.setOscimpid(impid);
			comVO.setMnum(mnum);
			
			cservice.successpay(comVO);
			result.put("successPayment", true);
		}
						
		log.info("*********************controller - success22");
		return result.toString(); 
	}
	@RequestMapping("/user/complete")
	public ModelAndView complete(ModelAndView mav) {
		log.info("controller - complete");
		
		mav.setViewName("/user/complete");
		
		return mav;
	}
}

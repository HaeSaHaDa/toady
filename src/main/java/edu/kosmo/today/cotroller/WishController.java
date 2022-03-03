package edu.kosmo.today.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import edu.kosmo.today.cotroller.security.principal.PrincipalDetail;
import edu.kosmo.today.service.WishService;
import edu.kosmo.today.userservice.UserService;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 찜 기능을 위한 controller 0302 작성(김보람)
 * */

@Slf4j
@Controller
public class WishController {

	@Autowired
	private WishService wishServise; // 찜 기능을 수행할 서비스

	// 찜 목록을 불러오기
	@GetMapping("/user/wishlist")
	public ModelAndView wishList(ModelAndView mav) {

		log.info("wishList...controller");

		PrincipalDetail member = (PrincipalDetail) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = wishServise.getMemberNum(member.getUsername());
		List<WishVO> wishlist = wishServise.getWishList(mnum);

		System.out.println("회원번호는" + mnum);

		mav.setViewName("user/wishList");
		mav.addObject("wishList", wishlist);

		return mav;
	}
	
	//찜에 담긴 이용권 한개만 삭제
	@DeleteMapping("/deleteWish/{wishnum}")
	@ResponseBody
	public ResponseEntity<String> deleteWish(@PathVariable("wishnum") String wishnum){
		ResponseEntity<String> entity = null;
		System.out.println("찜 하나 삭제중..."+wishnum+">>이용권번호");
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

	
	//찜목록 전체 삭제
	@DeleteMapping("/deleteWish/{wishnum}")
	@ResponseBody
	public ResponseEntity<String> deleteWishList(){
		ResponseEntity<String> entity = null;
		
		PrincipalDetail member = (PrincipalDetail) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = wishServise.getMemberNum(member.getUsername());
		
		System.out.println("찜 목록 삭제중..."+mnum+">>회원번호");
		
		try {
			wishServise.deleteWishList(mnum);
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
	
		return entity;
	}
	
	
}



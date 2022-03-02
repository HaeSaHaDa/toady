package edu.kosmo.today.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	private WishService wishServise; //찜 기능을 수행할 서비스 

	
	//찜 목록을 불러오기
	@GetMapping("/user/wishlist")
	public ModelAndView wishList(ModelAndView mav) {
	
		log.info("wishList...controller");
		
		PrincipalDetail member = (PrincipalDetail) SecurityContextHolder.getContext().getAuthentication()
		.getPrincipal();
		
		int mnum = wishServise.getMemberNum(member.getUsername());
		List<WishVO> wishlist = wishServise.getWishList(mnum);
		
		System.out.println("회원번호는"+mnum);
		
		mav.setViewName("user/wishList");
		mav.addObject("wishList", wishlist);

		
		return mav;
	}
	

	
}

package edu.kosmo.today.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.service.WishService;
import edu.kosmo.today.vo.WishVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 찜 기능을 위한 controller 0302 작성(김보람)
 * */

@Slf4j
@Controller
public class WishController {
<<<<<<< HEAD
	
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
	
/*
	@ResponseBody
	@RequestMapping(value = "/deleteWish", method = RequestMethod.POST)
	public int deleteWish()
	*/
	
	
	
	
}
/*  $('.deleteComment').on('click', function(){
//this -> 지금 클릭된 문서 객체(태그) 여기서 <input type="button" value="삭제" class="deleteComment"> 중에 클릭된 아이
//$(this) -> 그 태그를 선택 (자바스크립트 객체) 여기서 $('.deleteComment') 중에 선택된 아이
   **중요  문서객체(태그)와 자바스크립트 객체를 나타내는 this, $(this)           
                var num = $(this).attr('data_num'); 
//속성을 꺼내는 attr함수, 클릭할 때마다 기본키를 받을 수 있도록 
                console.log(num);
                
                //비동기식으로 pk값을 DB로 전달한 후 
                //삭제후 성공시 목록 재출력 
                $.ajax({
                    
                    url : "deleteComment",
                    type : "POST",
                        
                    data :{
                        num : num
                    },
                    success : function(){
                        alert("삭제했습니다.");
                        init();
                    },
                    error : function(error){
                        console.log(error);
                    }
                    
                });
                
                   @ResponseBody
    @RequestMapping(value="deleteComment", method = RequestMethod.POST)
    public void deleteComment(int num){
        System.out.println(num);
        dao.deleteComment(num);
        
    }
*/
=======

	@Autowired
	private WishService wishServise; // 찜 기능을 수행할 서비스

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
		log.info("......"+cost);
		int sum =0;
		
		for(Integer i : cost) {
			sum += i;
		}
		log.info("찜최종가격은"+sum);

		mav.setViewName("user/wishList");
		mav.addObject("wishList", wishlist);
		mav.addObject("wishPrice", sum);

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
	@GetMapping("/deletewishall")
	public String deleteWish() {
		log.info("찜목록비우는중...");

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = wishServise.getMemberNum(member.getUsername());
		
		wishServise.deleteWishList(mnum);
		
		return "redirect:/user/wishlist";
	}
	
	//주문하기
	
}


>>>>>>> 7a5f6b61d5b4f379c160769aa35470cb8a865435

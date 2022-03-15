package edu.kosmo.today.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

package edu.kosmo.today.cotroller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.service.MemberService;
import edu.kosmo.today.service.NoteService;
import edu.kosmo.today.service.OwnerService;
import edu.kosmo.today.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
@RequestMapping("/owner/")
public class OwnerController {
	
	@Autowired 
	NoteService noteService;
	OwnerService ownerService;
	
	@GetMapping("/gymMemberList") //회원 조회
	public ModelAndView gymMemberList(ModelAndView mav) {
			
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기	
		System.out.println("회원번호는" + mnum);		
		mav.setViewName("/owner/gymMemberList");
		
		mav.addObject("gymMemberList", ownerService.getOrderList(mnum));
		
		
		return mav;		
	}
	
	
		@GetMapping("/gymMemberList/{mnum}")  //회원 상세보기
		public ModelAndView ownerMemberDetail(MemberVO memberVO,ModelAndView mav) {
			
			log.info("gymMemberListDetail()..");
			UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기	
			
			mav.addObject("gymMemberListDetail", ownerService.getOrderList(mnum));
			mav.setViewName("/owner/gymMemberListDetail");
			
			return mav;
		}
		
}

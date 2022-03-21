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

	// 헬스장 오너페이지 회원목록
	@GetMapping("/gymMemberList")
	public ModelAndView gymMemberList(ModelAndView mav) {

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기
		System.out.println("회원번호는" + mnum);
		mav.setViewName("/owner/gymMemberList");

		mav.addObject("gymMemberList", ownerService.getOrderList(mnum));

		return mav;
	}

	// 헬스장 오너페이지 회원목록 상세보기
	@GetMapping("/gymMemberList/{mnum}")
	public ModelAndView gymMemberListView(MemberVO memberVO, ModelAndView mav) {

		log.info("gymMemberListView()..");
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기

		mav.addObject("gymMemberListView", ownerService.getOrderList(mnum));
		mav.setViewName("/owner/gymMemberListView");

		return mav;
	}

	
	// 헬스장 오너페이지 회원목록 삭제
	@DeleteMapping("/gymMemberList/{mnum}")
	public ResponseEntity<String> delete(MemberVO memberVO, Model model) {
		ResponseEntity<String> entity = null;
		log.info("memberdelete()..");

		try {
			
			ownerService.memberRemove(memberVO.getMnum());
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

}

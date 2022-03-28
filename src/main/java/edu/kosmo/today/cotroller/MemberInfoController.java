package edu.kosmo.today.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.service.MemberInfoService;
import edu.kosmo.today.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
@RequestMapping("/user")
public class MemberInfoController {

	@Autowired
	MemberInfoService memberInfoService;
	
	//마이페이지 내정보 페이지 진입
	@PostMapping("/memberInf") 
	public ModelAndView memberInfo(ModelAndView mav) {
		
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int mnum = memberInfoService.getInfoNum(member.getUsername()); // 회원 번호 가져오기

		System.out.println("memberInfo 회원번호 " + mnum);

		mav.setViewName("/user/memberInfo");
		mav.addObject("memberInfoList", memberInfoService.getInfoList(mnum));

		return mav;
	}
	//마이페이지 내정보 페이지 진입
	@GetMapping("/memberInf") 
	public ModelAndView memberInfoMenu(ModelAndView mav) {
		
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int mnum = memberInfoService.getInfoNum(member.getUsername()); // 회원 번호 가져오기

		System.out.println("memberInfo 회원번호 " + mnum);

		mav.setViewName("/user/memberInfo");
		mav.addObject("memberInfoList", memberInfoService.getInfoList(mnum));

		return mav;
	}


	//마이페이지 회원정보 수정하기
	//@PutMapping("/memberInfo")
	 @RequestMapping(value="/memberInfo", method=RequestMethod.PUT)
	public ResponseEntity<String> memberInfoUpdate(@RequestBody MemberVO memberVO, Model model) {

		ResponseEntity<String> entity = null;
		log.info("memberInfoUpdate().. memberVO" + memberVO);

		try {
			memberInfoService.memberInfoModify(memberVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
	//마이페이지 회원탈퇴 페이지 진입
	@GetMapping("/memberLeave")
	public ModelAndView memberLeave(ModelAndView mav) {

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int mnum = memberInfoService.getInfoNum(member.getUsername()); // 회원 번호 가져오기

		System.out.println("memberInfo 회원번호 " + mnum);

		mav.setViewName("/user/memberLeave");
		mav.addObject("memberInfoList", memberInfoService.getInfoList(mnum));

		return mav;
	}

	//마이페이지 회원탈퇴 
	@DeleteMapping("/memberLeave/{memail}")
	public ResponseEntity<String> member_delete(MemberVO memberVO,Model model) {
		ResponseEntity<String> entity = null;
		log.info("member_delete()..");

		try {
			
			memberInfoService.authDelete(memberVO.getMemail()); //회원 탈퇴를 위한 권한 삭제
			memberInfoService.remove(memberVO.getMemail());
			
			//memberService.remove(memberVO.getMnum())
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
	
	

}

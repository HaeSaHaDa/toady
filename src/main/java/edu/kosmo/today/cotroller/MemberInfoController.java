package edu.kosmo.today.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.service.MemberInfoService;
<<<<<<< HEAD
import edu.kosmo.today.vo.MemberVO;
=======
import edu.kosmo.today.vo.UserVO;
>>>>>>> b155730d4dfbed9e35a9f223def105e7685e646c
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
@RequestMapping("/user")
public class MemberInfoController {

	@Autowired
	MemberInfoService memberInfoService;

	@GetMapping("/memberInfo")
	public ModelAndView memberInfo(ModelAndView mav) {

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int mnum = memberInfoService.getInfoNum(member.getUsername()); // 회원 번호 가져오기

		System.out.println("memberInfo 회원번호 " + mnum);

		mav.setViewName("/user/memberInfo");
		mav.addObject("memberInfoList", memberInfoService.getInfoList(mnum));

		return mav;
	}

	// 회원정보 수정
	@PutMapping("/memberInfo") // @RequestBody를 사용하면 json으로 온 데이터를 객체로 자동변환해줌
	public ResponseEntity<String> memberInfoUpdate(@RequestBody UserVO memberVO, Model model) {

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
	
	@GetMapping("/memberLeave")
	public ModelAndView memberLeave(ModelAndView mav) {

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int mnum = memberInfoService.getInfoNum(member.getUsername()); // 회원 번호 가져오기

		System.out.println("memberInfo 회원번호 " + mnum);

		mav.setViewName("/user/memberLeave");
		mav.addObject("memberInfoList", memberInfoService.getInfoList(mnum));

		return mav;
	}

	
	
	@DeleteMapping("/memberLeave/{memail}")
	public ResponseEntity<String> member_delete(UserVO memberVO,Model model) {
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

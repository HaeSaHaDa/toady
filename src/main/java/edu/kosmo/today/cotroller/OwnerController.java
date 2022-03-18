package edu.kosmo.today.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.Criteria2;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.page.PageVO2;
import edu.kosmo.today.service.GymServicce;
import edu.kosmo.today.service.NoteService;
import edu.kosmo.today.service.OwnerService;
import edu.kosmo.today.vo.UserVO;
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

	@GetMapping("/gymMemberList") // 회원 조회
	public ModelAndView gymMemberList(ModelAndView mav) {

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기
		System.out.println("회원번호는" + mnum);
		mav.setViewName("/owner/gymMemberList");

		mav.addObject("gymMemberList", ownerService.getOrderList(mnum));

		return mav;
	}

	@GetMapping("/gymMemberList/{mnum}") // 회원 상세보기
	public ModelAndView ownerMemberDetail(UserVO memberVO, ModelAndView mav) {

		log.info("gymMemberListDetail()..");
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기

		mav.addObject("gymMemberListDetail", ownerService.getOrderList(mnum));
		mav.setViewName("/owner/gymMemberListDetail");

		return mav;
	}
	
	
	@Autowired
	private GymServicce gymService;
	
	//리뷰목록보기
	@GetMapping("/gymreviewlist")
	public ModelAndView ownerReviewList(Criteria cri,ModelAndView mav) {
		
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기
		int gnum = gymService.getGnum(mnum);
		
		System.out.println("시설번호.."+gnum);
		
		mav.setViewName("/owner/manageReivew");
		mav.addObject("reviewList",gymService.getReviewlist(cri, gnum));
		
		int total = gymService.getReviewTotal(gnum);
		log.info("리뷰갯수는.."+total);
		
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("totalReiew",total);
		
		return mav;
	}
	//리뷰삭제요청하기
	@RequestMapping("/deleteReview/{bid}")
	@ResponseBody
	public ResponseEntity<String> deleteWish(@PathVariable("bid")String bid) {
		ResponseEntity<String> entity = null;
		System.out.println("리뷰삭제용청중..." + bid);
		int bidnum = Integer.parseInt(bid);
		
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기

		try {
			int check = gymService.checkReqest(bidnum, mnum);
			
			if(check != 0) {
				entity = new ResponseEntity<String>("already", HttpStatus.OK);
			}else {
				gymService.deleteRequset(bidnum, mnum);
				entity = new ResponseEntity<String>("ok", HttpStatus.OK);
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}

		return entity;
	}
}

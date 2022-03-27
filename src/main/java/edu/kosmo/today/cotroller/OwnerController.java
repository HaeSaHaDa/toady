package edu.kosmo.today.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.GymService;
import edu.kosmo.today.service.NoteService;
import edu.kosmo.today.service.OwnerService;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.RegiGymListVO;
import edu.kosmo.today.vo.TrainerVO;
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
	//헬스장 신청목록 조회 페이지

	
/*	@GetMapping("/gymMemberList/{mnum}") // 회원 상세보기
	public ModelAndView ownerMemberDetail(MemberVO memberVO, ModelAndView mav) {

		log.info("gymMemberListDetail()..");
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기

		mav.addObject("gymMemberListDetail", ownerService.getOrderList(mnum));
		mav.setViewName("/owner/gymMemberListDetail");

		return mav;
	}*/

	@Autowired
	private GymService gymService;

	// 리뷰목록보기
	@GetMapping("/gymreviewlist")
	public ModelAndView ownerReviewList(Criteria cri, ModelAndView mav) {

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기
		int gnum = gymService.getGnum(mnum);

		System.out.println("시설번호.." + gnum);

		mav.setViewName("/owner/manageReivew");
		mav.addObject("reviewList", gymService.getReviewlist(cri, gnum));

		int total = gymService.getReviewTotal(gnum);
		log.info("리뷰갯수는.." + total);

		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("totalReiew", total);

		return mav;
	}

	// 리뷰삭제요청하기
	@RequestMapping("/deleteReview/{bid}")
	@ResponseBody
	public ResponseEntity<String> deleteWish(@PathVariable("bid") String bid) {
		ResponseEntity<String> entity = null;
		System.out.println("리뷰삭제용청중..." + bid);
		int bidnum = Integer.parseInt(bid);

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기

		try {
			int check = gymService.checkReqest(bidnum, mnum);

			if (check != 0) {
				entity = new ResponseEntity<String>("already", HttpStatus.OK);
			} else {
				gymService.deleteRequset(bidnum, mnum);
				entity = new ResponseEntity<String>("ok", HttpStatus.OK);
			}

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
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

	//오너의 운영 시설 목록
	@GetMapping("/manageGym/{mnum}")
	public ModelAndView getGym(ModelAndView mav, @PathVariable int mnum, Criteria criteria) {
		System.out.println("mnum은 무엇인가?" + mnum);
		int total = ownerService.getGymTotal(mnum);
		log.info("total??" + total);
		
		mav.addObject("pageMaker", new PageVO(criteria, total));
		mav.addObject("gymLists", ownerService.getGym(criteria, mnum));
		
		System.out.println("==========" + ownerService.getGym(criteria, mnum));
		
		mav.setViewName("/owner/manageGym");
		
		return mav;
		
	}
	
	

	//트레이너 목록보기
	@GetMapping("/manageTrainer")
	public ModelAndView getTrainer(ModelAndView mav) {
		System.out.println("오너-트레이너 관리목록보기");
		
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		Integer mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기
		

			Integer gnum = gymService.getGnum(mnum);

			List<TrainerVO> list = ownerService.getTrainer(gnum);
			System.out.println(mnum+"의 시설번호 구하는중");
			mav.setViewName("/owner/manageTrainer");
			mav.addObject("trainer", list);

		
		return mav;
	}
	




	
	
	//트레이너 등록
	@RequestMapping(value = "/insertTrainer", method = RequestMethod.POST)
	public ResponseEntity<String> insertTrainer(@RequestBody TrainerVO vo) {
		ResponseEntity<String> entity = null;
		System.out.println("트레이너 등록중..."+vo);
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기
		System.out.println(mnum+"의 시설번호 구하는중");
		int gnum = gymService.getGnum(mnum);
		System.out.println("......."+gnum);

		try {
			vo.setGnum(gnum);
			ownerService.registerTrainer(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/updateCareer", method = RequestMethod.POST)
	public ResponseEntity<String> updateCareer(@RequestBody TrainerVO vo) {
		ResponseEntity<String> entity = null;
		System.out.println("트레이너 등록중..."+vo);
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기
		System.out.println(mnum+"의 시설번호 구하는중");
		int gnum = gymService.getGnum(mnum);
		System.out.println("......."+gnum);

		try {
			vo.setGnum(gnum);
			ownerService.updateTrainer(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//트레이너 삭제
	@RequestMapping(value="/deleteTrainer/{gtname}" , method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> deleteTrainer(@PathVariable("gtname") String gtname,TrainerVO vo) {
		ResponseEntity<String> entity = null;
		System.out.println("찜 하나 삭제중..." + gtname + ">>이용권번호");
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기
		System.out.println(mnum+"의 시설번호 구하는중");
		int gnum = gymService.getGnum(mnum);
		System.out.println("......."+gnum);

		try {
			vo.setGnum(gnum);
			vo.setGtname(gtname);			
			ownerService.deleteTrainer(vo);
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}

		return entity;
	}	

 
	

	

}

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.GymServicce;
import edu.kosmo.today.service.NoteService;
import edu.kosmo.today.service.OwnerService;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.RegiGymVO;
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
	private GymServicce gymService;

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
	//헬스장 등록 신청 페이지
	@GetMapping("/registView")
	public ModelAndView requestView(ModelAndView mv) {
		System.out.println("owner 컨트롤러");
		
		mv.setViewName("/owner/registView");
		
		return mv;
	}
	
	//헬스장 등록 신청
	@PostMapping("/registration")
	public ModelAndView registration(ModelAndView mv,RegiGymVO regigymvo) {
		System.out.println("owner 컨트롤러");
		ownerService.insertStore(regigymvo);
		mv.setViewName("redirect:/today");
	return mv; 
	}
	//헬스장 신청목록 조회 페이지
	@GetMapping("/registListView")
	public ModelAndView registlist(ModelAndView mv) {
			
	log.info("->owner Controller...");
	log.info("->registlist()...");
			
	mv.addObject("registList",ownerService.getregistList());
	mv.setViewName("/owner/registListView");	
	
	return mv;
	}	 
	
	//@DeleteMapping("/deleteRegister/{storenum}")
	@RequestMapping(value="/deleteRegister/{storenum}", method=RequestMethod.GET)
	public ResponseEntity<String> deleteRegister(@PathVariable("storenum")String storenum){
		log.info("탑니까?-1");
		ResponseEntity<String> entity = null;
		int storenum1 = Integer.valueOf(storenum);
		try {
			log.info("탑니까?-s2");
			ownerService.remove(storenum1);
			// 삭제가 성공하면 성공 상태메시지 저장
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			log.info("탑니까?-3");
			e.printStackTrace();
			// 댓글 삭제가 실패하면 실패 상태메시지 저장
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 삭제 처리 HTTP 상태 메시지 리턴
		return entity;
	}
	
}

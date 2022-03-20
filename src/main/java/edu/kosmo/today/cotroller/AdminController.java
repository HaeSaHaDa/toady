package edu.kosmo.today.cotroller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.FaqService;
import edu.kosmo.today.service.GymListService;
import edu.kosmo.today.service.MemberService;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.GymListVO;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.NoteVO;
import edu.kosmo.today.vo.UserVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private GymListService gymListService;
	
	@RequestMapping
	public String adminPage() {
		return "admin";
	}
	
	@RequestMapping("/gymListInventory")
	public String getGymLists(Model model) {
		List<GymListVO> gymLists = gymListService.getGymLists();//getGymLists에서 직접가져와서
		model.addAttribute("gymLists", gymLists);// 추가후에 그 값을 모델에 저장함
		return "gymListInventory"; // view의 jsp name
	}
	
	@RequestMapping(value="/gymListInventory/addGymList", method=RequestMethod.GET) //getmethod
	public String addGymList(Model model) {
		
		GymListVO gymListVO =new GymListVO();
		model.addAttribute("gymListVO", gymListVO);
		return "addGymList"; //gym의 내용을 새로 입력 하는 addGymList.jsp
		
	}
	
	@RequestMapping(value="/gymListInventory/addGymList", method=RequestMethod.POST) //postmethod
	public String addGymListPost(GymListVO gymListVO, HttpServletRequest request) {
		///today_gym/src/main/resources/img
				MultipartFile gymimage = gymListVO.getGymimage();
				String rootDirectory = request.getSession().getServletContext().getRealPath("/");
				Path savePath =Paths.get(rootDirectory+"\\resources\\img\\"+gymimage.getOriginalFilename());
				
				if(gymimage.isEmpty()==false) {
					System.out.println("-------------file upload--------");
					System.out.println("imagename:"+gymimage.getName());
					System.out.println("realname:"+gymimage.getOriginalFilename());
					System.out.println("size:"+gymimage.getSize());
					System.out.println("savePath :"+savePath);
					System.out.println("-----------upload End------------");
				}
				
				
				if(gymimage != null && !gymimage.isEmpty() ) {
					try {
						gymimage.transferTo(new File(savePath.toString()));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}//디렉토리에 저장후 
				gymListVO.setImagename(gymimage.getOriginalFilename());//DB에 파일네임 
				gymListService.addGymList(gymListVO);
				//model.addAttribute("gymListVO", gymListVO); //모델에 넣어주는 작업까지이
		return "redirect:/admin/gymListInventory";
	}
	
	
	
	@RequestMapping(value="/gymListInventory/deleteGymList/{gnum}", method=RequestMethod.GET)
	public String deleteGym(@PathVariable int gnum, HttpServletRequest request) {//spring에서 gnum 자동으로 넣어줌.
		
		GymListVO gymListVO =gymListService.getGymListByGnum(gnum);//gnum을 바탕으로 가져옴. 
		//delete할 때 사진도 삭제 되어야 하므로 필요함. 
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Path savePath =Paths.get(rootDirectory+"\\resources\\img\\"+gymListVO.getImagename());
		
		if(Files.exists(savePath)) {
			try {
				Files.delete(savePath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		gymListService.deleteGymList(gnum);
		return "redirect:/admin/gymListInventory";
	}
	
	
	//gnum을 통해 해당되는 내용을 다 보여줘야하는 update
	@RequestMapping(value="/gymListInventory/updateGymList/{gnum}", method=RequestMethod.GET)
	public String updateGym(@PathVariable int gnum, Model model) {//spring에서 gnum 자동으로 넣어줌.
		
		GymListVO gymListVO =gymListService.getGymListByGnum(gnum);
		model.addAttribute("gymListVO", gymListVO);
		return "updateGymList";
	}
	
	
	@RequestMapping(value="/gymListInventory/updateGymList", method=RequestMethod.POST) //postmethod
	public String updateGymListPost(GymListVO gymListVO, HttpServletRequest request) {
		
		MultipartFile gymimage = gymListVO.getGymimage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Path savePath =Paths.get(rootDirectory+"\\resources\\img\\"+gymimage.getOriginalFilename());
		
		if(gymimage.isEmpty()==false) {
			System.out.println("-------------file upload--------");
			System.out.println("imagename:"+gymimage.getName());
			System.out.println("realname:"+gymimage.getOriginalFilename());
			System.out.println("size:"+gymimage.getSize());
			System.out.println("savePath :"+savePath);
			System.out.println("-----------upload End------------");
		}
		
		if(gymimage != null && !gymimage.isEmpty() ) {
			try {
				gymimage.transferTo(new File(savePath.toString()));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//디렉토리에 저장후 
		gymListVO.setImagename(gymimage.getOriginalFilename());//DB에 파일네임 
		
		gymListService.updateGymList(gymListVO);
		return "redirect:/admin/gymListInventory";
	}

	@Autowired
	private MemberService memberService;

	@Autowired
	private FaqService faqService;

	/*
	 * @GetMapping("/manageMember") public ModelAndView memberList(ModelAndView mav)
	 * { log.info("memberList()");
	 * 
	 * mav.setViewName("/admin/manageMember"); mav.addObject("memberList",
	 * memberService.getList()); return mav; }
	 */

	//페이징
	@GetMapping("/manageMember")
	public ModelAndView getListPage(Criteria cri, ModelAndView mav) {

		System.out.println("pageList");
		log.info("pagelist() ..");
		log.info("Criteria" + cri);

		mav.setViewName("/admin/manageMember");
		mav.addObject("memberList", memberService.getListPage(cri));

		log.info("memberService.getList(cri)" + memberService.getListPage(cri));

		int total = memberService.getTotal();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		return mav;
	}

	
	//회원 삭제
	@DeleteMapping("/manageMember/{mnum}")
	public ResponseEntity<String> delete(MemberVO memberVO, Model model) {
		ResponseEntity<String> entity = null;
		log.info("delete()..");

		try {
			memberService.remove(memberVO.getMnum());

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	//회원 상세보기
	@GetMapping("/manageMember/{mnum}")
	public ModelAndView memberDetail(MemberVO memberVO, ModelAndView mav) {

		log.info("memberDetail()..");

		mav.setViewName("/admin/manageMemberView");
		mav.addObject("memberDetail", memberService.get(memberVO.getMnum()));

		log.info("memberService :" + memberService.get(memberVO.getMnum()));

		return mav;
	}

	//회원구분 수정
	@PutMapping("/manageMember/{memail}")  //@RequestBody를 사용하면 json으로 온 데이터를 객체로 자동변환해줌
	public ResponseEntity<String> authUpdate(@RequestBody MemberVO memberVO, Model model) {
		
		ResponseEntity<String> entity = null;
		log.info("authUpdate.. memberVO" + memberVO);
		
		try {
			memberService.modify(memberVO);
			// 수정 성공하면 성공 상태메시지 저장
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// 업데이트가 실패하면 실패 상태메시지 저장
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 업데이트처리 HTTP 상태 메시지 리턴
		return entity;

	}
	
	@GetMapping("/notePost/{mnum}") //쪽지 작성 페이지 진입
	public ModelAndView notePostList(MemberVO memberVO,ModelAndView mav) {
		log.info("notePostList..()");
			
		mav.setViewName("/admin/notePost");
		mav.addObject("notePostList", memberService.get(memberVO.getMnum()));
		
		log.info("memberService :" + memberService.get(memberVO.getMnum()));
		return mav;				
	}	
	
		
	@PostMapping("/notePost")  //쪽지 작성
	public ModelAndView notePost(NoteVO NoteVO, ModelAndView mav) {
		log.info("notePost()..");
		log.info("NoteVO:" + NoteVO);
		
		memberService.nboardRegister(NoteVO);	
		mav.setViewName("/common/home");
			
		return mav;		
	}	



	// FAQ목록
	@GetMapping("/faqpage")
	public ModelAndView getFaqList(Criteria cri, ModelAndView mav) {

		System.out.println("faqList");
		log.info("faqList() ..");
		log.info("Criteria" + cri);

		mav.setViewName("/admin/faqWriterView");
		mav.addObject("faqList", faqService.getFaqList(cri));

		log.info("faqList(cri)" + faqService.getFaqList(cri));

		int total = faqService.getTotal();
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		return mav;
	}

	// FAQ글 입력
	@RequestMapping(value = "/insertfaq", method = RequestMethod.POST)
	public ResponseEntity<String> insertFaq(@RequestBody FaqVO faq) {
		System.out.println("faq입력중");
		ResponseEntity<String> entity = null;

		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		int mnum = faqService.getMemberNum(member.getUsername());

		log.info("insertFaq..." + faq);

		try {
			faq.setMnum(mnum);
			faqService.insertFaq(faq);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// FAQ글보기
	@RequestMapping(value = "/faqpage/{bid}", method = RequestMethod.POST)
	public FaqVO getFaqContent(@PathVariable("bid") int bid) {
		System.out.println("faq글보기");
		FaqVO vo = faqService.getContent(bid);		
		
		return vo;
	}

}

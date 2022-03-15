package edu.kosmo.today.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.MemberService;
import edu.kosmo.today.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
@RequestMapping("/admin/")
public class AdminController {
		
	@Autowired
	private MemberService memberService;
			
//	@GetMapping("/manageMember")
//	public ModelAndView memberList(ModelAndView mav) {
//		log.info("memberList()");
//		
//		mav.setViewName("/admin/member/manageMember");
//	mav.addObject("memberList", memberService.getList());
//
//		return mav;		
//	}
	
	@GetMapping("/manageMember")
	public ModelAndView memberList(Criteria cri, ModelAndView mav) {
		
		log.info("list() ..");
		log.info("Criteria" + cri);
		
		mav.setViewName("/admin/manageMember");
		mav.addObject("memberList", memberService.getList(cri));
		
		int total = memberService.getTotal();
		log.info("total" + total);
		mav.addObject("pageMaker",new PageVO(cri,total));
		
		return mav;
	}
	
	
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
	
	
	@GetMapping("/manageMember/{mnum}")
	public ModelAndView memberDetail(MemberVO memberVO,ModelAndView mav) {
		
		log.info("memberDetail()..");
		
		mav.setViewName("/admin/manageMemberView");
		mav.addObject("memberDetail", memberService.get(memberVO.getMnum()));
		
		log.info("memberService :" +   memberService.get(memberVO.getMnum()));
		
		return mav;
	}
	
}


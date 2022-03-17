package edu.kosmo.today.cotroller;

import java.util.List;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.MemberService;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.NoteVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
@RequestMapping("/admin/")
public class AdminController {
		
	@Autowired
	private MemberService memberService;
			
	
	/*
	@GetMapping("/manageMember")
	public ModelAndView memberList(ModelAndView mav) {
		log.info("memberList()");
		
		mav.setViewName("/admin/manageMember");
	mav.addObject("memberList", memberService.getList());
		return mav;		
	}
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
		mav.addObject("pageMaker",new PageVO(cri,total));
		
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
	public ModelAndView memberDetail(MemberVO memberVO,ModelAndView mav) {
		
		log.info("memberDetail()..");
		
		mav.setViewName("/admin/manageMemberView");
		mav.addObject("memberDetail", memberService.get(memberVO.getMnum()));
		
		log.info("memberService :" +   memberService.get(memberVO.getMnum()));
		
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
}


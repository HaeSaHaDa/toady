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
import edu.kosmo.today.service.GymService;
import edu.kosmo.today.service.NoteService;
import edu.kosmo.today.service.OwnerService;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.GymListVO;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.RegiGymListVO;
import edu.kosmo.today.vo.RegiGymVO;
import edu.kosmo.today.vo.TrainerVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
@RequestMapping("/user/")
public class OwnerRegisrController {

	@Autowired
	NoteService noteService;
	OwnerService ownerService;



	//헬스장 등록 신청 페이지
	@GetMapping("/registView")
	public ModelAndView requestView(ModelAndView mv) {
		System.out.println("owner 컨트롤러");
		
		mv.setViewName("/user/registView");
		
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
	@GetMapping("/registListView/{mnum}")
	public ModelAndView registlist(ModelAndView mv, @PathVariable int mnum) {
	System.out.println(mnum);		
	log.info("->owner Controller...");
	log.info("->registlist()...");
			
	List<RegiGymListVO> registGym = ownerService.getregistList(mnum);
	System.out.println("이 어찌 된 영문인가.???" + registGym);
	mv.addObject("registList",registGym);
	mv.setViewName("/user/registListView");	
	
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

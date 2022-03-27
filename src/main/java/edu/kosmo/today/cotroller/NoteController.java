package edu.kosmo.today.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.service.NoteService;
import edu.kosmo.today.vo.NoteVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
public class NoteController {
	
	@Autowired NoteService noteService;
	
	//쪽지 확인페이지 진입
	@GetMapping("/user/note")
	public ModelAndView noteList(ModelAndView mav) {
		log.info("noteList..");
	
		UserCustomDetails member = (UserCustomDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기	
		List<NoteVO> noteVO = noteService.getNoteList(mnum); // 쪽지 목록 가져오기
	
		System.out.println("회원번호는" + mnum);		
		mav.setViewName("/user/note");
		mav.addObject("noteList", noteService.getNoteList(mnum));
	
		return mav;		
	}
		
}

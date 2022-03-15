package edu.kosmo.today.cotroller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import edu.kosmo.today.cotroller.security.principal.PrincipalDetail;
import edu.kosmo.today.service.MemberService;
import edu.kosmo.today.service.NoteService;
import edu.kosmo.today.vo.NoteVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RestController
public class NoteController {
	
	@Autowired NoteService noteService;
	
	@GetMapping("/user/note")
	public ModelAndView noteList(ModelAndView mav) {
		log.info("noteList..");
	
		PrincipalDetail member = (PrincipalDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	
		int mnum = noteService.getMemberNum(member.getUsername()); // 회원 번호 가져오기	
		List<NoteVO> noteVO = noteService.getNoteList(mnum); // 쪽지 목록 가져오기
	
		System.out.println("회원번호는" + mnum);		
		mav.setViewName("/user/note");
		mav.addObject("noteList", noteService.getNoteList(mnum));
	
		return mav;		
	}
		
}

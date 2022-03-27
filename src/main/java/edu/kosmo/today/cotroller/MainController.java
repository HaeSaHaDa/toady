package edu.kosmo.today.cotroller;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.service.GymListService;
import edu.kosmo.today.vo.GymList;
import edu.kosmo.today.vo.GymListVO;
import edu.kosmo.today.vo.UserVO;

@Controller	
public class MainController {
	
	@Autowired
	GymListService gymListService; 
	
	@GetMapping("/today")
	public ModelAndView index(Principal principal, UserVO user , ModelAndView mav) {
		
		System.out.println("컨트롤러를 타는가?'");
		System.out.println("principal" + principal);
		List<GymListVO> gymLists =gymListService.getAdGymList();
		mav.addObject("gymAdList", gymLists);
		mav.setViewName("common/home");
		
		return mav; 
	}
	
	@GetMapping("/admin/adminPage")
	public String adminPage() {
		System.out.println("adminPage진입");
		return "admin/adminPage";
	}
	@GetMapping("/common/myPage")
	public String myPage() {
		System.out.println("myPage진입");
		return "common/myPage";
	}
	@GetMapping("/admin/notePost")
	public String notePostPage() {
		System.out.println("admin notePost진입");
		return "admin/notePost";
	}
}

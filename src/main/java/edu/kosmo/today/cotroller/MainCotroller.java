package edu.kosmo.today.cotroller;


import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import edu.kosmo.today.vo.UserVO;

@Controller	
public class MainCotroller {
		
	@GetMapping("/today")
	public String index(Principal principal, UserVO user) {

		System.out.println("컨트롤러를 타는가?'");
		System.out.println("principal" + principal);
		return "common/home"; 
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

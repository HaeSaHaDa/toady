package edu.kosmo.today.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import edu.kosmo.today.userservice.UserService;
import edu.kosmo.today.vo.UserVO;


@Controller
public class UserController {
	

	
	@Autowired
	UserService userService;
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	
	@GetMapping("/common/signup")
	public String joinForm() {
		return "common/signUp";
	}
	
	@GetMapping("/common/login")
	public String loginForm() {
		System.out.println("user컨트롤러 - login");
		return "common/login";
	}
	
	@GetMapping("/user/memberupdate")
	public String memberInfo(UserVO user) {
		System.out.println(user.getMnum());
		System.out.println("user컨트롤러 - login");
		return "user/memberupdate";
	}
	

	
	@GetMapping("/user/updatePassword")
	public String updatePassword() {
		System.out.println("user컨트롤러 - login");
		return "user/updatePassword";
	}
}

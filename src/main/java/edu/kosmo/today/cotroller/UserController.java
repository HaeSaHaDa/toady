package edu.kosmo.today.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@GetMapping("/common/signup")
	public String joinForm() {
		System.out.println("user컨트롤러 - signup");
		return "common/signUp";
	}
	@GetMapping("/common/login")
	public String loginForm() {
		System.out.println("user컨트롤러 - login");
		return "common/login";
	}
}

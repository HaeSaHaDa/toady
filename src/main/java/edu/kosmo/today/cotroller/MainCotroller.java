package edu.kosmo.today.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller	
public class MainCotroller {
	
	@GetMapping({"/today"})
	public String index() {
		System.out.println("컨트롤러를 타는가?'");


		return "common/home"; 
	}
	
}

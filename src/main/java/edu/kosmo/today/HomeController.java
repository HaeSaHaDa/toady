package edu.kosmo.today;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//22.03.02 윤정아 홈컨트롤러 임시 넣어둠 
@Controller
public class HomeController {
	
	@GetMapping("/home")
	public String home() {
		
		return "home";
	}
	@GetMapping("/index")
	public String index() {
		
		return "index";
	}
	@GetMapping("/findMap")
	public String findMap() {
		
		return "findMap";
	}
	@RequestMapping("/gymList") 
	public String gymList() {
		
		return "gymList";
	}
}
/*
 * package edu.kosmo.today.controller;
 * 
 * import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping;
 * 
 * @Controller public class HomeController {
 * 
 * static Logger logger = LoggerFactory.getLogger(HomeController.class);
 * 
 * @GetMapping("/") public String home(Model model) {
 * logger.info("info: Calling home( )"); logger.debug("Debug: Calling home( )");
 * logger.trace("trace: Calling home( )");
 * model.addAttribute("message","hello Today Gym"); 
 * return "index";
 * 
 * }
 * 
 * }
 */

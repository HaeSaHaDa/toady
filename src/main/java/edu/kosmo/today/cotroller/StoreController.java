package edu.kosmo.today.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kosmo.today.service.BoardService;
import edu.kosmo.today.service.StoreService;
import edu.kosmo.today.vo.RequestVO;
import lombok.Getter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StoreController {

	@Autowired
	private StoreService storeservice;

	@GetMapping("/store/requestView")
	public String requestView() {
		System.out.println("store컨트롤러");
		/* storeservice.insertStore(storeVO); */

		return "/store/requestView";
	}
	
	 @PostMapping("/store/registration")
	 public String registration(RequestVO requestVO) {
		 System.out.println("store/registration 컨트롤러");
	 storeservice.insertStore(requestVO);
	 
	 return "redirect:/today"; 
	 }
	@GetMapping("/store/registlist")
	public String list(Model model) {
			
	log.info("->Controller...");
	log.info("->list()...");
			
	model.addAttribute("registList",storeservice.getList());
			
	return "/store/registListView";
	}	 
	 
	 

}

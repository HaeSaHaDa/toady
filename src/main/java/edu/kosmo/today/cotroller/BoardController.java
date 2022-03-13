package edu.kosmo.today.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import edu.kosmo.today.service.BoardService;

@Controller	
public class BoardController {
	
	@Autowired
	private BoardService boardservice;
	
	@GetMapping("/board")
	public String boardList(Model model) {	
		System.out.println("컨트롤러");

		return "admin/board"; 
	}
	

	
	
	
}

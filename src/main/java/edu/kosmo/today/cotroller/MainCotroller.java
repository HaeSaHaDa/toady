package edu.kosmo.today.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainCotroller {

	@GetMapping({ "/today" })
	public String index() {
		System.out.println("컨트롤러를 타는가?'");

		return "common/home";
	}

}

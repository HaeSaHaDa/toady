package edu.kosmo.today.cotroller.api;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MapApiController {

	@GetMapping("/common/findMap")
	public String findMap() {

		return "common/findMap";
	}

}

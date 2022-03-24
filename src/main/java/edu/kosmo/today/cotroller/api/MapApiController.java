package edu.kosmo.today.cotroller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kosmo.today.service.GymServicce;
import edu.kosmo.today.vo.GymVO;


@Controller
public class MapApiController {

	@Autowired
	private GymServicce service;
	
	@GetMapping("/common/findMap")
	public String findMap() {

		return "common/findMap";
	}
	

	
	
	@PostMapping("/getAddres")
	@ResponseBody
	public List<GymVO> adressList(){
		System.out.println("위치정보 받는중");
		
		List<GymVO> list = service.getAdress();
		
		System.out.println(list+".......");
		
		return list;
	}

}

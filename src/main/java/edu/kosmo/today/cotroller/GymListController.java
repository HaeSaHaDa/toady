package edu.kosmo.today.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kosmo.today.service.GymListService;
import edu.kosmo.today.vo.GymListVO;

@Controller
public class GymListController { //con->ser->dao
	@Autowired
	private GymListService gymListService;
	
	@RequestMapping("/gymLists")
	public String getGymLists(Model model) {
		
		List<GymListVO> gymLists =gymListService.getGymLists();
		model.addAttribute("gymLists", gymLists);
		return "gymLists";
		
	}
	
	@RequestMapping("/viewGym/{gnum}")
	public String ViewGym(@PathVariable int gnum, Model model) {
		
		GymListVO gymListVO =gymListService.getGymListByGnum(gnum);
		model.addAttribute("gymListVO", gymListVO);
		
		return "viewGym";
	}

}

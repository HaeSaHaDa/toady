package edu.kosmo.today.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.service.GymListService;
import edu.kosmo.today.vo.GymListVO;

@Controller
public class GymListController { //con->ser->dao
	@Autowired
	private GymListService gymListService;
	
/*	//@RequestMapping("/gymLists")
	@RequestMapping(value="/common/gymLists", method=RequestMethod.GET)
	public ModelAndView getGymLists(Model model, ModelAndView mav) {
		
		List<GymListVO> gymLists =gymListService.getGymLists();
		mav.addObject("gymLists", gymLists);
		mav.setViewName("/common/gymLists");
		return mav;
		
	}*/
/*
	//@RequestMapping("/viewGym/{gnum}")
	@RequestMapping(value="/common/gymdetail/{gnum}", method=RequestMethod.POST)
	public String viewGym(@PathVariable int gnum, Model model) {
		
		GymListVO gymListVO =gymListService.getGymListByGnum(gnum);
		model.addAttribute("gymListVO", gymListVO);
		
		return "common/gymdetail";
	}
*/
	@RequestMapping(value="/common/search", method=RequestMethod.POST)
	public String search(Criteria cri, GymListVO gymListVO, Model model) {
		System.out.println("검색어 : " + gymListVO.getKeyword());
		String keyword = '%' + gymListVO.getKeyword()+'%';
		List<GymListVO> search = gymListService.search(keyword);
		model.addAttribute("gymLists", search);
		
		return "common/searchGymLists";
	}
}

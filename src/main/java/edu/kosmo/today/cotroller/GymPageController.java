package edu.kosmo.today.cotroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;

import edu.kosmo.today.page.Criteria2;
import edu.kosmo.today.page.PageVO2;
import edu.kosmo.today.service.GymServicce;
import edu.kosmo.today.service.WishService;
import edu.kosmo.today.userservice.UserService;
import edu.kosmo.today.vo.GymVO;
import edu.kosmo.today.vo.TicketVO;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 시설기능을 위한 작성(김보람) 03-10
 * */

@Slf4j
@Controller
public class GymPageController {
	
	@Autowired
	private GymServicce service;

	//시설목록으로 가기
	@GetMapping("/common/gymlist")
	public ModelAndView gymList(ModelAndView mav) {
		log.info("시설목록으로 들어가는 중");

		List<GymVO> list = service.gymList();
		
		mav.setViewName("/common/gymList");
		mav.addObject("gymList", list);
		
		return mav;
	}
	
	//시설 상세 페이지 보기
	@GetMapping("/common/gymdetail/{gnum}")
	public ModelAndView gymDetailPage(ModelAndView mav,GymVO vo,Criteria2 cri){
		log.info("시설 상세페이지로 가는 중");
		
		mav.setViewName("/common/gymDetail");
		mav.addObject("gym", service.gympage(vo.getGnum()));
		mav.addObject("ticketList", service.getTicketList(vo.getGnum()));
		
		System.out.println("리뷰불러오는 중");
		int total = service.getReviewTotal(vo.getGnum());
		log.info("리뷰갯수는.."+total);
		mav.addObject("gymReview",service.getReview(cri, vo.getGnum()));
		mav.addObject("pageMaker", new PageVO2(cri, total));
		mav.addObject("totalReiew",total);
		
		System.out.println("별점 평균구하는 중");
		
		List<Integer> starList = service.getStarAvg(vo.getGnum());
		log.info("......................" + starList);
		int sum = 0;
		
		for (Integer i : starList) {
			sum += i;
		}
		log.info(sum+"...");
		
		double starAvg = ((double)sum/total);
		
		log.info("별점평균은..."+starAvg);
		
		mav.addObject("gymstar",Math.round(starAvg));
		mav.addObject("gymstar2", (int)starAvg);
		
		return mav;
	}
	
	
		
}

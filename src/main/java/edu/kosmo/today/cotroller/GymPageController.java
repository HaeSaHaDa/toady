package edu.kosmo.today.cotroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.Criteria2;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.page.PageVO2;
import edu.kosmo.today.service.GymServicce;
import edu.kosmo.today.vo.GymVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 시설기능을 위한 작성(김보람) 03-10
 * */

@Slf4j
@Controller
public class GymPageController {

	@Autowired
	private GymServicce service;

	// 시설목록으로 가기
	@GetMapping("/common/gymlist")
	public ModelAndView gymList(Criteria cri, ModelAndView mav) {
		log.info("시설목록으로 들어가는 중");

		List<GymVO> list = service.gymList(cri);

		mav.setViewName("/common/gymList");
		mav.addObject("gymList", list);

		int total = service.getGymTotal();
		log.info("리뷰갯수는.." + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		return mav;
	}

	// 시설 상세 페이지 보기
	@GetMapping("/common/gymdetail/{gnum}")
	public ModelAndView gymDetailPage(ModelAndView mav, GymVO vo, Criteria2 cri) {
		log.info("시설 상세페이지로 가는 중");

		mav.setViewName("/common/gymDetail");
		mav.addObject("gym", service.gympage(vo.getGnum()));
		mav.addObject("ticketList", service.getTicketList(vo.getGnum()));

		System.out.println("리뷰불러오는 중");
		int total = service.getReviewTotal(vo.getGnum());
		log.info("리뷰갯수는.." + total);
		mav.addObject("gymReview", service.getReview(cri, vo.getGnum()));
		mav.addObject("pageMaker", new PageVO2(cri, total));
		mav.addObject("totalReiew", total);

		System.out.println("별점 평균구하는 중");

		List<Integer> starList = service.getStarAvg(vo.getGnum());
		log.info("......................" + starList);
		int sum = 0;

		for (Integer i : starList) {
			sum += i;
		}
		log.info(sum + "...");

		double starAvg = ((double) sum / total);

		log.info("별점평균은..." + starAvg);

		mav.addObject("gymstar", Math.round(starAvg));
		mav.addObject("gymstar2", (int) starAvg);
		
		//시설 트레이너 리스트
		mav.addObject("trainer",service.getTrainerList(vo.getGnum()));

		return mav;
	}

}

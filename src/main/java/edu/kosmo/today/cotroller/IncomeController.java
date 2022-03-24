package edu.kosmo.today.cotroller;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.kosmo.today.service.IncomeService;
import edu.kosmo.today.vo.GymListVO;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.OrderVO;
import lombok.Setter;
import lombok.extern.java.Log;

@Controller
@Log
public class IncomeController {

	
	@Setter(onMethod_=@Autowired)
	private IncomeService service;

	@RequestMapping(value = "/admin/totalSales", method = RequestMethod.GET)
	public String dateIncome(Locale locale, Model model) {
		System.out.println("데이트 인컴");
		return "admin/totalSales";

	}

	

	@RequestMapping(value = "weekendList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String incomeList(Locale locale, Model model) {

		Gson gson = new Gson();

		List<OrderVO> list = service.getWeekendIncome();

		System.out.println("주간 매출 데이터");

		return gson.toJson(list);

	}
	
	@RequestMapping(value = "MonthList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String incomeMonthList(Locale locale, Model model) {

		Gson gson = new Gson();

		List<OrderVO> list2 = service.getMonthIncome();

		System.out.println("월간 매출 데이터");

		return gson.toJson(list2);

	}
	 
	@RequestMapping(value = "/owner/totalSales_gym/{mnum}", method = RequestMethod.GET)
	public String gymDateIncome(Locale locale, Model model, MemberVO member) {
		System.out.println("멤버 넘버는 " + member.getMnum());
		List<GymListVO> gym = service.getGnum(member.getMnum());
		System.out.println("헬스장 넘버는 " + gym);
		model.addAttribute("gym", gym);
		System.out.println("데이트 인컴");
		return "owner/totalSales_gym";

	}
	@GetMapping(value = "/gymweekend/{gnum}")
	@ResponseBody
	public String gymWeekend(Locale locale, Model model,@PathVariable int gnum) {
		System.out.println("헬스장 넘버는 " + gnum);
		Gson gson = new Gson();

		List<OrderVO> list = service.getGymWeekend(gnum);

		System.out.println("Gym 주간 매출 데이터");

		return gson.toJson(list);

	}
	@GetMapping(value = "/gymmonth/{gnum}")
	@ResponseBody
	public  String gymMonth(Locale locale, Model model,@PathVariable int gnum) {
		System.out.println("헬스장 넘버는 " + gnum);

		Gson gson = new Gson();

		List<OrderVO> list = service.getGymMonth(gnum);

		System.out.println("Gym 월간 매출 데이터");

		return gson.toJson(list);

	}

}

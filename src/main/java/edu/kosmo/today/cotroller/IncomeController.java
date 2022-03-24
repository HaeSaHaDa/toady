package edu.kosmo.today.cotroller;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.kosmo.today.service.IncomeService;
import edu.kosmo.today.vo.OrderVO;
import lombok.Setter;
import lombok.extern.java.Log;

@Controller
@Log
public class IncomeController {

	

	private static final Logger logger = LoggerFactory.getLogger(IncomeController.class);



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
	 
	@RequestMapping(value = "/owner/totalSales_gym", method = RequestMethod.GET)
	public String gymDateIncome(Locale locale, Model model) {
		System.out.println("데이트 인컴");
		return "owner/totalSales_gym";

	}

	

}

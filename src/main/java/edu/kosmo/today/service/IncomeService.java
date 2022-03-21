package edu.kosmo.today.service;

import java.util.List;

import edu.kosmo.today.vo.OrderVO;

public interface IncomeService {
	public List<OrderVO> getWeekendIncome();
	public List<OrderVO> getMonthIncome();

}

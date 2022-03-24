package edu.kosmo.today.service;

import java.util.List;

import edu.kosmo.today.vo.GymListVO;
import edu.kosmo.today.vo.OrderVO;

public interface IncomeService {
	public List<OrderVO> getWeekendIncome();
	public List<OrderVO> getMonthIncome();
	public List<GymListVO> getGnum(int mnum);
	public List<OrderVO> getGymWeekend(int gnum);
	public List<OrderVO> getGymMonth(int gnum);

}

package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.GymListVO;
import edu.kosmo.today.vo.OrderVO;
@Mapper
public interface IncomeMapper {
	public List<OrderVO> getWeekendIncome();
	public List<OrderVO> getMonthIncome();


	public List<OrderVO> gymWeekend(int gnum);
	public List<OrderVO> gymMonth(int gnum);

	public List<GymListVO> getGnum(int mnum);
}

package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.OrderVO;
@Mapper
public interface IncomeMapper {
	public List<OrderVO> getWeekendIncome();
	public List<OrderVO> getMonthIncome();
<<<<<<< HEAD
	public List<OrderVO> getMember();
	public List<OrderVO> getGymWeekend();
	public List<OrderVO> getGymMonth();
=======

	public List<OrderVO> gymWeekend();
	public List<OrderVO> gymMonth();

>>>>>>> dev_okh_jsp

}

package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.OrderVO;
@Mapper
public interface IncomeMapper {
	public List<OrderVO> getWeekendIncome();
	public List<OrderVO> getMonthIncome();
<<<<<<< HEAD
<<<<<<< HEAD
	public List<OrderVO> getMember();
	public List<OrderVO> getGymWeekend();
	public List<OrderVO> getGymMonth();
=======
=======
>>>>>>> 3d965d4262a93c1b95d2c88ebcd70fde3e844579

	public List<OrderVO> gymWeekend();
	public List<OrderVO> gymMonth();

<<<<<<< HEAD
>>>>>>> dev_okh_jsp
=======
>>>>>>> 3d965d4262a93c1b95d2c88ebcd70fde3e844579

}

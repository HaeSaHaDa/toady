package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.IncomeMapper;
import edu.kosmo.today.vo.GymListVO;
import edu.kosmo.today.vo.OrderVO;
import lombok.Setter;
import lombok.extern.java.Log;

@Service
@Log
public class IncomeServiceImpl implements IncomeService {

	

	@Setter(onMethod_=@Autowired)
	private IncomeMapper mapper;

	

	@Override
	public List<OrderVO> getWeekendIncome() {

		

		return mapper.getWeekendIncome();

	}


	@Override
	public List<OrderVO> getMonthIncome() {

		

		return mapper.getMonthIncome();

	}




	@Override
	public List<OrderVO> getGymWeekend(int gnum) {
		// TODO Auto-generated method stub
		return mapper.gymWeekend(gnum);
	}


	@Override
	public List<OrderVO> getGymMonth(int gnum) {
		// TODO Auto-generated method stub
		return mapper.gymMonth(gnum);
	}


	@Override
	public List<GymListVO> getGnum(int mnum) {
		System.out.println("IncomMapper- Gnum 구하기");
		return mapper.getGnum(mnum);
	}


}


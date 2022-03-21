package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.IncomeMapper;
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


}


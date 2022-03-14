package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.today.mapper.OrderMapper;
import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.mapper.WishMapper;
import edu.kosmo.today.vo.TicketVO;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 찜기능을 위한 Service작성 0302(김보람)
 * */

@Slf4j
@Service
public class OrderService {

	@Autowired
	private OrderMapper mapper;
	
	//이용권 조회하기
	public List<TicketVO> getTicketList(String mid){
		System.out.println(mid+"의 이용권 조회하는 중");
		
		int mnum = mapper.getMemberNum(mid);
		
		List<TicketVO> list = mapper.getTicketList(mnum);
		
		return list;		
	}
	
	

}

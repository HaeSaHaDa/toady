package edu.kosmo.today.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.mapper.WishMapper;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 찜기능을 위한 Service작성 0302(김보람)
 * */

@Slf4j
@Service
public class WishService {
	  
	@Autowired
	private WishMapper mapper; //찜기능을 위한 mapper
	
	public int getMemberNum(String memail) {
		log.info("getMemberNum" + memail +"의 회원번호 가져오는 중");
		
		return mapper.getMemberNum(memail);
	}
	
	public List<WishVO> getWishList(int mnum){
		log.info("getWishList...");
		log.info(mnum+"의 찜목록을 불러오는중");
		
		List<WishVO> list = mapper.getWishList(mnum);
		
		return list;
	}
	
	//찜 이용권 삭제 서비스
	@Transactional
	public int deleteWishTicket(int wishNum) {
		log.info(wishNum+"번의 이용권 삭제중");
		
		return mapper.deleteWishTicket(wishNum);
	}

}

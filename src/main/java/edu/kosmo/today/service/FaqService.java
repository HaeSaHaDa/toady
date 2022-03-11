package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.today.mapper.FaqMapper;
import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.mapper.WishMapper;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;
import lombok.extern.slf4j.Slf4j;

/*
 * faq게시판 0311 김보람
 * */

@Slf4j
@Service
public class FaqService {

	@Autowired
	private FaqMapper mapper;

	// 총 갯수구하기
	public int getTotal() {
		log.info("faq게시판 총 갯수구하는 중");

		return mapper.getTotal();

	}

	// 리스트 가져오기
	public List<FaqVO> getFaqList(Criteria cri){
		log.info("faq게시판 목록 뽑는중..");
		
		return mapper.faqList(cri);
	}

}

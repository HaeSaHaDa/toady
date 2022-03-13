package edu.kosmo.today.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.BoardVO;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.RequestBoardVO;
import edu.kosmo.today.vo.RequestVO;
@Service
public interface StoreService {
	
	public void insertStore(RequestVO requestVO);
	List<RequestBoardVO> getList();

}

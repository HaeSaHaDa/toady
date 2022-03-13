package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.BoardMapper;
import edu.kosmo.today.mapper.StoreMapper;
import edu.kosmo.today.vo.BoardVO;
import edu.kosmo.today.vo.RequestBoardVO;
import edu.kosmo.today.vo.RequestVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	private StoreMapper storemapper;

	@Override
	public void insertStore(RequestVO requestVO) {
		storemapper.registration(requestVO);
		log.info("storeservice");
		
	}

	@Override
	public List<RequestBoardVO> getList() {
		
		return storemapper.getRequestList();
	}


}

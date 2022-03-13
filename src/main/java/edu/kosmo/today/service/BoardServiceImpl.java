package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.kosmo.today.mapper.BoardMapper;
import edu.kosmo.today.vo.BoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getList(){
		log.info("service :: getList()..");
		return boardMapper.getList();
	}

}

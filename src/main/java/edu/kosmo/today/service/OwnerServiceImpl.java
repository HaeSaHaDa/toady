package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.OwnerMapper;
import edu.kosmo.today.vo.OrderListVO;
import edu.kosmo.today.vo.TrainerVO;
import lombok.extern.slf4j.Slf4j;

// 스프링 부트에서는 log4j가 아니라 @Slf4j 사용한다. 개선된 버전
@Slf4j
@Service
public class OwnerServiceImpl implements OwnerService{
	
	@Autowired
	private OwnerMapper ownerMapper ;

	@Override
	public List<OrderListVO> getOrderList(int mnum) {
		return ownerMapper.getOrderList(mnum);
	}

	@Override
	public void memberRemove(int mnum) {
		ownerMapper.memberDelete(mnum);
		
	}

	@Override
	public List<TrainerVO> getTrainer(int gnum) {
		System.out.println("트레이너 목록가져오는 중 - 오너");
		
		List<TrainerVO> list = ownerMapper.getTrainer(gnum);
		
		return list;
	}

	@Override
	public void registerTrainer(TrainerVO vo) {
		System.out.println("트레이너 등록중--"+vo);
		
		ownerMapper.insertTrainer(vo);		
	}			
}

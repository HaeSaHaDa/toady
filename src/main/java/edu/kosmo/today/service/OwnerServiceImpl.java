package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.OwnerMapper;
import edu.kosmo.today.vo.OrderListVO;
import edu.kosmo.today.vo.RegiGymListVO;
import edu.kosmo.today.vo.RegiGymVO;
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
	public void insertStore(RegiGymVO regiGymVO) {
		ownerMapper.registration(regiGymVO);
		log.info("OwnerServcie");
		
	}

	@Override
	public List<RegiGymListVO> getregistList() {
		
		return ownerMapper.getRegistList();
	}

	@Override
	public void remove(int storenum) {
		log.info("OwnerServcie-remove");
		
		ownerMapper.deleteRegist(storenum);
	}
	
}

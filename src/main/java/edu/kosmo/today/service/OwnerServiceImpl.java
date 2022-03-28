package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.OwnerMapper;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.GymListVO;
import edu.kosmo.today.vo.OrderListVO;
import edu.kosmo.today.vo.RegiGymListVO;
import edu.kosmo.today.vo.RegiGymVO;
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
	public void insertStore(RegiGymVO regiGymVO) {
		ownerMapper.registration(regiGymVO);
		log.info("OwnerServcie");
		
	}

	@Override
	public List<RegiGymListVO> getregistList(int mnum) {
		System.out.println("헬스장 신청 목록");
		return ownerMapper.getRegistList(mnum);
	}

	@Override
	public void remove(int storenum) {
		log.info("OwnerServcie-remove");
		
		ownerMapper.deleteRegist(storenum);
	}
	
	@Override
	public List<TrainerVO> getTrainer(int mnum) {
		System.out.println("트레이너 목록가져오는 중 - 오너");
		
		List<TrainerVO> list = ownerMapper.getTrainer(mnum);
		
		return list;
	}

	@Override
	public void registerTrainer(TrainerVO vo) {
		System.out.println("트레이너 등록중--"+vo);
		
		ownerMapper.insertTrainer(vo);		
	}

	@Override
	public void updateTrainer(TrainerVO vo) {
		System.out.println("트레이너 정보 수정중....");
		
		ownerMapper.updateTrainer(vo);
	}

	@Override
	public void deleteTrainer(TrainerVO vo) {
		System.out.println("트레이너 삭제중..."+vo);
		
		ownerMapper.deleteTrainer(vo);
	}

	@Override
	public int getGymTotal(int mnum) {
		System.out.println("오너 소유 헬스장 갯수");
		return ownerMapper.getGymTotal(mnum);
	}

	@Override
	public List<GymListVO> getGym(Criteria criteria,int mnum) {
		System.out.println("오너 소유 헬스장 ");
		return ownerMapper.getGym(criteria, mnum);
	}

	@Override
	public int getGnum(String gname) {
		System.out.println("헬스장 번호 구하는중...오너");
		
		String serch = "%"+gname+"%";
		
		return ownerMapper.getGnum(serch);
	}			


	

}

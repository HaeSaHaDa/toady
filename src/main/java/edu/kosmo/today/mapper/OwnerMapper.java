package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.GymListVO;
import edu.kosmo.today.vo.OrderListVO;
import edu.kosmo.today.vo.RegiGymListVO;
import edu.kosmo.today.vo.RegiGymVO;
import edu.kosmo.today.vo.TrainerVO;

@Mapper
public interface OwnerMapper {

	public List<OrderListVO> getOrderList(int mnum); // 회원번호를 이용하여 로그인한 회원의 구매관련 정보를 가져온다

	public void memberDelete(int mnum); // 헬스장 오너페이지 회원 탈퇴

	public void registration(RegiGymVO regiGymVO); // 헬스장 등록 신청

	public List<RegiGymListVO> getRegistList(int mnum); // 헬스장 등록 신청 목록

	public void deleteRegist(int storenum);

	public List<TrainerVO> getTrainer(int mnum); // 트레이너목록가져오기

	public void insertTrainer(TrainerVO vo);// 트레이너 등록

	public void updateTrainer(TrainerVO vo); // 트레이너 정보 갱신

	public void deleteTrainer(TrainerVO vo);
	
	public int getGymTotal(int mnum);//오너 헬스장 총 수

	public List<GymListVO> getGym(@Param("criteria") Criteria criteria, @Param("mnum") int mnum);//헬스장 페이징

	public int getGnum(String serch);
}

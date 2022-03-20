package edu.kosmo.today.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.MemberInfoMapper;
<<<<<<< HEAD
import edu.kosmo.today.vo.MemberVO;
=======
import edu.kosmo.today.vo.UserVO;
>>>>>>> 44c3f050df83ab8f9b078ff5e96e8d90ea7b9370
import lombok.extern.slf4j.Slf4j;

// 스프링 부트에서는 log4j가 아니라 @Slf4j 사용한다. 개선된 버전
@Slf4j
@Service
public class MemberInfoServiceImpl implements MemberInfoService{
	
	@Autowired
	private MemberInfoMapper memberInfoMapper ;

	@Override
	public int getInfoNum(String mid) {
		
		return memberInfoMapper.getMemberInfoNum(mid);
	}

	@Override
	public UserVO getInfoList(int mnum) {
		
		return memberInfoMapper.getMemberInfoList(mnum);
	}

	@Override
	public void memberInfoModify(UserVO memberVO) {
		memberInfoMapper.memberInfoUpdate(memberVO);		
	}


	@Override
	public void remove(String mid) {
		memberInfoMapper.delete(mid);
		
	}

	@Override
	public void authDelete(String mid) {
		memberInfoMapper.authDelete(mid);
	}

}

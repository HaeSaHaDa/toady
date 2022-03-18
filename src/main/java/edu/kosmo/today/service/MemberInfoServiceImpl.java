package edu.kosmo.today.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.MemberInfoMapper;
import edu.kosmo.today.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

// 스프링 부트에서는 log4j가 아니라 @Slf4j 사용한다. 개선된 버전
@Slf4j
@Service
public class MemberInfoServiceImpl implements MemberInfoService{
	
	@Autowired
	private MemberInfoMapper memberInfoMapper ;

	@Override
	public int getInfoNum(String memail) {
		
		return memberInfoMapper.getMemberInfoNum(memail);
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
	public void remove(String memail) {
		memberInfoMapper.delete(memail);
		
	}

	@Override
	public void authDelete(String memail) {
		memberInfoMapper.authDelete(memail);
	}

}

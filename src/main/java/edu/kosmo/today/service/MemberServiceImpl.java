package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.MemberMapper;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.NoteVO;
import edu.kosmo.today.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

// 스프링 부트에서는 log4j가 아니라 @Slf4j 사용한다. 개선된 버전
@Slf4j
@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper ;
	
	@Override
	public List<UserVO> getList() {
		log.info("getList()..");
		return memberMapper.getList();
	}

	@Override
	public UserVO get(int mnum) {
		log.info("get()..");
		return memberMapper.read(mnum);
	}

	@Override
	public void remove(int mnum) {
		log.info("remove()..");
		memberMapper.delete(mnum);
	}

	@Override
	public int getTotal() {
		
		log.info("getTotal()..");	
		return memberMapper.getTotalCount();
	}


	@Override
	public List<UserVO> getListPage(Criteria criteria) {
		log.info("getListPage() ..");
		return memberMapper.getListPage(criteria);
	}


	@Override
	public void modify(UserVO memberVO) {
		memberMapper.update(memberVO);
	}

	
	@Override
	public void nboardRegister(NoteVO noteVO) {
		memberMapper.nboardinsert(noteVO);
	}	
}

package edu.kosmo.today.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.kosmo.today.mapper.HelpBoardMapper;
import edu.kosmo.today.mapper.MemberMapper;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.NoteVO;
import lombok.extern.slf4j.Slf4j;

// 스프링 부트에서는 log4j가 아니라 @Slf4j 사용한다. 개선된 버전
@Slf4j
@Service
public class HelpBoardImpl implements HelpBoardService{
	
	@Autowired
	private HelpBoardMapper helpBoardMapper ;

	@Override
	public int getBoardMemberNum(String memail) {
		
		return helpBoardMapper.getBoardMemberNum(memail);
	}

	@Override
	public List<NoteVO> getBoardList(int mnum) {
		// TODO Auto-generated method stub
		return helpBoardMapper.getBoardList(mnum);
	}

	@Override
	public MemberVO HelpBoardMemberRead(int mnum) {
		// TODO Auto-generated method stub
		return helpBoardMapper.HelpBoardMemberRead(mnum);
	}

	@Override
	public void hboardRegister(NoteVO NoteVO) {
		helpBoardMapper.hboardinsert(NoteVO);
		
	}

	@Override
	public List<NoteVO> getHelpBoardPage(Criteria criteria) {
		
		return helpBoardMapper.getHelpBoardPage(criteria);
	}

	@Override
	public int getHelpBoardTotalCount() {
		
		return helpBoardMapper.getHelpBoardTotalCount();
	}
		
		

	
}

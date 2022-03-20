package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.NoteMapper;
import edu.kosmo.today.vo.NoteVO;
import lombok.extern.slf4j.Slf4j;

// 스프링 부트에서는 log4j가 아니라 @Slf4j 사용한다. 개선된 버전
@Slf4j
@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private NoteMapper noteMapper ;

	@Override
	public int getMemberNum(String memail) {
		return noteMapper.getMemberNum(memail);
	}

	@Override
	public List<NoteVO> getNoteList(int mnum) {
		return noteMapper.getNoteList(mnum);
	}		
}

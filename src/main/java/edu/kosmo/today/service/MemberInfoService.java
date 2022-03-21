package edu.kosmo.today.service;

import java.util.List;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.AuthVO;
import edu.kosmo.today.vo.MemberVO;


public interface MemberInfoService {
	public int getInfoNum(String memail);
	public MemberVO getInfoList(int mnum);	
	void memberInfoModify(MemberVO memberVO); 
	
	public void authDelete(String memail);
	public void remove(String memail); 
}

package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;

/*
 * 0311 faq관리
 */

@Mapper
public interface FaqMapper {

	//글 갯수(페이징)
	public int getTotal();
	//faq글 목록
	public List<FaqVO> faqList(Criteria criteria);

}

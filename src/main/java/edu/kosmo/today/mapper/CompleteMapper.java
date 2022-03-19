package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import edu.kosmo.today.vo.CompleteVO;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;

/*
 * 0302 김보람 찜기능 mapper
 */

@Mapper
public interface CompleteMapper {
	
	//찜에 이용권 담기
	public void insertcomplete(CompleteVO completevo);
	

}

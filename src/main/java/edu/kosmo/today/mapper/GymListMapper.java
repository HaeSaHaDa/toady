package edu.kosmo.today.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.GymListVO;

@Mapper
public interface GymListMapper {
	//@Select("select * from gympage")
	List<GymListVO> getGymLists();//gympage조회

	GymListVO read(int gnum);

	//@Insert("insert into gympage (gnum, mnum, gname, gcategory, gadress, gphone, ginform, gtime, gfacility, gsns, imagename) values (gnum_seq.nextval, #{mnum}, #{gname}, #{gcategory}, #{gadress}, #{gphone}, #{ginform}, #{gtime}, #{gfacility}, #{gsns}, #{imagename})")
	void addGymList(GymListVO gymlist);

	//@Delete("delete from gympage where gnum = #{gnum}")
	void deleteGymList(int gnum); 

	
	//@Select("select * from gympage where gnum=#{gnum}")
	GymListVO correctGymList(int gnum);
	
	
	//@Update("update gympage set mnum = #{mnum}, gname = #{gname}, gcategory = #{gcategory}, "
	//		+ "g: = #{gadress}, gphone = #{gphone}, ginform = #{ginform}, gtime = #{gtime}, "
	//		+ "gfacility = #{gfacility}, gsns = #{gsns}, imagename = #{imagename} where gnum = #{gnum}")
	void updateGymList(GymListVO gymlist);

	List<GymListVO> search(String keyword);

	List<GymListVO> getPrGymList();//home페이지 헬스장 광고 리스트
	
}

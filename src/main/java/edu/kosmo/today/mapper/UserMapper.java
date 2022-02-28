package edu.kosmo.today.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import edu.kosmo.today.vo.UserVO;



@Mapper
public interface UserMapper {
	
	   public UserVO getUser(String memail);   
	   
	   @Insert("insert into member(mnum,memail,mpassword,mnickname, mphone, mbirth) values(member_seq.nextval,#{memail},#{mpassword},#{mnickname},#{mphone},#{mbirth})")
	   public int save(UserVO userVO);
	   
	   @Insert("insert into AUTHORITY (memail,auth) values(#{memail},'ROLE_USER')")
	   public void insertAuthority(UserVO UserVO);
	   

}

package edu.kosmo.today.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.kosmo.today.vo.AuthVO;
import edu.kosmo.today.vo.UserVO;

@Mapper
public interface UserMapper {

	public UserVO getUser(String mid);

	@Select("select * from authority where mid = #{mid}")
	public AuthVO findAuth(String mid);
	
	@Insert("insert into member(mnum,mid,memail,mpassword,mnickname, mphone, mbirth) values(member_seq.nextval,#{mid},#{memail},#{mpassword},#{mnickname},#{mphone},#{mbirth})")
	public void save(UserVO userVO);

	@Insert("insert into member(mnum,mid,memail, social) values(member_seq.nextval,#{mid},#{memail},1)")
	public void socialSave(UserVO userVO);
	

	@Insert("insert into AUTHORITY (mid,auth) values(#{mid},'ROLE_USER')")
	public void insertAuthority(UserVO UserVO);


	@Update("update  member set mnickname=#{mnickname}, mphone=#{mphone}, mbirth=#{mbirth}, memail=#{memail} where mnum=#{mnum}")
	public void update(UserVO user);

	@Update("update  member set mpassword=#{mpassword} where mnum=#{mnum}")
	public void updatePassword(UserVO user);



}

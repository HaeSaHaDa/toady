package edu.kosmo.today.cotroller.security.principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.vo.UserVO;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service //Bean 등록
public class UserCustomDetailService implements UserDetailsService{
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;
	

	@Override
	public UserDetails loadUserByUsername(String mid) throws UsernameNotFoundException {
		System.out.println("UserDetailsService 시작===================================================");
		System.out.println("아이디: " + mid);

		System.out.println("찾아라");
		
		log.warn(mid);
		UserVO userVO = userMapper.getUser(mid);
		if (userVO != null) {
			System.out.println("프린시펄생성");
			System.out.println("객체를 생성하자!!" + userVO);
			return new UserCustomDetails(userVO);

		} else {
			return null;
		}

	}
}

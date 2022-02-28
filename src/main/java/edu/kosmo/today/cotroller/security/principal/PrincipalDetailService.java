package edu.kosmo.today.cotroller.security.principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.vo.UserVO;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
@Slf4j//스프링부트는 Slf4j
@Service //Bean 등록
public class PrincipalDetailService implements UserDetailsService{
	
	@Autowired
	private UserMapper userMapper;

	//스프링이 로그인 요청을 가로챌 때, username,password변수 2개를 가로채는데 
	//password 부분 비교는 new PrincipalDetail을 리턴할 때, 
	//SecurityConfig.java에서 호출한
	//auth.userDetailsService(principalDetailService).passwordEncoder(encodePWD()); 가 비밀번호 비교를 해줌.
	//우리는 username이 DB에 있는지만 확인해주면 됨. 확인은 이 함수에서 함. 
	@Override
	public UserDetails loadUserByUsername(String memail) throws UsernameNotFoundException {
		//findByUsername은 //SELECT * FROM user WHERE username=?; 실행 함수.
		System.out.println("이메일은 여기" + memail);
		System.out.println("찾아라");
		log.warn("찾아라");
		UserVO principal = userMapper.getUser(memail);
		
		System.out.println("찾았다.");
		System.out.println(principal);
		return principal == null ? null : new PrincipalDetail(principal); //메서드 리턴 타입이 UserDetails. 그래서 PrincipalDetail()을 리턴하면 되.
													//=> PrincipalDetail()에 user
	}

}

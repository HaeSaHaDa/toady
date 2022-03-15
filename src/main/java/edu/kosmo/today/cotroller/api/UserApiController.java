package edu.kosmo.today.cotroller.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetailService;
import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.dto.ResponseDto;
import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.userservice.UserService;
import edu.kosmo.today.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class UserApiController {

	@Autowired
	private UserCustomDetailService detailService;

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private UserService userService;

	@Autowired
	private AuthenticationManager authenticationManager;

	@PostMapping("/common/signProc")
	public ResponseDto<Integer> save(@RequestBody UserVO user) {

		System.out.println("UserApiController: 호출됨-회원가입");
		userService.adduser(user);
		// (정상적인 연결인지, DB에 insert 하고나서 리턴된 결과값을 넣을 거.)
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);// 자바 객체를 JSON으로 변환해서 리턴(Jackson)
	}

	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody UserVO user, HttpSession session, HttpServletRequest request) {
		userService.updateMember(user);
		// 여기서는 트랜잭션이 종료, DB에 값은 변경이 됐음
		// 하지만 세션 값은 변경이 되지 않음. 우리가 직접 세션 값을 변경해 줄 것.
		// 스프링 시큐리티가 어떻게 로그인 되는지, 로그인 될 때 세션이 어떻게 만들어 지는지 개념이 필요.
		System.out.println("3. 서비스 종료. Authentication: " + user);
		String username = user.getMid();

		System.out.println("=======시큐리티 세션 생성=================================");
		
		 UserCustomDetails principaluser = (UserCustomDetails)  detailService.loadUserByUsername(username);


			Authentication authentication
			= authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(principaluser.getUsername(), principaluser.getPassword(), principaluser.getAuthorities()));

		//Authentication b = authenticationManager.authenticate(authentication);
		//System.out.println("authenticationManager는 살아 있을까???");

		SecurityContext securityContext = SecurityContextHolder.getContext();
        securityContext.setAuthentication(authentication);

		session = request.getSession(true);
		System.out.println("세션");
        session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
	
		System.out.println("=======시큐리티 세션 생성 종료==============================");

		/*
		 * Authentication authentication = new
		 * UsernamePasswordAuthenticationToken(user.getMemail(), user.getMpassword());
		 * authenticationManager.authenticate(authentication);
		 * System.out.println("Authentication - 토큰 생성"); SecurityContext securityContext
		 * = SecurityContextHolder.getContext();
		 * securityContext.setAuthentication(authentication);
		 */

		// 세션 안에 수정한 내용을 넣는 코드

		// HttpSession이 존재하면 현재 HttpSession을 반환하고, 존재하지 않으면 새로 세션 만드는 코드

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}


	@PutMapping("/user/password")
	public ResponseDto<Integer> passwordupdate(@RequestBody UserVO user) {
		System.out.println("mnum: " + user.getMnum());

		userService.updatePassword(user);
		// 여기서는 트랜잭션이 종료, DB에 값은 변경이 됐음
		// 하지만 세션 값은 변경이 되지 않음. 우리가 직접 세션 값을 변경해 줄 것.
		// 스프링 시큐리티가 어떻게 로그인 되는지, 로그인 될 때 세션이 어떻게 만들어 지는지 개념이 필요.
		
		String username = user.getMid();
		String password = user.getMpassword();
		UserCustomDetails principaluser = (UserCustomDetails) detailService.loadUserByUsername(username);
		
		System.out.println("배드 크리덴셜은 왜 날까???" + principaluser.getUsername());
		System.out.println("배드 크리덴셜은 왜 날까???" + principaluser.getPassword());
		System.out.println("배드 크리덴셜은 왜 날까???" + principaluser.getAuthorities());


		Authentication authentication = new UsernamePasswordAuthenticationToken(principaluser.getUsername(), principaluser.getPassword(),
				principaluser.getAuthorities());
		System.out.println("어덴시케이션은 생성됐을까???; " + authentication);
		System.out.println("배드 크리덴셜은 났을까??" + user.getMpassword());
		System.out.println("배드 크리덴셜은 났을까??" + authentication.getPrincipal());

		authenticationManager.authenticate(authentication);

		System.out.println("authenticationManager는 살아 있을까???");
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
}

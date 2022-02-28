package edu.kosmo.today.cotroller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import edu.kosmo.today.dto.ResponseDto;
import edu.kosmo.today.userservice.UserService;
import edu.kosmo.today.vo.UserVO;

@RestController
public class UserApiController {
	
	@Autowired
	private  UserService userService;
	
	@PostMapping("/common/signProc")
	public ResponseDto<Integer> save(@RequestBody UserVO user) {
		
		System.out.println("UserApiController: 호출됨-회원가입");
		userService.adduser(user);
		//(정상적인 연결인지, DB에 insert 하고나서 리턴된 결과값을 넣을 거.)
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);//자바 객체를 JSON으로 변환해서 리턴(Jackson)
	}

}

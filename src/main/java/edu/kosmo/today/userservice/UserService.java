package edu.kosmo.today.userservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Transactional
	public UserVO findUser(String mid) {

		System.out.println("찾는 사람 : " + mid);
		return userMapper.getUser(mid);
	}
	
	// 회원가입
	@Transactional
	public void adduser(UserVO user) {
		String rawPassword = user.getMpassword();// 1234원래 pw
		String encPassword = encoder.encode(rawPassword);// 해쉬화 pw
		System.out.println("해쉬화 된 비밀번호: " + encPassword);
		user.setMpassword(encPassword);

		userMapper.save(user);
		userMapper.insertAuthority(user);
	}


	// 회원 정보 수정
	@Transactional
	public void updateMember(UserVO user) {
		System.out.println("2. 업데이트 가즈아.");
		System.out.println("유저 수정 정보: " + user);
		userMapper.update(user);
	}

	// 회원 비밀번호 수정
	@Transactional
	public void updatePassword(UserVO user) {
		String rawPassword = user.getMpassword();// 1234원래 pw
		String encPassword = encoder.encode(rawPassword);// 해쉬화 pw
		user.setMpassword(encPassword);
		System.out.println(user.getMpassword());
		System.out.println(user);

		userMapper.updatePassword(user);

		System.out.println(user.getMpassword());
	}

}

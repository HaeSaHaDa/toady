package edu.kosmo.today.userservice;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.vo.UserVO;

@Service
public class UserService {
	   @Autowired
	   private UserMapper userMapper;
	   
		
		 @Autowired private BCryptPasswordEncoder encoder;
		
		
		@Transactional
		public void adduser(UserVO user) {
			String rawPassword = user.getMpassword();//1234원래 pw
			String encPassword= encoder.encode(rawPassword);//해쉬화 pw
			System.out.println("해쉬화 된 비밀번호: " + encPassword);
			user.setMpassword(encPassword);
			

			userMapper.save(user);
			userMapper.insertAuthority(user);
		}

}

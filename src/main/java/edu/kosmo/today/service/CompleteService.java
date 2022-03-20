package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.today.mapper.CompleteMapper;
import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.mapper.WishMapper;
import edu.kosmo.today.vo.CompleteVO;
import edu.kosmo.today.vo.UserVO;
import edu.kosmo.today.vo.WishVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 찜기능을 위한 Service작성 0302(김보람)
 * */

@Slf4j
@Service
public class CompleteService {

   @Autowired
   private CompleteMapper mapper; // 찜기능을 위한 mapper

   public void successpay(CompleteVO complete) {   
	   
	   
	   mapper.insertcomplete(complete);
   }

}
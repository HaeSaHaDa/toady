package edu.kosmo.today.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kosmo.today.mapper.WishMapper;
import edu.kosmo.today.vo.WishVO;
import lombok.extern.slf4j.Slf4j;

/*
 * 찜기능을 위한 Service작성 0302(김보람)
 * */

@Slf4j
@Service
public class WishService {

   @Autowired
   private WishMapper mapper; // 찜기능을 위한 mapper


	public int getMemberNum(String mid) {
		log.info("getMemberNum" + mid + "의 회원번호 가져오는 중");

		return mapper.getMemberNum(mid);
	}
	
	//찜 목록을 가져오는 서비스
	public List<WishVO> getWishList(int mnum) {
		log.info("getWishList...");
		log.info(mnum + "의 찜목록을 불러오는중");

      List<WishVO> list = mapper.getWishList(mnum);

      return list;
   }
   //찜 목록의 최종가격을 가져오는 서비스
   public List<Integer> getPriceWish(int mnum){
      log.info(mnum+"의 장바구니 가격구하는중..");
      
      List<Integer> price = mapper.priceList(mnum);
      
      return price;
   }
   

   // 찜 이용권 삭제 서비스
   @Transactional
   public int deleteWishTicket(int wishNum) {
      log.info(wishNum + "번의 이용권 삭제중");

      return mapper.deleteWishTicket(wishNum);
   }

   // 찜 목록 전체 삭제 서비스
   public void deleteWishList(int mnum) {
      log.info(mnum+"회원의 찜목록 전체 삭제중...");
      
      mapper.deleteWishList(mnum);
   }
   
   //찜 수량 수정 
   public void updateWishList(WishVO vo) {
      log.info("수량수정중..");
      
      mapper.updateWishList(vo);
   }
   
   //찜에 이용권 담기
   public void insertWish(int mnum,int tnum) {
      log.info("이용권 담는 중..."+mnum,tnum);
      
      int check = mapper.checkWish(mnum, tnum);
      
      if(check == 0) {
         mapper.insertWish(mnum, tnum);
      }else {
         mapper.updateWish(mnum, tnum);
      }
      
      
   }

}
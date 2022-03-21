package edu.kosmo.today.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosmo.today.mapper.GymListMapper;
import edu.kosmo.today.vo.GymListVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class GymListServiceImpl implements GymListService {
	
	@Autowired 
	private GymListMapper gymListMapper; //의존성 주입해서 받고 

	@Override
	public List<GymListVO> getGymLists() { //메소드 호출 
		return gymListMapper.getGymLists();
	}

	@Override
	public void addGymList(GymListVO gymListVO) {
		log.info("addGymList()...");
		gymListMapper.addGymList(gymListVO);
	}

	@Override
	public void deleteGymList(int gnum) {
		log.info("deleteGymList()...");
		gymListMapper.deleteGymList(gnum);
	}

	@Override
	public GymListVO getGymListByGnum(int gnum) {
		log.info("getGymListByGnum()...");
		return gymListMapper.correctGymList(gnum);
	}

	@Override
	public void updateGymList(GymListVO gymListVO) {
		gymListMapper.updateGymList(gymListVO);
		
	}

}
	
	/*
	 * @Autowired private GymListMapper gymListMapper;
	 * 
	 * @Override public GymListVO getGymListByGnum(int gnum) {
	 * log.info("getGymListByGnum() ..");
	 * 
	 * return gymListMapper.read(gnum);
	 * 
	 * }
	 * 
	 * 
	 * @Override public List<GymListVO> getList() {
	 * 
	 * log.info("getList() .."); return gymListMapper.getList(); }
	 * 
	 * @Override public void addGymList(GymListVO gymListVO) {
	 * log.info("addGymList() .."); gymListMapper.insert(gymListVO);
	 * 
	 * }
	 * 
	 * 
	 * @Override public void deleteGymList(int gnum) { log.info("remove() ..");
	 * gymListMapper.delete(gnum);
	 * 
	 * }
	 * 
	 * @Override public void updateGymList(GymListVO GymListVO) {
	 * log.info("updateGymList() .."); gymListMapper.update(GymListVO);
	 * 
	 * }
	 */

	/*
	 * @Override public void insertGymListImage(GymListVO gymListVO, MultipartFile
	 * file, String savePath) { log.info("insertGymListImage() ..");
	 * 
	 * String fileName = file.getOriginalFilename(); log.info("fileName : " +
	 * fileName); String basePath = "http://localhost:8282/resources/img/"; String
	 * imgSavePath = basePath + fileName; gymListVO.setFilename(fileName);
	 * gymListVO.setFilepath(imgSavePath); log.info("gymListVO : " + gymListVO);
	 * 
	 * File saveFile = new File(savePath, fileName); try {
	 * file.transferTo(saveFile); } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * gymListMapper.insert(gymListVO);
	 * 
	 * 
	 * }
	 */
	
	


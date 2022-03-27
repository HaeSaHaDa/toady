package edu.kosmo.today.service;

import java.util.List;

import edu.kosmo.today.vo.GymListVO;

public interface GymListService {

	// void insertGymListImage(GymListVO gymListVO, MultipartFile files, String
	// savePath);
	List<GymListVO> getGymLists();
	
	List<GymListVO> getAdGymList();

	void addGymList(GymListVO gymListVO);

	void deleteGymList(int gnum);

	GymListVO getGymListByGnum(int gnum); // update단에서 필요로 함.

	void updateGymList(GymListVO gymListVO);

}

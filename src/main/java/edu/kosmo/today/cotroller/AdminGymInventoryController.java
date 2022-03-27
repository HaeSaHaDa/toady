package edu.kosmo.today.cotroller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.page.Criteria;
import edu.kosmo.today.page.PageVO;
import edu.kosmo.today.service.FaqService;
import edu.kosmo.today.service.GymListService;

import edu.kosmo.today.service.GymService;
import edu.kosmo.today.service.MemberService;
import edu.kosmo.today.service.OrderService;
import edu.kosmo.today.vo.FaqVO;
import edu.kosmo.today.vo.GymListVO;
import edu.kosmo.today.vo.MemberVO;
import edu.kosmo.today.vo.NoteVO;
import edu.kosmo.today.vo.TicketVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminGymInventoryController {
	
	@Autowired
	private GymListService gymListService;
	
	@Autowired
	private GymService gymService;
	
	@RequestMapping
	public String adminPage() {
		return "admin";
	}
//=========================경로설정 해 주세요. start==============================	
	@RequestMapping(value="/gymListInventory", method=RequestMethod.GET)
	public String getGymLists(Model model) {
		List<GymListVO> gymLists = gymListService.getGymLists();//getGymLists에서 직접가져와서
		model.addAttribute("gymLists", gymLists);// 추가후에 그 값을 모델에 저장함
		return "/admin/gymListInventory"; // view의 jsp name
	}
	
	@RequestMapping(value="/gymListInventory/addGymList", method=RequestMethod.GET) //getmethod
	public String addGymList(Model model) {
		
		
		GymListVO gymListVO =new GymListVO();
		model.addAttribute("gymListVO", gymListVO);
		
		return "/admin/addGymList";//"addGymList"; //gym의 내용을 새로 입력 하는 addGymList.jsp
		
	}
	
	@RequestMapping(value="/gymListInventory/addGymList", method=RequestMethod.POST) //postmethod
	public String addGymListPost(GymListVO gymListVO, HttpServletRequest request,Model model) {
		///today_gym/src/main/resources/img			
		
				MultipartFile gymimage = gymListVO.getGymimage();
				
				Path savePath =Paths.get("C:\\Users\\kosmo\\git\\toady\\src\\main\\resources\\static\\img\\"+gymimage.getOriginalFilename());
				
				System.out.println("업로드경로"+savePath);
				
				if(gymimage.isEmpty()==false) {
					System.out.println("-------------file upload--------");
					System.out.println("imagename:"+gymimage.getName());
					System.out.println("realname:"+gymimage.getOriginalFilename());
					System.out.println("size:"+gymimage.getSize());
					System.out.println("savePath :"+savePath);
					System.out.println("-----------upload End------------");
				}
				
				
				if(gymimage != null && !gymimage.isEmpty() ) {
					try {
						gymimage.transferTo(new File(savePath.toString()));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}//디렉토리에 저장후 
				gymListVO.setImagename(gymimage.getOriginalFilename());//DB에 파일네임 
				gymListService.addGymList(gymListVO);
				model.addAttribute("gymListVO", gymListVO); //모델에 넣어주는 작업까지이
		return "redirect:/admin/gymListInventory";
	}

	
	
	@RequestMapping(value="/gymListInventory/deleteGymList/{gnum}", method=RequestMethod.GET)
	public String deleteGym(@PathVariable int gnum, HttpServletRequest request) {//spring에서 gnum 자동으로 넣어줌.
		
		GymListVO gymListVO =gymListService.getGymListByGnum(gnum);//gnum을 바탕으로 가져옴. 
		//delete할 때 사진도 삭제 되어야 하므로 필요함. 
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Path savePath =Paths.get("C:\\Users\\kosmo\\git\\toady\\src\\main\\resources\\static\\img\\"+gymListVO.getImagename());
		
		System.out.println("업로드경로"+savePath);
		
		if(Files.exists(savePath)) {
			try {
				Files.delete(savePath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		gymListService.deleteGymList(gnum);
		return "redirect:/admin/gymListInventory";
	}
	
	
	//gnum을 통해 해당되는 내용을 다 보여줘야하는 update
	@RequestMapping(value="/gymListInventory/updateGymList/{gnum}", method=RequestMethod.GET)
	public String updateGym(@PathVariable int gnum, Model model, ModelAndView mav) {//spring에서 gnum 자동으로 넣어줌.
		
		GymListVO gymListVO =gymListService.getGymListByGnum(gnum);
		model.addAttribute("gymListVO", gymListVO);

		return "admin/updateGymList";
	}
	
	@RequestMapping(value="/gymListInventory/updateGymList", method=RequestMethod.POST) //postmethod
	public String updateGymListPost(GymListVO gymListVO, HttpServletRequest request) {
		
		MultipartFile gymimage = gymListVO.getGymimage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Path savePath =Paths.get("C:\\Users\\kosmo\\git\\toady\\src\\main\\resources\\static\\img\\"+gymimage.getOriginalFilename());
		
		System.out.println("업로드경로"+savePath);
		
		if(gymimage.isEmpty()==false) {
			System.out.println("-------------file upload--------");
			System.out.println("imagename:"+gymimage.getName());
			System.out.println("realname:"+gymimage.getOriginalFilename());
			System.out.println("size:"+gymimage.getSize());
			System.out.println("savePath :"+savePath);
			System.out.println("-----------upload End------------");
		}
		
		if(gymimage != null && !gymimage.isEmpty() ) {
			try {
				gymimage.transferTo(new File(savePath.toString()));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//디렉토리에 저장후 
		gymListVO.setImagename(gymimage.getOriginalFilename());//DB에 파일네임 
		
		gymListService.updateGymList(gymListVO);

		return "redirect:/admin/gymListInventory";
	}

	//쿠폰 리스트 =====================
	@RequestMapping(value="/ticketList/{gnum}", method=RequestMethod.GET)
	public String updateTicket(@PathVariable int gnum, Model model, ModelAndView mav) {//spring에서 gnum 자동으로 넣어줌.
		
		List<TicketVO> ticketVO =gymService.getTicketList(gnum);

		model.addAttribute("ticketVO", ticketVO);
		System.out.println("ticket 정보는??? " + ticketVO);
		return "admin/ticketList";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String search(Criteria cri, GymListVO gymListVO, Model model) {
		System.out.println("검색어 : " + gymListVO.getKeyword());
		String keyword = '%' + gymListVO.getKeyword()+'%';
		List<GymListVO> search = gymListService.search(keyword);
		model.addAttribute("gymLists", search);
		
		return "admin/searchGymListInventory";
	}
	
}
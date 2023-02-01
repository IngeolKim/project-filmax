package site.filmax.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import site.filmax.dto.reviewDTO;
import site.filmax.dto.reviewLikeDTO;
import site.filmax.service.moviesService;

@Controller
@RequestMapping("/movies/*")
public class moviesController {
	String resourcesPath = "C:\\spring2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\filmaxfile";
	@Autowired
	private moviesService service;
	
	@GetMapping("movies_Chart")		//��ü ��ȭ ������
	public String moviesChart(Model model) {
		return service.moviesList(model);
	}
	
	@GetMapping("movies_Chart2")	//���� ������ ��ȭ������
	public String moviesChart2(Model model) {
		return service.onScreenList(model);
	}
	@GetMapping("movie_detail")	//�ش翵ȭ����
	public String movieDetail(int movie_seq,Model model,reviewDTO dto2,HttpSession session,
						@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		int pageSize = 6;
		dto2.setStart((pageNum-1) * pageSize + 1);
		dto2.setEnd(pageNum * pageSize);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageNum", pageNum);
		return service.movieDetail(movie_seq,model,dto2,session);
	}
	@GetMapping("reviewPopup")	//��ȭ���� �ۼ���
	public String reviewPopup(String title, int movie_seq, Model model) {
		return service.reviewPopup(title,movie_seq,model);
	}
	@PostMapping("reviewPro")
	public String reviewPro(reviewDTO dto) {		
		return service.reviewPro(dto);
	}
	@GetMapping("reviewLike")	
	public @ResponseBody String reviewLike(reviewLikeDTO dto, HttpSession session) {
		return service.reviewLike(dto,session);
	}
	@GetMapping("updateReview")	//��ȭ���� ��� ����������
	public String updateReview(String title,int movie_seq,reviewDTO dto2, Model model) {
		return service.updateReview(title,movie_seq,dto2,model);
	}
	@PostMapping("updateReviewPro")
	public String updateReviewPro(reviewDTO dto2, Model model) {		
		return service.updateReviewPro(dto2,model);
	}
	@GetMapping("deleteReview")	//��ȭ ���� ��� ����
	public String deleteReview(int reviews_seq) {		
		return service.deleteReview(reviews_seq);
	}
	
}
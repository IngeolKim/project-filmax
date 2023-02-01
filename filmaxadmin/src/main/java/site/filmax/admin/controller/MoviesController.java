package site.filmax.admin.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import site.filmax.admin.dto.MoviesDTO;
import site.filmax.admin.dto.PosterDTO;
import site.filmax.admin.dto.ReviewDTO;
import site.filmax.admin.service.MoviesServiceImpl;



@Controller
@RequestMapping("/movies/*")
public class MoviesController {
	String resourcesPath = "C:\\spring2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\filmaxfile\\poster";
	@Autowired
	private MoviesServiceImpl service;
	@Autowired
	private ServletContext application;
	
	@GetMapping("movieMain")
	public String movieMain(MoviesDTO dto) {
		return service.movieMain(dto);
	}	
	@GetMapping("movieInsert")
	public String movieInsertForm() {
		return service.movieInsert();
	}
	@PostMapping("movieInsertPro")
	public String movieInsertPro(MoviesDTO dto,MultipartFile upload ,MultipartFile [] uploadsub, MultipartFile [] uploadstil ) {
		String path = resourcesPath;
		return service.movieInsertPro(dto,upload,uploadsub,uploadstil ,path);
		
	}
	@GetMapping("movieList")		
	public String moviesChart(Model model) {
		return service.movieList(model);
	}
	@GetMapping("movieSearch")
	public String searchList(String search, String searchValue, Model model) {		
		return service.movieSearch(search, searchValue, model);
	}
	@GetMapping("movie_detail")	//해당영화정보
	public String movieDetail(int movie_seq,Model model,ReviewDTO dto2,
						@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		int pageSize = 6;
		dto2.setStart((pageNum-1) * pageSize + 1);
		dto2.setEnd(pageNum * pageSize);
		
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageNum", pageNum);
		return service.movieDetail(movie_seq,model,dto2);
	}
	@GetMapping("movieDelete")
	public String movieDelete(int movie_seq) {
		return service.movieDelete(movie_seq);
	}
	@PostMapping("movieUpdate")
	public String movieUpdate(int movie_seq, Model model) {
		return service.movieUpdate(movie_seq,model);
	}
	@PostMapping("movieUpdatePro")
	public String movieUpdatePro(MoviesDTO dto,int movie_seq,Model model) {
		
		return service.movieUpdatePro(dto,movie_seq,model);
	}
	@RequestMapping("posterUpdate")
	public String movieUpdate(MoviesDTO dto2, PosterDTO dto,Model model) {
		return service.posterUpdate(dto2,dto,model);
	}
	@PostMapping("posterUpdatePro")
	public String movieUpdatePro(MoviesDTO dto2,PosterDTO dto,MultipartFile upload ,MultipartFile [] uploadsub, MultipartFile [] uploadstil,Model model) {
		String path = resourcesPath;
		return service.posterUpdatePro(dto2,dto,upload,uploadsub,uploadstil,model,path);
	}
	@GetMapping("movieOnList")	//현재 상영중인 영화페이지
	public String movieOnList(Model model) {
		return service.movieOnList(model);
	}
	@GetMapping("posterDelete")
	public String posterDelete(int poster_id,int movie_seq,Model model) {
		return service.posterDelete(poster_id,model,movie_seq);
	}
	@GetMapping("posterDeleteAll")
	public String posterDeleteAll(int movie_seq,Model model) {
		return service.posterDeleteAll(model,movie_seq);
	}
	@GetMapping("deleteReview")	
	public String deleteReview(int reviews_seq) {		
		return service.deleteReview(reviews_seq);
	}

}

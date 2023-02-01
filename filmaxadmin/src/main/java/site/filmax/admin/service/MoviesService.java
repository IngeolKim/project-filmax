package site.filmax.admin.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import site.filmax.admin.dto.MoviesDTO;
import site.filmax.admin.dto.PosterDTO;
import site.filmax.admin.dto.ReviewDTO;



public interface MoviesService {
	public String movieMain(MoviesDTO dto);
	public String movieInsert();
	public String movieInsertPro(MoviesDTO dto,MultipartFile upload ,MultipartFile [] uploadsub, MultipartFile [] uploadstil, String path);
	public String movieList(Model model);
	public String movieOnList(Model model);
	public String movieSearch(String search, String searchValue, Model model);
	public String movieDetail(int movie_seq,Model model,ReviewDTO dto2);
	public String movieDelete(int movie_seq);
	public String movieUpdate(int movie_seq,Model model);
	public String movieUpdatePro(MoviesDTO dto,int movie_seq,Model model);
	public String posterUpdate(MoviesDTO dto2,PosterDTO dto, Model model);
	public String posterUpdatePro(MoviesDTO dto2,PosterDTO dto,MultipartFile upload ,MultipartFile [] uploadsub, MultipartFile [] uploadstil,Model model, String path);
	public String posterDelete(int poster_id,Model model,int movie_seq);
	public String posterDeleteAll(Model model,int movie_seq);
	public String deleteReview(int reviews_seq);
}

package site.filmax.admin.service;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import site.filmax.admin.dao.MoviesMapper;
import site.filmax.admin.dto.MoviesDTO;
import site.filmax.admin.dto.PosterDTO;
import site.filmax.admin.dto.ReviewDTO;


@Service
public class MoviesServiceImpl implements MoviesService {
	String resourcesPath = "C:\\spring2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\filmaxfile\\poster";
	@Autowired
	private MoviesMapper mapper;
	
	@Override
	public String movieMain(MoviesDTO dto) {
		mapper.movieList();
		mapper.posterMain(dto.getMovie_seq());
		return "movies/movieMain";
	}
	@Override
	public String movieInsert() {
		
		return "movies/movieInsert";
	}
	@Override
	public String movieInsertPro(MoviesDTO dto,MultipartFile upload ,MultipartFile [] uploadsub, MultipartFile [] uploadstil, String path) {
		mapper.movieInsert(dto);
		int i = 0;		
		// 메인 포스터 등록
		String fileName = upload.getOriginalFilename();
		if(!fileName.equals("")) {
			String ext = fileName.substring(fileName.lastIndexOf("."));
			fileName = "movie_"+dto.getTitle()+"_"+dto.getMovie_seq()+"_main"+ext;
			File copy = new File(path+"//"+fileName);
			try {
				upload.transferTo(copy);
			}catch(Exception e) {
				e.printStackTrace();
			}
			PosterDTO posterDTO = new PosterDTO();
			posterDTO.setMovie_seq(dto.getMovie_seq());	
			posterDTO.setPoster(fileName);
			posterDTO.setLevels(1);
			mapper.posterInsert(posterDTO);
			mapper.moviePosterId(posterDTO);
		}
		
		// 서브 포스터 등록 
		for(MultipartFile mf : uploadsub) {
			fileName = mf.getOriginalFilename();
			if(!fileName.equals("")) {
				String ext = fileName.substring(fileName.lastIndexOf("."));
				// 시퀀스 poster_sub_seq 
				int seq = mapper.postseq("POSTER_SUB_SEQ");
				fileName = "movie_"+dto.getTitle()+"_"+dto.getMovie_seq()+"_sub_"+(seq)+ext;
				File copy = new File(path+"//"+fileName);
				try {
					mf.transferTo(copy);
				}catch(Exception e) {
					e.printStackTrace();
				}
				PosterDTO posterDTO = new PosterDTO();
				posterDTO.setMovie_seq(dto.getMovie_seq());	
				posterDTO.setPoster(fileName);
				posterDTO.setLevels(2);
				mapper.posterInsert(posterDTO);
				mapper.posterSeqUp("POSTER_SUB_SEQ");
				dto.setPoster_id(posterDTO.getPoster_id());		
			}			
		}
		
		// 스틸컷 포스터 등록 
		for(MultipartFile mf : uploadstil) {
			fileName = mf.getOriginalFilename();
			if(!fileName.equals("")) {
				String ext = fileName.substring(fileName.lastIndexOf("."));
				// 시퀀스 poster_sub_seq 
				int seq = mapper.postseq("POSTER_STIL_SEQ");
				fileName = "movie_"+dto.getTitle()+"_"+dto.getMovie_seq()+"_stil_"+(seq)+ext;
				File copy = new File(path+"//"+fileName);
				try {
					mf.transferTo(copy);
				}catch(Exception e) {
					e.printStackTrace();
				}
				PosterDTO posterDTO = new PosterDTO();
				posterDTO.setMovie_seq(dto.getMovie_seq());	
				posterDTO.setPoster(fileName);
				posterDTO.setLevels(3);
				mapper.posterInsert(posterDTO);
				mapper.posterSeqUp("POSTER_STIL_SEQ");
				dto.setPoster_id(posterDTO.getPoster_id());		
			}			
		}
		return "movies/movieInsertPro";
	}
	
	@Override
	public String movieList(Model model) {		
		model.addAttribute("list", mapper.movieList());	
		
		return "movies/movieList";
	}
	@Override
	public String movieOnList(Model model) {
		model.addAttribute("onScreen", mapper.onScreen());
		return "movies/movieOnList";
		
	}
	@Override
	public String movieSearch(String search, String searchValue, Model model) {
		
		model.addAttribute("list",mapper.movieSearch(search, searchValue));
		
		return "movies/movieSearch";
	}
	@Override
	public String movieDetail(int movie_seq,Model model,ReviewDTO dto2) {		
		MoviesDTO dto =  mapper.movieDetail(dto2.getMovie_seq());
		
			model.addAttribute("dto", dto);				
		
			model.addAttribute("posterMain", mapper.posterMain(movie_seq));
			model.addAttribute("posterSub", mapper.posterSub(movie_seq));
			model.addAttribute("posterStill", mapper.posterStill(movie_seq));		
			model.addAttribute("country", mapper.country(dto.getCountry_id()));
			model.addAttribute("subtitle",mapper.subtitle(dto.getSubtitle_id()));
			model.addAttribute("screening",mapper.screening(dto.getScreening_id()));
			model.addAttribute("genre",mapper.genre(dto.getGenre_id()));
			model.addAttribute("ageLimit",mapper.ageLimit(dto.getAgeLimit_id()));
			model.addAttribute("reviewCount",mapper.totalReview(dto2.getMovie_seq()));
			model.addAttribute("reviewPaging2",mapper.reviewPaging2(dto2));
									
		return "movies/movie_detail";
	}
	@Override
	public String movieDelete(int movie_seq) {
		mapper.movieDelete(movie_seq);
		return "movies/movieDelete";
	}
	@Override
	public String movieUpdate(int movie_seq,Model model) {
		MoviesDTO dto =  mapper.movieDetail(movie_seq);				
		model.addAttribute("dto", dto);				
	//	model.addAttribute("poster",mapper.poster(movie_seq));
	//	model.addAttribute("country", mapper.country(dto.getCountry_id()));
	//	model.addAttribute("poster", mapper.poster(dto.getMovie_seq()));
	//	model.addAttribute("subtitle",mapper.subtitle(dto.getSubtitle_id()));
	//	model.addAttribute("screening",mapper.screening(dto.getScreening_id()));
	//	model.addAttribute("genre",mapper.genre(dto.getGenre_id()));
	//	model.addAttribute("ageLimit",mapper.ageLimit(dto.getAgeLimit_id()));
		return "movies/movieUpdate"; 
	}
	@Override
	public String movieUpdatePro(MoviesDTO dto,int movie_seq,Model model) {
		dto.getMovie_seq();
		mapper.movieUpdate(dto);
		model.addAttribute("dto", dto.getMovie_seq());
		
		return "movies/movieUpdatePro";
	}
	@Override
	public String posterUpdate(MoviesDTO dto2, PosterDTO dto, Model model) {
		model.addAttribute("posterList",mapper.posterList(dto2.getMovie_seq()));
		model.addAttribute("moviesDTO",dto2);
		return "movies/posterUpdate";
	}
	@Override
	public String posterUpdatePro(MoviesDTO dto2,PosterDTO dto,MultipartFile upload ,MultipartFile [] uploadsub, MultipartFile [] uploadstil, Model model, String path) {
		int i = 0;		
		// 메인 포스터 등록
		String fileName = upload.getOriginalFilename();
		if(!fileName.equals("")) {
			String ext = fileName.substring(fileName.lastIndexOf("."));
			fileName = "movie_"+dto2.getTitle()+"_"+dto.getMovie_seq()+"_main"+ext;
			File copy = new File(path+"//"+fileName);
			try {
				upload.transferTo(copy);
			}catch(Exception e) {
				e.printStackTrace();
			}
			PosterDTO posterDTO = new PosterDTO();
			posterDTO.setMovie_seq(dto.getMovie_seq());	
			posterDTO.setPoster(fileName);
			posterDTO.setLevels(1);
			mapper.posterInsert(posterDTO);
			dto.setPoster_id(posterDTO.getPoster_id());		
		}
		
		// 서브 포스터 등록 
		for(MultipartFile mf : uploadsub) {
			fileName = mf.getOriginalFilename();
			if(!fileName.equals("")) {
				String ext = fileName.substring(fileName.lastIndexOf("."));
				// 시퀀스 poster_sub_seq 
				int seq = mapper.postseq("POSTER_SUB_SEQ");
				fileName = "movie_"+dto2.getTitle()+"_"+dto.getMovie_seq()+"_sub_"+(seq)+ext;
				File copy = new File(path+"//"+fileName);
				try {
					mf.transferTo(copy);
				}catch(Exception e) {
					e.printStackTrace();
				}
				PosterDTO posterDTO = new PosterDTO();
				posterDTO.setMovie_seq(dto.getMovie_seq());	
				posterDTO.setPoster(fileName);
				posterDTO.setLevels(2);
				mapper.posterInsert(posterDTO);
				mapper.posterSeqUp("POSTER_SUB_SEQ");
				dto.setPoster_id(posterDTO.getPoster_id());		
			}			
		}
		
		// 스틸컷 포스터 등록 
		for(MultipartFile mf : uploadstil) {
			fileName = mf.getOriginalFilename();
			if(!fileName.equals("")) {
				String ext = fileName.substring(fileName.lastIndexOf("."));
				// 시퀀스 poster_sub_seq 
				int seq = mapper.postseq("POSTER_STIL_SEQ");
				fileName = "movie_"+dto2.getTitle()+"_"+dto.getMovie_seq()+"_stil_"+(seq)+ext;
				File copy = new File(path+"//"+fileName);
				try {
					mf.transferTo(copy);
				}catch(Exception e) {
					e.printStackTrace();
				}
				PosterDTO posterDTO = new PosterDTO();
				posterDTO.setMovie_seq(dto.getMovie_seq());	
				posterDTO.setPoster(fileName);
				posterDTO.setLevels(3);
				mapper.posterInsert(posterDTO);
				mapper.posterSeqUp("POSTER_STIL_SEQ");
				dto.setPoster_id(posterDTO.getPoster_id());		
			}			
		}
		dto.setPoster_id(i);
		mapper.posterIdUpdate(i);
		model.addAttribute("movie_seq",dto2.getMovie_seq());
		return "movies/posterUpdatePro";
	}
	@Override
	public String posterDelete(int poster_id,Model model,int movie_seq) {
		model.addAttribute("deletedPoster",mapper.posterDelete(poster_id));
		model.addAttribute("movie_seq",movie_seq);
		return "movies/posterDelete";
	}
	@Override
	public String posterDeleteAll(Model model,int movie_seq) {
		model.addAttribute("allDeletedPoster",mapper.posterDeleteAll(movie_seq));
		model.addAttribute("movie_seq",movie_seq);
		return "movies/posterDelete";
	}
	@Override
	public String deleteReview(int reviews_seq) {
		mapper.reviewDelete(reviews_seq);
		return "movies/deleteReview";
	}

}
